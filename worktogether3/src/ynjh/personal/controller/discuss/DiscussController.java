package ynjh.personal.controller.discuss;

import java.sql.Timestamp;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import ynjh.personal.entity.Discuss;
import ynjh.personal.entity.User;
import ynjh.personal.service.DiscussService;
/**
 * 
 * @author ？
 *
 */
@Controller
@RequestMapping("/personal/discuss")
public class DiscussController {
	@Resource
	private DiscussService dService;
	
	//跳转
	@RequestMapping(value="/goDiscuss",method=RequestMethod.GET)
	public String goDiscuss(){
		return "personal/discuss/personal_discuss";
	}
	
	//添加评论
	@RequestMapping("/addDiscuss")
	public ModelAndView addDiscuss(Integer companyId,Discuss discuss,HttpSession session){
		ModelAndView mv=new ModelAndView();
		User oldUser=(User) session.getAttribute("user");
		discuss.setDiscussTime(new Timestamp(System.currentTimeMillis()));
		discuss.setDiscussUsersId(oldUser.getId());
		discuss.setDiscussBySendId(companyId);
		discuss.setDiscussSendType(2);
		discuss.setDiscussStatus(1);
		int result=dService.addDiscuss(discuss);
		if (result>0) {
			mv.addObject("operatorInfo","评论成功，请等待审核");
			mv.setViewName("company/artanddis/company_index");
		}else {
			mv.setViewName("error");
		}
		return mv;
	}
	
	//删除评论
	@RequestMapping("/deleteDiscuss")
	public ModelAndView deleteDiscuss(Integer id){
		ModelAndView mv=new ModelAndView();
		int result =dService.deleteUserDiscuss(id);
		if (result>0) {
			mv.addObject("operatorInfo","删除成功！");
			mv.setViewName("");
		}else {
			mv.addObject("operatorInfo","删除失败！");
			mv.setViewName("");
		}
		return mv;
	}
}
