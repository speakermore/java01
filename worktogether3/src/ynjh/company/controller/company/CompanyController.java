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
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSON;

import ynjh.common.util.MD5Util;
import ynjh.common.util.UploadFile;
import ynjh.common.util.ValidateCode;
import ynjh.company.entity.Company;
import ynjh.company.entity.CompanyConnection;
import ynjh.company.entity.CompanyDetailImg;
import ynjh.company.entity.CompanyIntroduction;
import ynjh.company.service.CompanyIntService;
import ynjh.company.service.CompanyOfferService;
import ynjh.company.service.CompanyRecruitService;
import ynjh.company.service.CompanyResumeService;
import ynjh.company.service.CompanyService;

@Controller
@RequestMapping(value="/company/company")
public class CompanyController {

	@Resource
	private CompanyService companyService;
	@Resource
	CompanyIntService companyIntService;
	@Resource
	CompanyResumeService creService;
	@Resource
	CompanyRecruitService companyRecruitService;
	@Resource
	CompanyOfferService companyOfferService;
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
			mv.addObject("operatorInfo","登录失败，请输入正确的手机号和密码");
			mv.addObject("toPage", "company/company/company_login");
			mv.setViewName("company/company/company_login");
			mv.addObject("companyLoginId",companyLoginId);
		}else{
	         if("1".equals(remFlag)){ //"1"表示用户勾选记住密码
	             
	             String loginInfo = companyLoginId+","+companyPassword;
	             Cookie userCookie=new Cookie("loginInfo",loginInfo); 

	             userCookie.setMaxAge(30*24*60*60);   //存活期为一个月 30*24*60*60
	             userCookie.setPath("/");
	             response.addCookie(userCookie); 
	         }
	         
				session.setAttribute("user",company);
				mv.setViewName("redirect:findById/"+company.getId());
		}
		
		return mv;
	}
	
	/**
	 * 跳转企业用户资料页面	
	 * 查询了企业详细资料companyInt，企业联系人companyConnections，企业环境图片detailImgs
	 * @param companyId 企业id
	 * @param session
	 * @return 
	 */
	@RequestMapping(value="/findById/{companyId}",method=RequestMethod.GET)
	public ModelAndView companyIntShow(@PathVariable Integer companyId,HttpSession session){
		ModelAndView mv=new ModelAndView();
		Company company=(Company)session.getAttribute("user");
		//企业详细资料
		CompanyIntroduction companyInt=companyIntService.findById(company.getId());
		session.setAttribute("companyInt", companyInt);
		//企业联系人
		List<CompanyConnection> companyConnections=companyService.findCompanyConnection(company.getId());
		session.setAttribute("companyConnections", companyConnections);
		//企业环境图片
		List<CompanyDetailImg> detailImgs=companyService.findDetailImg(company.getId());
		session.setAttribute("detailImgs", detailImgs);
		//最近6个月企业收到的简历
		List<Map<String, Object>> newlyApplys=creService.findNewlyApply(companyId);
		session.setAttribute("newlyApplys", newlyApplys);
		//与企业招聘简历匹配的
		List<Map<String, Object>> postMatchs=companyRecruitService.findMatchResumes(companyId);
		session.setAttribute("postMatchs", postMatchs);
		//企业发出的Offer的状态
		//List<Map<String, Object>> Offers=
		mv.setViewName("company/company/company_data");
		return mv;
	}
	
	@RequestMapping(value="/companyIndex")
	public String main(){
		return "company/artanddis/company_index";
		
	}
	/**
	 * 登录
	 * 牟勇：为了保证登录数据不出现混乱，所以在跳转登录时对session进行了一次清除
	 * @param session
	 * @return
	 */
	@RequestMapping(value={"/company_login","/"})
	public String index(HttpSession session){
		session.invalidate();
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
	 * 牟勇：activePanel：用来标识编辑企业页面上三个面板，哪个被激活
	 * 0：基本资料，1：环境图片，2：详细资料
	 * @author 李胤
	 * @return 跳转到update_company.jsp页面
	 */
	@RequestMapping(value="/updateCompany/{activePanel}",method=RequestMethod.GET)
	public ModelAndView updatecompany(@PathVariable Integer activePanel){
		ModelAndView mv=new ModelAndView("company/company/update_company_index");
		//牟勇：activePanel：用来标识编辑企业页面上三个面板，哪个被激活
		//0：基本资料，1：环境图片，2：详细资料
		mv.addObject("activePanel",activePanel);
		return mv;
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
	 * 牟勇：添加字符串数组imgs，以保存页面传过来的文件名，方便进行对比
	 * @author 李胤
	 * @param imgs 保存页面传过来的文件名，以搞清图片文件是否做过修改
	 * @param session
	 * @param companyImgs1 员工
	 * @param companyImgs2 前台
	 * @param companyImgs3 办公区
	 * @param companyImgs4 会议室
	 * @param companyImgs5 休息区
	 * @param companyImgs6 其他
	 * @return
	 */
	@RequestMapping(value="/updateCompanyImg",method=RequestMethod.POST)
	public ModelAndView updateCompanyImg(Integer[] imgsId,HttpSession session,@RequestParam MultipartFile[] companyImgs){
		
		ModelAndView mv=new ModelAndView();
		Company company=(Company)session.getAttribute("user");
		String userPath=UploadFile.getUserImgPath("/WEB-INF/resources/company/img",company.getCompanyLoginId());
		String[] fileNames=UploadFile.uploadFile(userPath,companyImgs, session);
		//根据文件名的返回情况，如果是null，就做添加，否则就做修改
		for(int i=0;i<fileNames.length;i++){
			if(fileNames[i]!=null){
				//如果文件上传了，则删除原图片，添加新图片
				companyService.addCompanyDetailImg(company.getId(), fileNames[i],i,imgsId[i]);
			}
		}
		
		mv.addObject("operatorInfo","图片修改成功");
		session.setAttribute("user", company);
		mv.addObject("toPage", "company/company/findById/"+company.getId());
		mv.setViewName("company/info");
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
		
		String[] companyPic=UploadFile.uploadFile(userPath,new MultipartFile[]{logo,licenseImg}, session);
		//牟勇：如果logo上传了，就保存路径
		if(companyPic[0]!=null){
			company.setCompanyLogo(companyPic[0]);
		}
		//牟勇：如果营业执照上传了，就保存路径
		if(companyPic[1]!=null){
			company.setCompanyLicenseImg(companyPic[1]);
		}
		int result=companyService.updateCompany(company);
		if(result>0){
			mv.addObject("operatorInfo","用户修改成功");
			session.setAttribute("user", company);
			mv.addObject("toPage","company/company/findById/"+company.getId());
			mv.setViewName("company/info");
		}else{
			mv.addObject("operatorInfo","用户修改失败");
			mv.addObject("toPage","company/company/update_company");
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
	public String verificationUserLoginId(String companyLoginId){
		Map<String, Boolean> map=new HashMap<String, Boolean>();
		Company company =companyService.verificationCompanyLoginId(companyLoginId);
		if (company!=null) {//(重复)
			map.put("valid",false);
		}else {//(不重复)
			map.put("valid", true);
		}	
		return JSON.toJSONString(map);
	}
}
