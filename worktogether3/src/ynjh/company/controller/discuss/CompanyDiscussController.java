package ynjh.company.controller.discuss;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import ynjh.company.entity.Company;
import ynjh.company.service.CompanyDiscussService;
import ynjh.personal.entity.Discuss;
import ynjh.personal.entity.User;

/**
 * 
 * @author 黄冰雁
 *
 */
@Controller
@RequestMapping("/company/artanddis")
public class CompanyDiscussController {

	@Resource
	private CompanyDiscussService companyDiscussService;
	
	/**
	 * 
	 * @author 黄冰雁
	 *参数discuss：添加企业评论
	 *参数disUserId：存储给页面调取
	 */
	@RequestMapping(value="/discuss/add_companydiscuss",method=RequestMethod.POST)
	public ModelAndView addCompanyDiscuss(Discuss discuss,Integer disUserId,HttpSession session){
		User user=(User)session.getAttribute("user");
		Company company=(Company)session.getAttribute("company");
		disUserId=(Integer)session.getAttribute("disUserId");
		ModelAndView mView=new ModelAndView("company/info");
		if(disUserId==user.getId()){
			discuss.setDiscussUsersId(user.getId());
			discuss.setDiscussTime(new Timestamp(System.currentTimeMillis()));
			discuss.setDiscussSendType(1);
			discuss.setDiscussBySendId(company.getId());
		}else {
			mView.addObject("operatorInfo", "评论失败，请联系管理员或重新操作！");
			mView.addObject("toPage", "company/artanddis/");
			return mView;
		}
		int result=companyDiscussService.addDiscuss(discuss);
		
		if (result>0) {
			mView.addObject("operatorInfo", "成功添加企业对个人用户的评论！");
			mView.addObject("toPage", "company/artanddis/article/find/1");
		}else {
			mView.addObject("operatorInfo", "评论失败，请联系管理员或重新操作！");
			mView.addObject("toPage", "company/artanddis/");
		}
		return mView;
	}
	
	/**
	 * 
	 * @author 黄冰雁
	 *参数id：根据id查询删除该条评论
	 */
	@RequestMapping("/discuss/deletecompanydiscuss/{id}")
	public ModelAndView deletecompanydiscuss(@PathVariable Integer id,Integer discussStatus){
		int result=companyDiscussService.updateStatus(id,4);
		ModelAndView mView=new ModelAndView("company/info");
		if(result>0){
			mView.addObject("operatorInfo", "成功删除评论！");
			mView.addObject("toPage", "company/artanddis/article/find/1");
		} else {
			mView.addObject("operatorInfo", "删除失败，请联系管理员或重新操作！");
			mView.addObject("toPage", "company/artanddis/");
		}
		return mView;
	}
	
	/**
	 * 
	 * @author 黄冰雁
	 *参数disc：查询所有评论
	 */
	@RequestMapping("/discuss/finddiscuss")
	public ModelAndView finddiscuss(Discuss disc,HttpSession session){
		Company company=(Company)session.getAttribute("company");
//		User user=();
//		session.setAttribute("user", user);
//		session.setAttribute("company", company);
//		company.setId(1);
//		user.setId(1);
		List<Discuss> discuss=companyDiscussService.findAll();
		session.setAttribute("disUserId", company.getId());
		ModelAndView mView=new ModelAndView("company/artanddis/company_index");
		mView.addObject("discusses", discuss);
		return mView;
	}
}
