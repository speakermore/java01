package ynjh.company.controller.company;

import javax.annotation.Resource;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import ynjh.company.entity.Company;
import ynjh.company.service.CompanyService;

@Controller

public class CompanyController {

	@Resource
	private CompanyService companyService;
	
	@RequestMapping(value="/add_user",method=RequestMethod.GET)
	public String adduser(){
		return "add_company";
	}
	
	@RequestMapping(value="/addUser",method=RequestMethod.POST)
	public ModelAndView addUser(Company company){
		ModelAndView mv=new ModelAndView();
		int result=companyService.addCompany(company);
		if(result>0){
			mv.addObject("operatorInfo","用户添加成功");
			mv.addObject("toPage", "index");
			mv.setViewName("info");
		}else{
			mv.addObject("operatorInfo","用户添加失败");
			mv.addObject("toPage", "index");
			mv.setViewName("info");
		}
		return mv;
	}
	
}
