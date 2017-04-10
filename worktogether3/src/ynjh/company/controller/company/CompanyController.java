package ynjh.company.controller.company;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import ynjh.company.entity.Company;
import ynjh.company.service.CompanyService;

@Controller
@RequestMapping(value="/company")
public class CompanyController {

	@Resource
	private CompanyService companyService;
	
	@RequestMapping(value="/login",method=RequestMethod.POST)
	public ModelAndView companyLogin(String companyLoginId,String companyPassword,HttpSession session){
		Company company=companyService.login(companyLoginId, companyPassword);
		
		ModelAndView mv=new ModelAndView();
		if(company==null){
			mv.addObject("loginInfo","登录失败");
			mv.setViewName("company/company_login");
		}else{
				mv.addObject("loginInfo","登录成功");
				mv.addObject("company",company);
				session.setAttribute("company",company);
				mv.setViewName("company/main");
			
		}
		return mv;
	}
	
	@RequestMapping(value="/main")
	public String main(){
		return "company/main";
		
	}
	
	@RequestMapping(value={"/index","/"})
	public String index(){
		return "company/company_index";
	}
	
	@RequestMapping(value="/add",method=RequestMethod.GET)
	public String addCompany(){
		return "company/add_company";
	}
	
	@RequestMapping(value="/addCompany",method=RequestMethod.POST)
	public ModelAndView addCompany(Company company){
		ModelAndView mv=new ModelAndView("company/info");
		int result=companyService.addCompany(company);
		if(result>0){
			mv.addObject("operatorInfo","用户添加成功");
			mv.addObject("toPage", "company/companyLogin"); 
//			mv.setViewName("company/info");
		}else{
			mv.addObject("operatorInfo","用户添加失败");
			mv.addObject("toPage", "add_company");
//			mv.setViewName("company/info");
		}
		return mv;
	}
	
	@RequestMapping(value="/companyLogin",method=RequestMethod.GET)
	public String login(){
		return "company/company_login";
		
	}
	
	@RequestMapping(value="/update_company",method=RequestMethod.GET)
	public String updatecompany(){
		return "update_company";
	}
	@RequestMapping(value="/updateCompany",method=RequestMethod.POST)
	public ModelAndView updateCompany(Company company){
		ModelAndView mv=new ModelAndView();
		int result=companyService.addCompany(company);
		if(result>0){
			mv.addObject("operatorInfo","用户修改成功");
			mv.addObject("toPage", "index");
			mv.setViewName("info");
		}else{
			mv.addObject("operatorInfo","用户修改失败");
			mv.addObject("toPage", "index");
			mv.setViewName("info");
		}
		return mv;
	}
	
	
	@RequestMapping(value="/findById/{id}")
	public ModelAndView findById(@PathVariable Integer id){
		Company company=companyService.findCompany(id);
		ModelAndView mv=new ModelAndView();
		mv.addObject("company", company);
		return mv;
	}
	
	
	@RequestMapping("logout")
	public String logout(HttpSession session){
		session.invalidate();
		return "company/company_login";
	}
}
