package ynjh.company.controller.offer;

import java.sql.Timestamp;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import ynjh.company.entity.Company;
import ynjh.company.entity.Offer;
import ynjh.company.service.CompanyOfferService;
import ynjh.personal.entity.User;

@Controller
@RequestMapping("/offer")
public class CompanyOfferController {
	
	@Resource
	private CompanyOfferService companyOfferService;
	
	@RequestMapping(value="/add_offer", method=RequestMethod.GET)
	public String add_offer(){
		return "add_offer";
	}
	
	@RequestMapping(value="/add_offer", method=RequestMethod.POST)
	public ModelAndView add_offer(Offer offer,HttpSession session){
		User user=(User)session.getAttribute("user");
		Company company=(Company)session.getAttribute("company");
		offer.setUserId(user.getId());
		offer.setCompanyId(company.getId());
		offer.setOfferSendTime(new Timestamp(System.currentTimeMillis()));
		offer.setOfferInvitationTime(new Timestamp(System.currentTimeMillis()));
		
		int result=companyOfferService.addOffer(offer);
		ModelAndView mv=new ModelAndView();
		if(result>0){
			mv.addObject("operatorInfo","面试邀请添加成功");
			mv.addObject("toPage","offer/add_offer");
			mv.setViewName("info");
		}else{
			mv.addObject("operatorInfo","面试邀请添加失败");
			mv.setViewName("info");
		}
		return mv;
	}
	
	@RequestMapping(value="/findAll")
	public ModelAndView findAll(Integer page){
		List<Offer> offer=companyOfferService.findAll(page);
		ModelAndView mv=new ModelAndView("index");
		mv.addObject("offer", offer);
		return mv;
	}
	 
	@RequestMapping(value="/findById")
	public ModelAndView findById(Integer id){
		Offer offer=companyOfferService.findById(id);
		ModelAndView mv=new ModelAndView("index");
		mv.addObject("offer", offer);
		return mv;		
	}
	
	@RequestMapping(value="/update_offer", method=RequestMethod.GET)
	public String undateOfferJob(){
		return "update_offer";
	}
	
	@RequestMapping(value="/update_offer",method=RequestMethod.POST)
	public ModelAndView updateOfferJob(Integer id,String offerJob){
		int result=companyOfferService.updateOfferJob(id,offerJob);
		ModelAndView mv=new ModelAndView();
		if(result>0){
			mv.addObject("operatorInfo","修改成功");
			mv.addObject("toPage","index");
			mv.setViewName("info");
		}else{
			mv.addObject("operatorInfo","修改失败");
			mv.addObject("toPage","index");
			mv.setViewName("info");
		}
		return mv;
	}
	
	@RequestMapping(value="/updateOfferContent",method=RequestMethod.POST)
	public ModelAndView updateOfferContent(Integer id,String offerContent){
		int result=companyOfferService.updateOfferContent(id,offerContent);
		ModelAndView mv=new ModelAndView();
		if(result>0){
			mv.addObject("operatorInfo","修改成功");
			mv.addObject("toPage","index");
			mv.setViewName("info");
		}else{
			mv.addObject("operatorInfo","修改失败");
			mv.addObject("toPage","index");
			mv.setViewName("info");
		}
		return mv;
	}
	
	@RequestMapping(value="/updateOfferStatus",method=RequestMethod.POST)
	public ModelAndView updateOfferStatus(Integer id,Integer offerStatus){
		int result=companyOfferService.updateOfferStatus(id,offerStatus);
		ModelAndView mv=new ModelAndView();
		if(result>0){
			mv.addObject("operatorInfo","修改成功");
			mv.addObject("toPage","index");
			mv.setViewName("info");
		}else{
			mv.addObject("operatorInfo","修改失败");
			mv.addObject("toPage","index");
			mv.setViewName("info");
		}
		return mv;
	}
	
	@RequestMapping(value="/company_offer", method=RequestMethod.GET)
	public String company_offer(){
		return "company_offer";
	}
	
	@RequestMapping(value="/user_offer", method=RequestMethod.GET)
	public String user_offer(){
		return "user_offer";
	}
}
