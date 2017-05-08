package ynjh.company.controller.offer;

import java.sql.Timestamp;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

//import ynjh.company.entity.Company;
import ynjh.company.entity.Offer;
import ynjh.company.service.CompanyOfferService;
//import ynjh.personal.entity.User;

@Controller
@RequestMapping("/offer")
public class CompanyOfferController {
	
	@Resource
	private CompanyOfferService companyOfferService;
	
	@RequestMapping(value="/window_offer", method=RequestMethod.GET)
	public String start(){
		return "company/offer/window_offer";
	}
	
	@RequestMapping(value="/add_offer", method=RequestMethod.GET)
	public String addOffer(){
		return "company/offer/add_offer";
	}
	
	@RequestMapping(value="/add_offer", method=RequestMethod.POST)
	public ModelAndView addOffer(Offer offer,HttpSession session){	
		/*Company company=(Company) session.getAttribute("company");
		offer.setCompanyId(company.getId());*/
		offer.setCompanyId(911);
		/*User user=(User) session.getAttribute("user");
		offer.setUserId(user.getId());*/
		offer.setUserId(222);
		/*offer.setOfferInvitationTime(new Timestamp(System.currentTimeMillis()));*/
		offer.setOfferSendTime(new Timestamp(System.currentTimeMillis()));
		
		int result=companyOfferService.addOffer(offer);
		ModelAndView mv=new ModelAndView();
		if(result>0){
			mv.addObject("operatorInfo","发送成功");
			mv.setViewName("company/info");
		}else{
			mv.addObject("operatorInfo","发送失败");
			mv.setViewName("company/info");
		}
		return mv;
	}
	
	@RequestMapping(value="/update_offerAction/{id}",method=RequestMethod.POST)
	public ModelAndView updateOfferAction(@PathVariable Integer id,Integer offerAction){
		int result=companyOfferService.updateOfferAction(id,offerAction);
		ModelAndView mv=new ModelAndView();
		if(result>0){
			mv.addObject("operatorInfo","提交成功");
			mv.setViewName("company/info");
		}else{
			mv.addObject("operatorInfo","提交失败");
			mv.setViewName("company/info");
		}
		return mv;
	}
	
	@RequestMapping(value="/company_offer_list/{page}", method=RequestMethod.GET)
	public ModelAndView findCompanyOffers(@PathVariable Integer page,HttpSession session){		
		/*Company company=(Company) session.getAttribute("company");
		int companyId=company.getId();*/
		int companyId=911;
		List<Offer> offer=companyOfferService.findCompanyOffers(companyId,page);
		int maxPage=companyOfferService.findCompanyOffersPage(companyId);
		ModelAndView mv=new ModelAndView();
		mv.addObject("offer", offer);
		mv.addObject("page", page);
		mv.addObject("maxPage", maxPage);
		mv.setViewName("company/offer/company_offer_list");
		return mv;
	}
	
	@RequestMapping(value="/company_offer_detail/{id}")
	public ModelAndView findCompanyOffer(@PathVariable Integer id){		
		Offer offer=companyOfferService.findCompanyOffer(id);
		ModelAndView mv=new ModelAndView();
		mv.addObject("o", offer);
		mv.setViewName("company/offer/company_offer_detail");
		return mv;
	}
	
	@RequestMapping(value="/user_offer_list/{page}", method=RequestMethod.GET)
	public ModelAndView findUserOffers(@PathVariable Integer page,HttpSession session){
		/*User user=(User) session.getAttribute("user");
		int userId=user.getId();*/
		int userId=222;
		List<Offer> offer=companyOfferService.findUserOffers(userId,page);
		int maxPage=companyOfferService.findUserOffersPage(userId);
		ModelAndView mv=new ModelAndView();
		mv.addObject("offer", offer);
		mv.addObject("page", page);
		mv.addObject("maxPage", maxPage);
		mv.setViewName("company/offer/user_offer_list");
		return mv;
	}

	@RequestMapping(value="/user_offer_detail/{id}")
	public ModelAndView findUserOffer(@PathVariable Integer id,HttpSession session){
		Offer offer=companyOfferService.findUserOffer(id);
		ModelAndView mv=new ModelAndView();
		mv.addObject("o", offer);
		mv.setViewName("company/offer/user_offer_detail");
		return mv;
	}
}
