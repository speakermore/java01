package ynjh.company.controller.company;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import ynjh.company.entity.Company;
import ynjh.company.entity.CompanyIntroduction;
import ynjh.company.service.CompanyIntService;

@Controller
@RequestMapping(value="/company")
public class CompanyIntController {
	@Resource
	CompanyIntService companyIntService;
	
	@RequestMapping(value="updateCompany",method=RequestMethod.GET)
	public String updateCompanyInt(){
		return "company/update_company";
	}
	
	
	//通过id更新用户简介
	@RequestMapping(value="updateCompanyInt",method=RequestMethod.POST)
	public ModelAndView updateById(CompanyIntroduction companyInt,HttpSession session){
		ModelAndView mv=new ModelAndView();
		int result=-1;
		Company j=(Company) session.getAttribute("company");
		
		Integer i=j.getId();
		CompanyIntroduction result1=companyIntService.findById(i);
		
		if(companyIntService.findById(j.getId())==null){
			result=companyIntService.addCompanyInt(companyInt);
		}else{
			result=companyIntService.updateCompanyInt(companyInt);
		}
				
		if(result>0){
			mv.addObject("operatorInfo", "修改用户资料成功");
			mv.addObject("toPage", "update_companyInt");
			mv.setViewName("info");
		}else{
			mv.addObject("operatorInfo", "修改用户资料成功");
			mv.addObject("toPage", "update_companyInt");
			mv.setViewName("info");
		}
		return mv;
	}
	
	@RequestMapping(value="findById",method=RequestMethod.GET)
	public String companyIntShow(){
		return "company/company_data";
	}
}
