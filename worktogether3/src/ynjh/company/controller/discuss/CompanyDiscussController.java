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

@Controller
@RequestMapping("/company/artanddis")
public class CompanyDiscussController {

	@Resource
	private CompanyDiscussService companyDiscussService;
	
	@RequestMapping(value="/discuss/add_companydiscuss",method=RequestMethod.POST)
	public ModelAndView addCompanyDiscuss(Discuss discuss,HttpSession session){
		User user=(User)session.getAttribute("user");
		ModelAndView mView=new ModelAndView("company/info");
		if(discuss.getDiscussUsersId()==user.getId()){
			discuss.setDiscussUsersId(user.getId());
			discuss.setDiscussTime(new Timestamp(System.currentTimeMillis()));
			discuss.setDiscussUsersType(2);
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
			mView.addObject("toPage", "company/artanddis/company_index");
		}
		return mView;
	}
	
	@RequestMapping("/discuss/deletecompanydiscuss/{id}")
	public ModelAndView deletecompanydiscuss(@PathVariable Integer id,Integer discussStatus){
		int result=companyDiscussService.updateStatus(id,4);
		ModelAndView mView=new ModelAndView("company/info");
		if(result>0){
			mView.addObject("operatorInfo", "成功删除评论！");
			mView.addObject("toPage", "../../../../company/artanddis/article/find/1");
		} else {
			mView.addObject("operatorInfo", "删除失败，请联系管理员或重新操作！");
			mView.addObject("toPage", "company/artanddis/company_index");
		}
		return mView;
	}
	
	@RequestMapping("/discuss/finddiscuss/{page}")
	public ModelAndView finddiscuss(@PathVariable Integer page,Integer discussUsersId,HttpSession session){
		Company company=new Company();
		User user=new User();
		session.setAttribute("user", user);
		session.setAttribute("company", company);
		company.setId(1);
		user.setId(2);
		discussUsersId=company.getId();
		List<Discuss> discuss=companyDiscussService.findAll(page,discussUsersId);
		session.setAttribute("disUserId", discussUsersId);
		int maxPage=companyDiscussService.getMax();
		List<Integer> pageNo=new ArrayList<Integer>();
		for(int i=1;i<=maxPage;i++){
			pageNo.add(i);
		}
		ModelAndView mView=new ModelAndView("company/artanddis/company_index");
		mView.addObject("discuss", discuss);
		mView.addObject("curPage", page);
		mView.addObject("pageNo", pageNo);
		mView.addObject("maxPage", maxPage);
		return mView;
	}
}
