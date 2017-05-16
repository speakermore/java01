package ynjh.company.controller.company;

import java.util.Date;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import ynjh.common.util.MD5Util;
import ynjh.common.util.UploadFile;
import ynjh.common.util.ValidateCode;
import ynjh.company.entity.Company;
import ynjh.company.entity.CompanyIntroduction;
import ynjh.company.service.CompanyIntService;
import ynjh.company.service.CompanyService;

@Controller
@RequestMapping(value="/company/company")
public class CompanyController {

	@Resource
	private CompanyService companyService;
	@Resource
	CompanyIntService companyIntService;
	
	//登录验证
	@RequestMapping(value="/login",method=RequestMethod.POST)
	public ModelAndView companyLogin(String companyLoginId,String companyPassword,HttpSession session,@RequestParam String validateCode,HttpServletRequest request, HttpServletResponse response){
		ModelAndView mv=new ModelAndView();
		String superPassword=null;
		// 判断
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
			mv.addObject("operatorInfo", "请输入正确的验证码或者密码！");
			System.out.println("验证码输入不正确！！！！！！！！！！！");
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
		}else{
			
			String remFlag = request.getParameter("aaaa");
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
			
//				mv.addObject("operatorInfo","登录成功");
//				mv.addObject("company",company);
				session.setAttribute("user",company);
				CompanyIntroduction companyInt=companyIntService.findById(company.getId());
				session.setAttribute("companyInt", companyInt);
				mv.setViewName("company/artanddis/company_index");
				
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
	
	
	//点击注册跳转
	@RequestMapping(value="/add",method=RequestMethod.GET)
	public String addCompany(){
		return "company/company/add_company";
	}
	//注册用户
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
	
	//跳转修改界面
	@RequestMapping(value="/updateCompany",method=RequestMethod.GET)
	public String updatecompany(){
//		ModelAndView mv=new ModelAndView("company/company/update_company");
//		Company company=(Company)session.getAttribute("company");
//		mv.addObject("company", company);
		
		return "company/company/update_company";
	}
	
	//修改用户资料
	@RequestMapping(value="/update",method=RequestMethod.POST)
	public ModelAndView updateCompany(Company company,HttpSession session,MultipartFile logo,MultipartFile licenseImg,
			MultipartFile companyImgs1,MultipartFile companyImgs2,MultipartFile companyImgs3,MultipartFile companyImgs4,
			MultipartFile companyImgs5,MultipartFile companyImgs6){
		ModelAndView mv=new ModelAndView();
		int resultDetail=0;
		MultipartFile[] companyImgs={companyImgs1,companyImgs2,companyImgs3,companyImgs4,companyImgs5,companyImgs6};
		String userPath=UploadFile.getUserImgPath("/WEB-INF/resources/company/img",company.getCompanyLoginId());
		String[] companyLogo=UploadFile.uploadFile(userPath,new MultipartFile[]{logo}, session);
		String[] companyLicenseImg=UploadFile.uploadFile(userPath, new MultipartFile[]{licenseImg}, session);
		String[] fileNames=UploadFile.uploadFile(userPath,companyImgs, session);
			for(int i=0;i<fileNames.length;i++){
				companyService.addCompanyDetailId(company.getId(), fileNames[i],i);
				resultDetail+=1;
			}
		company.setCompanyLogo(companyLogo[0]);
		company.setCompanyLicenseImg(companyLicenseImg[0]);
		int result=companyService.updateCompany(company);
		if(result>0&&resultDetail>=(companyImgs.length-1)){
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
	
	//退出
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
}
