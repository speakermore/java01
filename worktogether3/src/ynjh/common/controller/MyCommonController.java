package ynjh.common.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller

public class MyCommonController {
	@RequestMapping(value={"/","/index","index.jsp"})
	public String index(){
		return "index";
	}
}
