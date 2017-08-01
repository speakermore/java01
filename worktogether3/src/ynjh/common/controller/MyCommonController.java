package ynjh.common.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSON;

import ynjh.admin.entity.News;
import ynjh.admin.service.news.NewsService;
import ynjh.common.crowdfund.entity.Job;
import ynjh.common.crowdfund.service.JobService;
import ynjh.common.entity.ArticleType;
import ynjh.common.service.ArticleTypeService;
import ynjh.common.service.MyCommonResumeService;
import ynjh.common.service.NationService;
import ynjh.common.service.ProvinceService;
import ynjh.company.entity.Company;
import ynjh.personal.entity.Article;
import ynjh.personal.entity.User;
import ynjh.personal.service.ArticleService;



/**
 * 通用的控制跳转
 * @author 牟勇
 *
 */
@Controller
public class MyCommonController {
	Logger logger=Logger.getLogger(MyCommonController.class);
	@Resource
	private NationService nationService;
	@Resource
	private ProvinceService provinceService;
	@Resource
	private NewsService newsService;
	@Resource
	private MyCommonResumeService myCommonResumeService;
	@Resource
	private ArticleService articleService;
	@Resource
	private JobService jobService;
	@Resource
	private ArticleTypeService articleTypeService;
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
	
	/**
	 * ajax方法请求二级岗位
	 * 只能通过POST方式提交
	 * @param parentId 一级岗位id
	 * @return 字符串，select框中的option标签的html
	 */
	@RequestMapping(value="/findJobs2/{parentId}",method=RequestMethod.POST)
	@ResponseBody
	public Object findJobs2(@PathVariable Integer parentId){
		List<Job> jobs2=jobService.findJob2(parentId);
		StringBuffer html=new StringBuffer("<option disable value=\"啥也没选\">请选择职位</option>");
		//循环得到select框中选项的html
		for(Job job:jobs2){
			html.append("<option value='"+job.getJobName()+"'>"+job.getJobName()+"</option>");
		}
		return html.toString();
	}
	
	/**
	 * 主页的ajax显示
	 * 牟勇：为了让企业和个人用户的页面跳转显示得比较顺滑，也为了让菜单很方便的处于它应该在的位置<br />
	 * 特别写了这个方法，把跳转的页面用于刷新个人中心和企业中心的右侧，而不是刷新整个页面，以提升客户体验
	 * @param page 右侧需要加载的页面
	 * @return
	 */
	@RequestMapping("/ajax")
	@ResponseBody
	public ModelAndView ajax(String page,HttpSession session) {
		ModelAndView mv=new ModelAndView(page);
		//加载需要保存到session的对象
		addSessionVar(session);
		//加载一级岗位
		if(session.getAttribute("myJobs1")==null){
			List<Job> myJobs=jobService.findJob1();
			session.setAttribute("myJobs1", myJobs);
		}
		
		//加载文章
		try{
			User user=(User)session.getAttribute("user");
			List<Article> articles=articleService.findUserArticle(null, user.getId());
			mv.addObject("articles", articles);
		}catch(Exception ex){
			logger.debug("此用户不是个人用户");
		}
		try {
			Company user=(Company)session.getAttribute("user");
			List<Article> articles=articleService.findUserArticle(null, user.getId());
			mv.addObject("articles", articles);
		} catch (Exception e) {
			logger.debug("此用户不是企业用户");
		}
		return mv;
	}
	/**
	 * 检查session中是否缺少需要的对象，如果没有就添加
	 * @param session
	 */
	private void addSessionVar(HttpSession session){
		if(session.getAttribute("")==null){
			List<ArticleType> articleTypesForPersonal=articleTypeService.findArticleTypeForPersonal();
			session.setAttribute("articleTypesForPersonal", articleTypesForPersonal);
		}
	}
}
