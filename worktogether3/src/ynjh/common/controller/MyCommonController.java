package ynjh.common.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;

import ynjh.common.service.NationService;

@Controller
/**
 * 通用的控制跳转
 * @author 牟勇
 *
 */
@Service
public class MyCommonController {
	
	@Resource
	private NationService nationService;
	/**
	 * 首页的跳转
	 * @return
	 */
	@RequestMapping(value={"/","/index","/index.html"})
	public String index(){
		return "index";
	}
	
	/**
	 * ajax的方式向JSP页面传递民族的名字，
	 * 只能使用POST方式获取
	 * @param session
	 * @param request
	 * @return ajax对象，民族的名称
	 *
	 */
	@RequestMapping(value="/findAllNationName",method=RequestMethod.POST)
	@ResponseBody
	public Object findAllNationName(HttpSession session,HttpServletRequest request){
		List<String> strNationNames=nationService.findAllNationName();
		Object jsonNation=JSON.toJSON(strNationNames);
		return jsonNation;
	}
}
