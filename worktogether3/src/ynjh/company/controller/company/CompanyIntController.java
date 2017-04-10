package ynjh.company.controller.company;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import ynjh.company.entity.Company;
import ynjh.company.entity.CompanyIntrodution;
import ynjh.company.service.CompanyIntService;

@Controller
@RequestMapping(value="/companyInt")
public class CompanyIntController {
	@Resource
	CompanyIntService companyIntService;
	
	@RequestMapping(value="UpdateCompanyInt",method=RequestMethod.POST)
	public ModelAndView updateById(CompanyIntrodution companyInt,HttpSession session){
		Company company=(Company)session.getAttribute("company");
		companyInt.setCompanyId(company.getId());
		ModelAndView mv=new ModelAndView();
		int result=companyIntService.updateCompanyInt(companyInt);
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
