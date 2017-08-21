package ynjh.personal.controller.mood;
import java.sql.Timestamp;

/**
 * @author 胡林飞 心情功能
 */
import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import ynjh.personal.entity.Mood;
import ynjh.personal.entity.User;
import ynjh.personal.service.MoodService;
@Controller
@RequestMapping("/personal/mood")
public class MoodController {
	@Resource
	private MoodService moodService;
	@RequestMapping("/addMood")
	public ModelAndView addMoodComent(Mood mood,HttpSession session){
		User user = (User) session.getAttribute("user");
		mood.setUserId(user.getId());
		mood.setMoodTime(new Timestamp(System.currentTimeMillis()));
		int result=moodService.addMood(mood);
		ModelAndView mv=new ModelAndView();
		if (result > 0) {
			mv.addObject("operatorInfo", "心情发表成功！");
			mv.setViewName("redirect:../common/initIndex?toPage=1&userId=" + user.getId());
		} else {
			mv.addObject("operatorInfo", "心情发表失败!");
			mv.setViewName("redirect:../common/initIndex?toPage=1&userId=" + user.getId());
		}
		return mv;
	}
	
}
