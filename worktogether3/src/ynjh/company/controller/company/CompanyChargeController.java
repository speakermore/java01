package ynjh.company.controller.company;

import java.sql.Timestamp;
import java.util.List;
import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
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
	
	//点击充值跳转
	@RequestMapping(value="charge")
	public String toCharge(){
		return "company/charge/add_charge";
	}
	
	
	
	//充值成功跳转
	@RequestMapping("/company_charge/{companyId}")
	public ModelAndView toCompanycharge(@PathVariable Integer companyId){
		ModelAndView mv=new ModelAndView();
		companyChargeService.findById(companyId);
		return mv;
	}
	
	
	//充值
	@RequestMapping(value="/addMoney",method=RequestMethod.POST)
	public ModelAndView addmoney(Double cmpChargeMoney,HttpSession session){
		ModelAndView mv=new ModelAndView();
		Integer companyId=((Company)session.getAttribute("company")).getId();
		CompanyCharge companyCharge=new CompanyCharge();
		companyCharge.setCompanyId(companyId);
		companyCharge.setCmpChargeTime(new Timestamp(System.currentTimeMillis()));
		companyCharge.setCmpChargeConsume(0.0);
		companyCharge.setCmpChargeMoney(cmpChargeMoney);
		if(companyChargeService.findById(companyId)==null){
			companyCharge.setCmpChargeBalance(cmpChargeMoney);
		}else{
			companyCharge.setCmpChargeBalance(companyChargeService.findById(companyId).getCmpChargeBalance()+cmpChargeMoney);
		}
		
		int result=companyChargeService.addMoney(companyCharge);
		if(result>0){
//			mv.addObject("operatorInfo", "充值成功");
//			mv.addObject("toPage", "company/charge/company_charge");
//			mv.addObject("companyCharge", companyCharge);
		
			mv.setViewName("rediect:../company/charge/company_charge/"+companyId);
		}else{
			mv.addObject("operatorInfo", "充值失败");
			mv.addObject("toPage", "company/charge/company_charge");
		}
		
		return mv;
	}
	
	//消费
	@RequestMapping(value="/test",method=RequestMethod.POST)
	public ModelAndView consumeMoney(Double cmpChargeConsume,HttpSession session){
		ModelAndView mv=new ModelAndView();
		Integer companyId=((Company)session.getAttribute("company")).getId();
		CompanyCharge i=companyChargeService.findById(companyId);
		Double balance= i.getCmpChargeBalance();
		CompanyCharge chargeConsume=new CompanyCharge();
		Double newBalance=balance-cmpChargeConsume;
		if(newBalance>=0){
			mv.setViewName("company_index");
			chargeConsume.setCmpChargeConsume(cmpChargeConsume);
			chargeConsume.setCompanyId(companyId);
			chargeConsume.setCmpChargeTime(new Timestamp(System.currentTimeMillis()));
//			chargeConsume.setCmpChargeStatus(2);
			chargeConsume.setCmpChargeMoney(0.0);
			chargeConsume.setCmpChargeBalance(newBalance);
			companyChargeService.consumeMoney(chargeConsume);
		}else{
			mv.addObject("operatorInfo", "你的余额不足，请充值");
			mv.addObject("toPage", "company/charge/charge");
			mv.setViewName("info");
		}
		return mv;
		
	}
	
	//跳转消费页面
	@RequestMapping("")
	public String test(){
		return "company/charge/consume_charge";
		
	}
	
	//显示充值记录
	@RequestMapping(value="chargeRecord/{companyId}",method=RequestMethod.GET)
	public ModelAndView chargeRecord(@PathVariable Integer companyId,Integer page){
		ModelAndView mv=new ModelAndView("company/charge/charge_record");
//		CompanyCharge companyRecord=new CompanyCharge();
		Integer maxPage=companyChargeService.getMaxPage(companyId);
		
		List<CompanyCharge> companyRecords=companyChargeService.findAllById(companyId,page);
//		companyRecord=companyChargeService.findAllById(companyId);
		
//		 companyRecord.getCmpChargeStatus(1);
		mv.addObject("curPage", page);
		mv.addObject("maxPage", maxPage);
		mv.addObject("companyRecords",companyRecords);
		
		return mv;
		
	}
	/**
	 * 牟勇：跳转到公司余额页面
	 * @return
	 */
	@RequestMapping(value="company_charge")
	public String companyCharge(){
		return "company/charge/company_charge";
	}

}
