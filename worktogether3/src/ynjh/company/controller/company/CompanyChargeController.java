package ynjh.company.controller.company;

import java.sql.Timestamp;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import ynjh.company.entity.Company;
import ynjh.company.entity.CompanyCharge;
import ynjh.company.service.CompanyChargeService;

@Controller
@RequestMapping(value="/company/charge")
public class CompanyChargeController {
	@Resource
	CompanyChargeService companyChargeService;
	
	@RequestMapping(value="charge")
	public String toCharge(){
		return "company/charge/add_charge";
	}
	
	@RequestMapping(value="/addMoney",method=RequestMethod.POST)
	public ModelAndView addmoney(CompanyCharge companyCharge,HttpSession session){
		ModelAndView mv=new ModelAndView();
		companyCharge.setCompanyId(((Company)session.getAttribute("company")).getId());
		companyCharge.setCmpChargeTime(new Timestamp(System.currentTimeMillis()));
		companyCharge.setCmpChargeStatus(1);
		companyCharge.setCmpChargeConsume(0.0);
		int result=companyChargeService.addMoney(companyCharge);
		if(result>1){
			mv.addObject("operatorInfo", "充值成功");
			mv.addObject("toPage", "company/company_charge");
			mv.setViewName("info");
		}else{
			mv.addObject("operatorInfo", "充值失败");
			mv.addObject("toPage", "company_charge");
			mv.setViewName("info");
		}
		
		return mv;
	}

}
