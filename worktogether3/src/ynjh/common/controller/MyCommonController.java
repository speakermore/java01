package ynjh.common.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
/**
 * 通用的控制跳转
 * @author 牟勇
 *
 */
public class MyCommonController {
	@RequestMapping(value={"/","/index","/index.html"})
	public String index(){
		return "index";
	}
}
