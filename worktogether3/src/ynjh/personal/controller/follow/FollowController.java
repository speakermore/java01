package ynjh.personal.controller.follow;

import java.sql.Timestamp;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import ynjh.personal.entity.Follow;
import ynjh.personal.entity.User;
import ynjh.personal.service.FollowService;

@Controller
@RequestMapping("/personal/follow")
public class FollowController {
	@Resource
	private FollowService followService;
	
//	添加关注
	@RequestMapping("/addFollow")
	public ModelAndView addUserFollow(Follow follow,HttpSession session){
		User user=(User) session.getAttribute("user");
		follow.setId(user.getId());
		follow.setFollowDate(new Timestamp(System.currentTimeMillis()));
		follow.setFollowStartType(2);
		int result=followService.addUserFollow(follow);
		ModelAndView mv=new ModelAndView();
		if(result>0) {
			mv.addObject("operatorInfo", "添加关注成功！");
		}else{
			mv.addObject("operatorInfo", "添加关注成功！");
		}
		return mv;
	}
//	取消关注
	@RequestMapping("/deleteFollow")
	public ModelAndView deleteUserFollow(Integer followId){
		int result=followService.deleteUserFollow(followId);
		ModelAndView mv = new ModelAndView("personal/follow/personal_followlist");
		if (result > 0) {
			mv.addObject("operatorInfo", "取消关注成功！");
		} else {
			mv.addObject("operatorInfo", "取消关注失败！");
		}
		return mv;
	}
//	查看关注
	@RequestMapping(value="/gotoFollow",method=RequestMethod.GET)
	public ModelAndView gotoFOllow(Integer id){
		ModelAndView mv=new ModelAndView();
		mv.setViewName("personal/follow/personal_followlist");
		return mv;
		
	}
	@RequestMapping(value="/findFollowFan")
	public ModelAndView findFollowFan(Integer id){
		List<Follow> follows=followService.selectUserFollow(id);
		ModelAndView mv=new ModelAndView("personal/follow/personal_followlist");
		mv.addObject("follows", follows);
		return mv;
	}
}
