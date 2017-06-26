package ynjh.common.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;

import ynjh.common.service.NationService;
import ynjh.common.service.ProvinceService;

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
	@Resource
	private ProvinceService provinceService;
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
	 * @return ajax对象，民族的名称
	 *
	 */
	@RequestMapping(value="/findAllNationName",method=RequestMethod.POST)
	@ResponseBody
	public Object findAllNationName(){
		List<String> strNationNames=nationService.findAllNationName();
		Object jsonNation=JSON.toJSON(strNationNames);
		return jsonNation;
	}
	@RequestMapping(value="/findAllProvinceName",method=RequestMethod.POST)
	@ResponseBody
	public Object findAllProvinceName(){
		List<String> strProvinceName=provinceService.findAllProvinceName();
		Object jsonProvince=JSON.toJSON(strProvinceName);
		return jsonProvince;
	}
}
