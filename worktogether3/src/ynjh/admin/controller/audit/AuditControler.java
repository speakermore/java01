package ynjh.admin.controller.audit;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import ynjh.common.util.CommonStatus;
import ynjh.personal.service.UserService;

/**
 * 关于审核的部分方法的控制器
 * @author 牟勇
 *
 */
@Controller
@RequestMapping("admin/audit")
public class AuditControler {
	@Resource
	UserService userService;
	@RequestMapping("/realname/{userId}/{userStatus}/{resumeId}")
	public ModelAndView auditRealName(@PathVariable Integer userId,@PathVariable Integer userStatus,@PathVariable Integer resumeId){
		ModelAndView mv=new ModelAndView("common/info");
		mv.addObject("toPage", "admin/findAuditResumeById?id="+resumeId);
		Integer result=userService.updateUserStatus(userId, userStatus);
		if(result>0){
			mv.addObject("operatorInfo",CommonStatus.USER_STATUS[userStatus]+"成功");
		}else{
			mv.addObject("operatorInfo",CommonStatus.USER_STATUS[userStatus]+"失败，请联系技术人员");
		}
		return mv;
	}
}
