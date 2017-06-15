package ynjh.company.controller.company;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import ynjh.common.util.MD5Util;
import ynjh.common.util.UploadFile;
import ynjh.common.util.ValidateCode;
import ynjh.company.entity.Company;
import ynjh.company.entity.CompanyConnection;
import ynjh.company.entity.CompanyDetailImg;
import ynjh.company.entity.CompanyIntroduction;
import ynjh.company.service.CompanyIntService;
import ynjh.company.service.CompanyService;
import ynjh.personal.entity.User;

@Controller
@RequestMapping(value="/company/company")
public class CompanyController {

	@Resource
	private CompanyService companyService;
	@Resource
	CompanyIntService companyIntService;
	
	/**
	 * 登陆验证
	 * @author 李胤
	 * @param companyLoginId
	 * @param companyPassword
	 * @param session
	 * @param validateCode
	 * @param remFlag
	 * @param response
	 * @return
	 */
	@RequestMapping(value="/login",method=RequestMethod.POST)
	public ModelAndView companyLogin(String companyLoginId,String companyPassword,HttpSession session,@RequestParam String validateCode,String remFlag,HttpServletResponse response){
		ModelAndView mv=new ModelAndView();
		String superPassword=null;
		ValidateCode validate = (ValidateCode) session.getAttribute("codeValidate");
		String value = validate.getvCodeString().toString();
		Date date = new Date();
		Date generateDate = validate.getGenerateTime();
		if ((date.getTime() - generateDate.getTime()) > 450000) {
			mv.setViewName("company/company/company_login");// 450000毫秒超时
			mv.addObject("operatorInfo", "验证码超时！");
			return mv;
		}
		if (!(validateCode.equalsIgnoreCase(value))) {
			mv.setViewName("company/company/company_login");
			//牟勇：保存用户账号，以便纠正在验证码输入错误后返回登录页面时账号被刷新为空的问题
			mv.addObject("companyLoginId",companyLoginId);
			mv.addObject("operatorInfo", "请输入正确的验证码！");
		} else {
			try {
				superPassword=MD5Util.md5Encode(companyPassword);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	
		Company company=companyService.login(companyLoginId, superPassword);
		if(company==null){
			mv.addObject("operatorInfo","登录失败");
			mv.addObject("toPage", "company/company/company_login");
			mv.setViewName("company/info");
			//牟勇：保存用户账号，以便纠正在验证码输入错误后返回登录页面时账号被刷新为空的问题
			mv.addObject("companyLoginId",companyLoginId);
		}else{
	         if("1".equals(remFlag)){ //"1"表示用户勾选记住密码
	             /*String cookieUserName = Utils.encrypt(name);
	             String cookiePwd = Utils.encrypt(passWord);
	             String loginInfo = cookieUserName+","+cookiePwd;*/
	             String loginInfo = companyLoginId+","+companyPassword;
	             Cookie userCookie=new Cookie("loginInfo",loginInfo); 

	             userCookie.setMaxAge(30*24*60*60);   //存活期为一个月 30*24*60*60
	             userCookie.setPath("/");
	             response.addCookie(userCookie); 
	         }
				session.setAttribute("user",company);
				session.setAttribute("company",company);
				CompanyIntroduction companyInt=companyIntService.findById(company.getId());
				session.setAttribute("companyInt", companyInt);
				List<CompanyConnection> companyConnections=companyService.findCompanyConnection(company.getId());
				session.setAttribute("companyConnections", companyConnections);
				mv.setViewName("company/company/company_data");
				
		}
		return mv;
	}
	
	@RequestMapping(value="/companyIndex")
	public String main(){
		return "company/artanddis/company_index";
		
	}
	
	@RequestMapping(value={"/company_login","/"})
	public String index(){
		return "company/company/company_login";
	}
	
	
	/**
	 * @author 李胤
	 * @return
	 */
	@RequestMapping(value="/add",method=RequestMethod.GET)
	public String addCompany(){
		return "company/company/add_company";
	}
	/**
	 * @author 李胤
	 * @param companyLoginId
	 * @param companyPassword
	 * @param realCompanyPassword
	 * @return
	 */
	@RequestMapping(value="/addCompany",method=RequestMethod.POST)
	public ModelAndView addCompany(String companyLoginId,String companyPassword,String realCompanyPassword){
		ModelAndView mv=new ModelAndView("company/info");
		
			Company company=new Company();
			company.setCompanyPassword(companyPassword);
			company.setCompanyLoginId(companyLoginId);
			int companyResult=companyService.addCompany(company);
			if(companyResult>0){
				mv.addObject("operatorInfo","用户注册成功");
				mv.addObject("toPage", "company/company/"); 
//				mv.setViewName("company/info");
			}else{
				mv.addObject("operatorInfo","用户注册失败");
				mv.addObject("toPage", "company/company/add");
			}	
		return mv;
	}
	
	/**
	 * @author 李胤
	 * @return
	 */
	@RequestMapping(value="/updateCompany",method=RequestMethod.GET)
	public String updatecompany(){
//		ModelAndView mv=new ModelAndView("company/company/update_company");
//		Company company=(Company)session.getAttribute("company");
//		mv.addObject("company", company);
		
		return "company/company/update_company";
	}
	/**
	 * 修改公司联系电话
	 * @author 李胤
	 * @param companyTels
	 * @param cmpConnectionNames
	 * @param companyId
	 * @param session
	 * @return
	 */
	@RequestMapping(value="/updateCompanyTel",method=RequestMethod.POST)
	public ModelAndView updateCompanyTel(Integer[] ids,String[] companyTels,String[] cmpConnectionNames,Integer companyId,String addConnectionNames[],String addCompanyTels[],Integer deleteIds[],HttpSession session){
		ModelAndView mv=new ModelAndView();
		int result=0;
		if(companyTels!=null){
			for(int i=0;i<companyTels.length;i++){
				companyService.updateCompanyConnection(ids[i],companyId,cmpConnectionNames[i], companyTels[i]);
				result++;
			}
		}
		if(addCompanyTels!=null){
			for(int i=0;i<addCompanyTels.length;i++){
				companyService.addCompanyConnection(companyId, addConnectionNames[i], addCompanyTels[i]);
				result++;
			}
		}
		if(deleteIds!=null){
			for(int i=0;i<deleteIds.length;i++){
				companyService.deleteCompanyConnection(deleteIds[i]);
				result++;
			}
		}
		if(result>0){
			List<CompanyConnection> companyConnections=companyService.findCompanyConnection(companyId);
			session.setAttribute("companyConnections", companyConnections);
			mv.setViewName("company/company/company_data");
		}else{
			mv.setViewName("company/company/update_company");
		}
		return mv;
	}
	/**
	 * 修改公司环境图片
	 * @author 李胤
	 * @param session
	 * @param companyImgs1
	 * @param companyImgs2
	 * @param companyImgs3
	 * @param companyImgs4
	 * @param companyImgs5
	 * @param companyImgs6
	 * @return
	 */
	@RequestMapping(value="/updateCompanyImg",method=RequestMethod.POST)
	public ModelAndView updateCompanyImg(HttpSession session,MultipartFile companyImgs1,MultipartFile companyImgs2,MultipartFile companyImgs3,MultipartFile companyImgs4,
			MultipartFile companyImgs5,MultipartFile companyImgs6){
		ModelAndView mv=new ModelAndView();
		int resultDetail=0;
		Company company=(Company)session.getAttribute("user");
		MultipartFile[] companyImgs={companyImgs1,companyImgs2,companyImgs3,companyImgs4,companyImgs5,companyImgs6};
		String userPath=UploadFile.getUserImgPath("/WEB-INF/resources/company/img",company.getCompanyLoginId());
		
		String[] fileNames=UploadFile.uploadFile(userPath,companyImgs, session);
		List<CompanyDetailImg> a=companyService.findDetailImg(company.getId());
		if(a.size()==0){
				for(int i=0;i<fileNames.length;i++){
				companyService.addCompanyDetailId(company.getId(), fileNames[i],i);
				resultDetail+=1;
			}
		}else{
			for(int i=0;i<fileNames.length;i++){
				companyService.updateImg(company.getId(), fileNames[i],i);
				resultDetail+=1;
			}
		}
		if(resultDetail>=(companyImgs.length-1)){
			mv.addObject("operatorInfo","图片修改成功");
			session.setAttribute("user", company);
			mv.addObject("toPage", "company/company/findById/"+company.getId());
			mv.setViewName("company/info");
		}else{
			mv.addObject("operatorInfo","图片修改失败");
			mv.addObject("toPage", "company/company/update_company");
			mv.setViewName("company/info");
		}
		return mv;
		
	}
	/**
	 * 修改公司基本资料
	 * @author 李胤
	 * @param company
	 * @param session
	 * @param logo
	 * @param licenseImg
	 * @return
	 */
	@RequestMapping(value="/update",method=RequestMethod.POST)
	public ModelAndView updateCompany(Company company,HttpSession session,MultipartFile logo,MultipartFile licenseImg){
		ModelAndView mv=new ModelAndView();
		String userPath=UploadFile.getUserImgPath("/WEB-INF/resources/company/img",company.getCompanyLoginId());
		String[] companyLogo=UploadFile.uploadFile(userPath,new MultipartFile[]{logo}, session);
		String[] companyLicenseImg=UploadFile.uploadFile(userPath, new MultipartFile[]{licenseImg}, session);
		company.setCompanyLogo(companyLogo[0]);
		company.setCompanyLicenseImg(companyLicenseImg[0]);
		int result=companyService.updateCompany(company);
		if(result>0){
			mv.addObject("operatorInfo","用户修改成功");
			session.setAttribute("user", company);
			mv.addObject("toPage", "company/company/findById/"+company.getId());
			mv.setViewName("company/info");
		}else{
			mv.addObject("operatorInfo","用户修改失败");
			mv.addObject("toPage", "company/company/update_company");
			mv.setViewName("company/info");
		}
		return mv;
	}
	
	public ModelAndView updatePassword(){
		ModelAndView mv=new ModelAndView();
		
		return mv;
	}
	
	/**
	 * @author 李胤
	 * @param session
	 * @return
	 */
	@RequestMapping("logout")
	public String logout(HttpSession session){
		session.invalidate();
		return "company/company/company_login";
	}
	
	/**
	 * 牟勇：跳转到公司资料页面
	 * @return
	 */
	@RequestMapping("/company_data")
	public String companyData(){
		return "company/company/company_data";
	}
	
	/**
	 * 刘志浩：验证用户名是否重复
	 */
	@RequestMapping("/verificationCompanyLoginId")
	@ResponseBody
	public Map<String, Boolean> verificationUserLoginId(String companyLoginId){
		Map<String, Boolean> map=new HashMap<String, Boolean>();
		Company company =companyService.verificationCompanyLoginId(companyLoginId);
		if (company!=null) {//(重复)
			map.put("valid",false);
		}else {//(不重复)
			map.put("valid", true);
		}	
		return map;
	}
}
