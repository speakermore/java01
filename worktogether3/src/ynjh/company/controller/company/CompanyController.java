package ynjh.company.controller.company;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import ynjh.company.entity.Company;
import ynjh.company.service.CompanyService;

@Controller
@RequestMapping(value="/company/company")
public class CompanyController {

	@Resource
	private CompanyService companyService;
	
	@RequestMapping("/add_companyarticle")
	public String addcompany(){
		return "company/artanddis/add_companyarticle";
	}
	@RequestMapping(value="/login",method=RequestMethod.POST)
	public ModelAndView companyLogin(String companyLoginId,String companyPassword,HttpSession session){
		Company company=companyService.login(companyLoginId, companyPassword);
		
		ModelAndView mv=new ModelAndView();
		if(company==null){
			mv.addObject("operatorInfo","登录失败");
			mv.addObject("toPage", "company/company/company_login");
			mv.setViewName("company/info");
		}else{
				mv.addObject("operatorInfo","登录成功");
				mv.addObject("company",company);
				session.setAttribute("company",company);
				mv.setViewName("company/artanddis/company_index");
		}
		return mv;
	}
	
	@RequestMapping(value="/main")
	public String main(){
		return "company/company/main";
		
	}
	
	@RequestMapping(value={"/index","/"})
	public String index(){
		return "company/company/company_login";
	}
	
	@RequestMapping(value="/add",method=RequestMethod.GET)
	public String addCompany(){
		return "company/company/add_company";
	}
	
	@RequestMapping(value="/addCompany",method=RequestMethod.POST)
	public ModelAndView addCompany(Company company){
		ModelAndView mv=new ModelAndView("company/info");
		int companyResult=companyService.addCompany(company);
		if(companyResult>0){
			mv.addObject("operatorInfo","用户添加成功");
			mv.addObject("toPage", "company/company/companyLogin"); 
//			mv.setViewName("company/info");
		}else{
			mv.addObject("operatorInfo","用户添加失败");
			mv.addObject("toPage", "company/company/add_company");
//			mv.setViewName("company/info");
		}
		return mv;
	}
	
	
	@RequestMapping(value="/companyLogin",method=RequestMethod.GET)
	public String login(){
		return "company/company/company_login";
		
	}
//	//跳转修改界面
//	@RequestMapping(value="/updateCompany",method=RequestMethod.GET)
//	public String updatecompany(){
//		return "company/company/update_company";
//	}
	
	//修改用户资料
	@RequestMapping(value="/update_company",method=RequestMethod.POST)
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
	
	
//	@RequestMapping(value="/findById")
//	public ModelAndView findById(@PathVariable Integer id){
//		Company company=companyService.findCompany(id);
//		ModelAndView mv=new ModelAndView();
//		mv.addObject("company", company);
//		return mv;
//	}
	
	//退出
	@RequestMapping("logout")
	public String logout(HttpSession session){
		session.invalidate();
		return "company/company/company_login";
	}
}
