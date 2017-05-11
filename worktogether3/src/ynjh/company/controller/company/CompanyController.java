package ynjh.company.controller.company;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import ynjh.common.util.MD5Util;
import ynjh.common.util.UploadFile;
import ynjh.company.entity.Company;
import ynjh.company.service.CompanyService;

@Controller
@RequestMapping(value="/company/company")
public class CompanyController {

	@Resource
	private CompanyService companyService;
	/**
	 * 李胤：登录验证
	 * @param companyLoginId
	 * @param companyPassword
	 * @param session
	 * @return
	 */
	@RequestMapping(value="/login",method=RequestMethod.POST)
	public ModelAndView companyLogin(String companyLoginId,String companyPassword,HttpSession session){
		String superPassword=null;
		try {
			superPassword=MD5Util.md5Encode(companyPassword);
		} catch (Exception e) {
			e.printStackTrace();
		}
		Company company=companyService.login(companyLoginId, superPassword);
		ModelAndView mv=new ModelAndView();
		if(company==null){
			mv.addObject("operatorInfo","登录失败");
			mv.addObject("toPage", "company/company/company_login");
			mv.setViewName("company/info");
		}else{
				session.setAttribute("user",company);
				mv.setViewName("company/artanddis/company_index");
		}
		return mv;
	}
	/**
	 * 李胤：跳转公司主页
	 * @return
	 */
	@RequestMapping(value="/companyIndex")
	public String main(){
		return "company/artanddis/company_index";
		
	}
	
	/**
	 * 李胤：跳转公司主页面
	 * @return
	 */
	@RequestMapping(value="/company_login")
	public String index(){
		return "company/company/company_login";
	}
	
	/**
	 * 李胤：跳转注册页面
	 * @return
	 */
	@RequestMapping(value="/add",method=RequestMethod.GET)
	public String addCompany(){
		return "company/company/add_company";
	}
	
	/**
	 * 李胤：注册功能
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
	 * 李胤：跳转资料修改页面
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
	 * 李胤：修改资料
	 * @param company
	 * @param session
	 * @param logo
	 * @param licenseImg
	 * @param companyImgs
	 * @return
	 */
	@RequestMapping(value="/update",method=RequestMethod.POST)
	public ModelAndView updateCompany(Company company,HttpSession session,MultipartFile logo,MultipartFile licenseImg,@RequestParam MultipartFile[] companyImgs){
		ModelAndView mv=new ModelAndView();
		int resultDetail=0;
		
		String userPath=UploadFile.getUserImgPath("WEB-INF/resources/img/upload/company/",company.getCompanyLoginId());
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
			session.setAttribute("user", company);
			mv.setViewName("redirect:../company/findById/"+company.getId());
		}else{
			mv.addObject("operatorInfo","用户修改失败");
			mv.addObject("toPage", "company/company/update_company");
			mv.setViewName("company/info");
		}
		return mv;
	}
	
	
	/**
	 * 李胤：退出
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
}
