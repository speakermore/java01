package ynjh.company.controller.company;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import ynjh.company.entity.Company;
import ynjh.company.entity.CompanyConnection;
import ynjh.company.entity.CompanyDetailImg;
import ynjh.company.entity.CompanyIntroduction;
import ynjh.company.service.CompanyIntService;

@Controller
@RequestMapping(value="/company/company")
public class CompanyIntController {
	@Resource
	CompanyIntService companyIntService;
	
	//跳转更改信息界面
	@RequestMapping(value="/updateCompanyInt",method=RequestMethod.GET)
	public String updateCompanyInt(){
		return "company/company/update_companyInt";
	}
	
	
	//通过id更新用户简介
	@RequestMapping(value="/updateInt",method=RequestMethod.POST)
	public ModelAndView updateById(CompanyIntroduction companyInt,HttpSession session){
		ModelAndView mv=new ModelAndView();
		int result=-1;
		Integer companyId=((Company) session.getAttribute("user")).getId();

		CompanyIntroduction a=companyIntService.findById(companyId);
		companyInt.setCompanyId(companyId);
		if(a==null){
			result=companyIntService.addCompanyInt(companyInt);
		}else{
			result=companyIntService.updateCompanyInt(companyInt);
		}
				
		if(result>0){
			mv.addObject("operatorInfo", "修改用户资料成功");
			mv.addObject("toPage", "company/company/findById/"+companyId);
			mv.setViewName("company/info");
		}else{
			mv.addObject("operatorInfo", "修改用户资料失败");
			mv.addObject("toPage", "company/company/findById/"+companyId);
			mv.setViewName("company/info");
		}
		return mv;
	}
	
	
}
