package ynjh.common.controller;

import java.sql.Timestamp;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;

import ynjh.admin.entity.News;
import ynjh.admin.service.news.NewsService;
import ynjh.common.exception.AgeOverFlowException;
import ynjh.common.service.MyCommonResumeService;
import ynjh.common.service.NationService;
import ynjh.common.service.ProvinceService;
import ynjh.common.util.GetAge;

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
	@Resource
	private NewsService newsService;
	@Resource
	private MyCommonResumeService myCommonResumeService;
	/**
	 * 首页的跳转
	 * @return
	 */
	@RequestMapping(value={"/","/index","/index.html"})
	public String index(HttpSession session){
		List<News> newses10=newsService.findTop10ByCreateDate();
		//软件人才---管理人才
		List<Map<String, Object>> manageResume=myCommonResumeService.findByResumeTitle5("经理");
		Integer countMangeResume=myCommonResumeService.countByResumeTitle("经理");
		//软件人才---技术人才
		List<Map<String, Object>> masterResume=myCommonResumeService.findByResumeTitle5("师");
		Integer countMasterResume=myCommonResumeService.countByResumeTitle("师");
		//名企招聘----管理人才
		List<Map<String, Object>> manageRecuite=myCommonResumeService.findBycmpRecTitle5("经理");
		Integer countManageRecuite=myCommonResumeService.countBycmpRecTitle("经理");
		//名企招聘----技术人才
		List<Map<String, Object>> masterRecuite=myCommonResumeService.findBycmpRecTitle5("师");
		Integer countMasterReciute=myCommonResumeService.countBycmpRecTitle("师");
		//技术众筹---个人众筹
		List<Map<String, Object>> personalCrowdfund=myCommonResumeService.findByCrowdfundPerson5();
		Integer countPersonalCrowdfund=myCommonResumeService.countCrowdfundPersonal();
		//技术众筹---企业众筹
		List<Map<String, Object>> companyCrowdfund=myCommonResumeService.findByCrowdfundCompany5();
		Integer countCompanyCrowdfund=myCommonResumeService.countCrowdfundCompany();
		//精品文章---企业文章
		List<Map<String, Object>> companyArticle=myCommonResumeService.findByCompanyArticle5();
		Integer countCompanyArticle=myCommonResumeService.countCompanyArticle();
		//精品文章---个人文章
		List<Map<String, Object>> personalArticle=myCommonResumeService.findByPersonalArticle5();
		Integer countPersonalArticle=myCommonResumeService.countPersonalArticle();
		session.setAttribute("countMangeResume", countMangeResume);
		session.setAttribute("manageResume", manageResume);
		session.setAttribute("countMasterResume", countMasterResume);
		session.setAttribute("masterResume", masterResume);
		session.setAttribute("countManageRecuite", countManageRecuite);
		session.setAttribute("manageRecuite", manageRecuite);
		session.setAttribute("countMasterReciute", countMasterReciute);
		session.setAttribute("masterRecuite", masterRecuite);
		session.setAttribute("personalCrowdfund", personalCrowdfund);
		session.setAttribute("countPersonalCrowdfund", countPersonalCrowdfund);
		session.setAttribute("companyCrowdfund", companyCrowdfund);
		session.setAttribute("countCompanyCrowdfund", countCompanyCrowdfund);
		session.setAttribute("companyArticle", companyArticle);
		session.setAttribute("countCompanyArticle", countCompanyArticle);
		session.setAttribute("personalArticle", personalArticle);
		session.setAttribute("countPersonalArticle", countPersonalArticle);
		session.setAttribute("newses10", newses10);
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
	/**
	 * ajax的方式向JSP页面传递省的名字，
	 * 只能使用POST方式获取
	 * @return ajax对象，省的名称
	 */
	@RequestMapping(value="/findAllProvinceName",method=RequestMethod.POST)
	@ResponseBody
	public Object findAllProvinceName(){
		List<String> strProvinceName=provinceService.findAllProvinceName();
		Object jsonProvince=JSON.toJSON(strProvinceName);
		return jsonProvince;
	}
}
