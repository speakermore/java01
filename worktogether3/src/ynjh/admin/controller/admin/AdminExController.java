package ynjh.admin.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

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
}
