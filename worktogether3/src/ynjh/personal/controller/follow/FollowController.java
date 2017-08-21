package ynjh.personal.controller.follow;

import java.sql.Timestamp;
import java.util.HashMap;
import java.util.List;
import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import com.alibaba.fastjson.JSON;
import ynjh.common.entity.MyUser;
import ynjh.personal.entity.Follow;
import ynjh.personal.service.FollowService;
/**
 * @author 胡林飞
 *关注功能
 */

@Controller
@RequestMapping("/personal/follow")
public class FollowController {
	@Resource
	private FollowService followService;
	/**
	 * 牟勇：添加关注，可以使用到企业和个人的相互关注
	 * @param byFollowId 被关注者主键
	 * @param session
	 * @return 返回关注操作结果消息的json对象
	 */
	@RequestMapping("/addFollow/{byFollowId}")
	@ResponseBody
	public Object addFollow(@PathVariable Integer byFollowId,HttpSession session){
		Follow follow=new Follow();
		HashMap<String, String> map=new HashMap<String, String>();
		MyUser user=(MyUser)session.getAttribute("user");
		//判断关注者是个人还是企业(大于1234567890是个人)
		if(user.getId()>=1234567890){
			follow.setFollowType(2);
			map.put("href", "personal/common/initIndex?userId="+user.getId());
		}else{
			follow.setFollowType(1);
			map.put("href", "company/company/findById/"+user.getId());
		}
		//判断被关注者是个人还是企业(大于1234567890是个人)
		if(byFollowId>=1234567890){
			follow.setFollowStartType(2);
		}else{
			follow.setFollowStartType(1);
		}
		
		follow.setFollowId(user.getId());
		follow.setByFollowId(byFollowId);
		follow.setFollowDate(new Timestamp(System.currentTimeMillis()));
		
		int result=followService.addUserFollow(follow);
		
		if(result>0) {
			map.put("info", "添加关注成功！");
		}else{
			map.put("info", "添加关注失败！");
		}
		return JSON.toJSON(map);
	}
	
	/**
	 * 牟勇：取消关注
	 * @param followId 关注者ID
	 * @return 提示取消关注成功或失败
	 */
	@RequestMapping("/cancelFollow/{byFollowId}")
	@ResponseBody
	public Object cancelFollow(@PathVariable Integer byFollowId,HttpSession session){
		MyUser user=(MyUser) session.getAttribute("user");
		//取消关注
		int result=followService.cancelFollow(byFollowId,user.getId());
		HashMap<String, Object> map=new HashMap<String, Object>();
		//判断取消关注的用户是哪种类型
		if(user.getId()>=1234567890){
			map.put("href", "personal/common/initIndex?userId="+user.getId());
		}else{
			map.put("href", "company/company/findById/"+user.getId());
		}
		if (result > 0) {
			map.put("info", "取消关注成功！");
		} else {
			map.put("info", "取消关注失败！");
		}
		return JSON.toJSON(map);
	}
	/**
	 * 跳转关注列表页面
	 * @param id  关注ID
	 * @return 跳转关注列表页面
	 */
	@RequestMapping(value="/gotoFollow/{followId}",method=RequestMethod.GET)
	public ModelAndView gotoFollow(@PathVariable Integer followId){
		ModelAndView mv=new ModelAndView();
		List<Follow> userFollows=followService.findUserFollow(followId);
		List<Follow> companyFollows=followService.findCompanyFollow(followId);
		mv.addObject("userFollows", userFollows);
		mv.addObject("companyFollows", companyFollows);
		mv.setViewName("personal/follow/personal_user_followlist");
		return mv;
		
	}
	/**
	 * 查看关注列表
	 * @param id 关注ID
	 * @return 显示关注列表
	 *//*
	@RequestMapping(value="/findFollowFan")
	public ModelAndView findFollowFan(Integer id){
		List<Follow> follows=followService.selectUserFollow(id);
		ModelAndView mv=new ModelAndView("personal/follow/personal_followlist");
		mv.addObject("follows", follows);
		return mv;
	}*/
}
