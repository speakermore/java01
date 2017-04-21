package ynjh.company.controller.offer;

import java.sql.Timestamp;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import ynjh.company.entity.Offer;
import ynjh.company.service.CompanyOfferService;

@Controller
@RequestMapping("/offer")
public class CompanyOfferController {
	
	@Resource
	private CompanyOfferService companyOfferService;
	
	@RequestMapping(value="/offer", method=RequestMethod.GET)
	public String Start(){
		return "company/offer/offer";
	}
	
	@RequestMapping(value="/add_offer", method=RequestMethod.GET)
	public String add_offer(){
		return "company/offer/add_offer";
	}
	
	@RequestMapping(value="/add_offer", method=RequestMethod.POST)
	public ModelAndView add_offer(Offer offer,HttpSession session){	
		//Company companyco=(Company) session.getAttribute("company");
		offer.setCompanyId(911);
		//User user=(User) session.getAttribute("user");
		offer.setUserId(222);
		offer.setOfferSendTime(new Timestamp(System.currentTimeMillis()));
		offer.setOfferInvitationTime(new Timestamp(System.currentTimeMillis()));		
		int result=companyOfferService.addOffer(offer);
		ModelAndView mv=new ModelAndView();
		if(result>0){
			mv.addObject("operatorInfo","发送成功");
			mv.setViewName("info");
		}else{
			mv.addObject("operatorInfo","发送失败");
			mv.setViewName("info");
		}
		return mv;
	}
	
	@RequestMapping(value="/update_offerAction/{id}",method=RequestMethod.POST)
	public ModelAndView update_offerAction(@PathVariable Integer id,Integer offerAction){
		int result=companyOfferService.updateOfferAction(id,offerAction);
		ModelAndView mv=new ModelAndView();
		if(result>0){
			mv.addObject("operatorInfo","提交成功");
			mv.setViewName("info");
		}else{
			mv.addObject("operatorInfo","提交失败");
			mv.setViewName("info");
		}
		return mv;
	}
	
	@RequestMapping(value="/company_offer/{companyId}", method=RequestMethod.GET)
	public ModelAndView company_offer_list(@PathVariable Integer companyId){		
		List<Offer> offer=companyOfferService.findCompanyOffers(companyId);
		ModelAndView mv=new ModelAndView();
		mv.addObject("offer", offer);
		mv.setViewName("company/offer/company_offer_list");
		return mv;
	}
	
	@RequestMapping(value="/user_offer/{userId}", method=RequestMethod.GET)
	public ModelAndView user_offer_list(@PathVariable Integer userId){
		List<Offer> offer=companyOfferService.findUserOffers(userId);
		ModelAndView mv=new ModelAndView();
		mv.addObject("offer", offer);
		mv.setViewName("company/offer/user_offer_list");
		return mv;
	}
	
	@RequestMapping(value="/company_offer_detail/{id}")
	public ModelAndView company_offer_detail(@PathVariable Integer id){		
		Offer offer=companyOfferService.findCompanyOffer(id);
		ModelAndView mv=new ModelAndView();
		mv.addObject("o", offer);
		mv.setViewName("company/offer/company_offer_detail");
		return mv;
	}
	
	@RequestMapping(value="/user_offer_detail/{id}")
	public ModelAndView user_offer_detail(@PathVariable Integer id){
		Offer offer=companyOfferService.findUserOffer(id);
		ModelAndView mv=new ModelAndView();
		mv.addObject("o", offer);
		mv.setViewName("company/offer/user_offer_detail");
		return mv;
	}
	
	@RequestMapping(value="/findAll/{page}", method=RequestMethod.GET)	
	public ModelAndView findAll(@PathVariable Integer page){
		List<Offer> offer=companyOfferService.findAll(page);
		int maxPage=companyOfferService.findMaxPage();
		ModelAndView mv=new ModelAndView();
		mv.addObject("offer", offer);
		mv.addObject("page", page);
		mv.addObject("maxPage", maxPage);
		mv.setViewName("company/offer/all_offer_list");
		return mv;
	}
	
	@RequestMapping(value="/all_offer_list",method=RequestMethod.GET)
	public String userList(){
		return "company/offer/all_offer_list";
	}
}
