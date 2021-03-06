package ynjh.company.controller.offer;

import java.sql.Timestamp;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import ynjh.common.entity.MyUser;
import ynjh.company.entity.Company;
import ynjh.company.entity.Offer;
import ynjh.company.service.CompanyOfferService;

@Controller
@RequestMapping("/offer")
public class CompanyOfferController {

	@Resource
	private CompanyOfferService companyOfferService;

	// 发送offer
	@RequestMapping(value="/add_offer",method=RequestMethod.GET)
	public ModelAndView addOffer(Integer applyId){
		ModelAndView mv=new ModelAndView("company/offer/add_offer");
		mv.addObject("applyId",applyId);
		return mv;
	}
	@RequestMapping(value="/add_offer", method=RequestMethod.POST)
	public ModelAndView addOffer(Offer offer,HttpSession session){
		MyUser user=(MyUser)session.getAttribute("user");
		offer.setOfferSendTime(new Timestamp(System.currentTimeMillis()));
		offer.setOfferAction(1);
		offer.setOfferStatus(2);
		companyOfferService.addOffer(offer);
		ModelAndView mv=new ModelAndView("redirect:/company/company/findById/"+user.getId());
		return mv;
	}

	// 修改offer的状态
	@RequestMapping(value="/update_offerAction/{id}",method=RequestMethod.POST)
	public ModelAndView updateOfferAction(@PathVariable Integer id,Integer offerAction){
		int result=companyOfferService.updateOfferAction(id,offerAction);
		ModelAndView mv=new ModelAndView();
		if(result>0){
			mv.addObject("operatorInfo","提交成功");
			mv.addObject("toPage", "offer/user_offer_list/1");
			mv.setViewName("company/info");
		}else{
			mv.addObject("operatorInfo","提交失败");
			mv.addObject("toPage", "offer/user_offer_list/1");
			mv.setViewName("company/info");
		}
		return mv;
	}

	// 查找当前公司发出的所有offer
	@RequestMapping(value="/company_offer_list/{page}", method=RequestMethod.GET)
	public ModelAndView findCompanyOffers(@PathVariable Integer page,HttpSession session){
		Company company=(Company) session.getAttribute("user");
		int companyId=company.getId();
		//int companyId=113;
		List<Offer> offer=companyOfferService.findCompanyOffers(companyId,page);
		int maxPage=companyOfferService.findCompanyOffersPage(companyId);
		ModelAndView mv=new ModelAndView();
		mv.addObject("offer", offer);
		mv.addObject("page", page);
		mv.addObject("maxPage", maxPage);
		mv.setViewName("company/offer/company_offer_list");
		return mv;
	}

	// 查找当前公司发出的某条offer（根据id查询）
	@RequestMapping(value="/company_offer_detail/{id}")
	public ModelAndView findCompanyOffer(@PathVariable Integer id){
		Offer offer=companyOfferService.findCompanyOffer(id);
		ModelAndView mv=new ModelAndView();
		mv.addObject("o", offer);
		mv.setViewName("company/offer/company_offer_detail");
		return mv;
	}

	// 查找当前用户收到的所有offer
	@RequestMapping(value="/user_offer_list/{page}", method=RequestMethod.GET)
	public ModelAndView findUserOffers(@PathVariable Integer page,HttpSession session){
		//userId是写死的，需要全部重新写。
		int userId=1234567896;
		List<Map<String,Object>> offer=companyOfferService.findUserOffers(userId);
		int maxPage=companyOfferService.findUserOffersPage(userId);
		ModelAndView mv=new ModelAndView();
		mv.addObject("offer", offer);
		mv.addObject("page", page);
		mv.addObject("maxPage", maxPage);
		mv.setViewName("company/offer/user_offer_list");
		return mv;
	}

	// 查找当前用户收到的某条offer（根据id查询）
	@RequestMapping(value="/user_offer_detail/{id}")
	public ModelAndView findUserOffer(@PathVariable Integer id){
		Offer offer=companyOfferService.findUserOffer(id);
		ModelAndView mv=new ModelAndView();
		mv.addObject("o", offer);
		mv.setViewName("company/offer/user_offer_detail");
		return mv;
	}
}
