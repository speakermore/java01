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
	 * 添加关注
	 * @param follow 关注对象
	 * @param session
	 * @return 提示关注成功或失败
	 */
	@RequestMapping("/addUserFollow")
	public ModelAndView addUserFollow(Integer byFollowId,HttpSession session){
		User user=(User) session.getAttribute("user");
		Follow follow=new Follow();
		follow.setId(user.getId());
		follow.setByFollowId(byFollowId);
		follow.setFollowDate(new Timestamp(System.currentTimeMillis()));
		follow.setFollowStartType(2);
		follow.setFollowType(2);
		int result=followService.addUserFollow(follow);
		ModelAndView mv=new ModelAndView("redirect:../common/initIndex?toPage=1&userId=" + user.getId());
		if(result>0) {
			mv.addObject("operatorInfo", "添加关注成功！");
		}else{
			mv.addObject("operatorInfo", "添加关注失败！");
		}
		return mv;
	}
	/**
	 * 取消关注
	 * @param followId 关注者ID
	 * @return 提示取消关注成功或失败
	 */
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
	/**
	 * 跳转查看关注页面
	 * @param id  关注ID
	 * @return 跳转关注列表页面
	 */
	@RequestMapping(value="/gotoFollow",method=RequestMethod.GET)
	public ModelAndView gotoFOllow(Integer id){
		ModelAndView mv=new ModelAndView();
		mv.setViewName("personal/follow/personal_followlist");
		return mv;
		
	}
	/**
	 * 查看关注列表
	 * @param id 关注ID
	 * @return 显示关注列表
	 */
	@RequestMapping(value="/findFollowFan")
	public ModelAndView findFollowFan(Integer id){
		List<Follow> follows=followService.selectUserFollow(id);
		ModelAndView mv=new ModelAndView("personal/follow/personal_followlist");
		mv.addObject("follows", follows);
		return mv;
	}
}
