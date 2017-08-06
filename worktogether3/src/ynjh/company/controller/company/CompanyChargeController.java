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

import ynjh.common.entity.UserRecord;
import ynjh.common.service.UserRecordService;
import ynjh.company.entity.Company;
import ynjh.company.entity.CompanyCharge;
import ynjh.company.service.CompanyChargeService;

@Controller
@RequestMapping(value="/company/charge")
public class CompanyChargeController {
	@Resource
	CompanyChargeService companyChargeService;
	@Resource
	UserRecordService userRecordService;
	
	//点击充值跳转
	@RequestMapping(value="charge")
	public String toCharge(){
		return "company/charge/add_charge";
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
	
	/**
	 * 牟勇：显示企业的消费记录<br />
	 * 根据企业主键进行查询公司消费记录,目前是查询所有的历史消费记录，未做时间限制<br />
	 * @param companyId 企业主键
	 * @return 跳转显示消费记录的页面
	 */
	@RequestMapping(value="chargeRecord/{companyId}",method=RequestMethod.GET)
	public ModelAndView chargeRecord(@PathVariable Integer companyId){
		ModelAndView mv=new ModelAndView("company/charge/charge_record");
		List<UserRecord> companyRecords=userRecordService.findUserRecordById(companyId);
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
