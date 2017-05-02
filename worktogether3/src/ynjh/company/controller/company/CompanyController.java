package ynjh.company.controller.company;

import java.io.File;
import java.io.PrintWriter;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FilenameUtils;
import org.apache.commons.lang.math.RandomUtils;
import org.springframework.stereotype.Controller;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
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
	
	//登录验证
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
//				mv.addObject("operatorInfo","登录成功");
//				mv.addObject("company",company);
				session.setAttribute("user",company);
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
		if(realCompanyPassword.equals(realCompanyPassword)){
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
		}else{
			mv.addObject("operatorInfo","用户密码不一致");
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
	public ModelAndView updateCompany(Company company,HttpSession session,MultipartFile logo,@RequestParam MultipartFile[] companyDetails){
		ModelAndView mv=new ModelAndView();
		int resultDetail=0;
		
		Company user=(Company)session.getAttribute("user");
		String userPath=UploadFile.getUserImgPath("/WEB-INF/resources/company/img/",user.getCompanyLoginId());
		String[] companyLogo=UploadFile.uploadFile(userPath,new MultipartFile[]{logo}, session);
		
			String[] fileNames=UploadFile.uploadFile(userPath,companyDetails, session);
			for(String fileName:fileNames){
				companyService.addCompanyDetailId(company.getId(), fileName);
				resultDetail+=1;
			}
		
		company.setCompanyLogo(companyLogo[0]);
		int result=companyService.updateCompany(company);
		if(result>0&&resultDetail>=(companyDetails.length-1)){
			mv.addObject("operatorInfo","用户修改成功");
			session.setAttribute("company", company);
			mv.addObject("toPage", "company/company/findById/"+company.getId());
			mv.setViewName("company/info");
		}else{
			mv.addObject("operatorInfo","用户修改失败");
			mv.addObject("toPage", "company/company/update_company");
			mv.setViewName("company/info");
		}
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
