package ynjh.admin.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * 管理员的扩展控制器
 * @author 牟勇
 *
 */
@Controller
@RequestMapping("/admin")
public class AdminExController {
	
	/**
	 * 跳转首页页面(解决菜单上“首页”链接跳转404的问题)
	 * @return 跳转首页
	 */
	@RequestMapping("/index")
	public String index(){
		return "admin/index";
	}
	/**
	 * 跳转审核简历的页面
	 * @return
	 */
	@RequestMapping(value="/audit/auditResume",method=RequestMethod.GET)
	public String auditResume(){
		return "admin/audit/auditResume";
	}
}
