package ynjh.personal.controller.discuss;

import java.sql.Timestamp;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import ynjh.personal.entity.Discuss;
import ynjh.personal.service.DiscussService;

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
	public ModelAndView addDiscuss(Discuss discuss){
		ModelAndView mv=new ModelAndView();
		discuss.setDiscussTime(new Timestamp(System.currentTimeMillis()));
		discuss.setDiscussUsersType(2);
		int result=dService.addDiscuss(discuss);
		if (result>0) {
			mv.addObject("operatorInfo","评论成功，请等待审核");
			mv.setViewName("");
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
