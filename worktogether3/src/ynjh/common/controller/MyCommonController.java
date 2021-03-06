package ynjh.common.controller;

import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

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
import ynjh.common.entity.MyUser;
import ynjh.common.service.ArticleTypeService;
import ynjh.common.service.MyCommonResumeService;
import ynjh.common.service.NationService;
import ynjh.common.service.ProvinceService;
import ynjh.company.entity.Company;
import ynjh.company.entity.CompanyDetailImg;
import ynjh.company.entity.CompanyIntroduction;
import ynjh.company.service.CompanyDiscussService;
import ynjh.company.service.CompanyIntService;
import ynjh.company.service.CompanyRecruitService;
import ynjh.company.service.CompanyService;
import ynjh.personal.entity.Article;
import ynjh.personal.entity.Discuss;
import ynjh.personal.entity.Follow;
import ynjh.personal.entity.Mood;
import ynjh.personal.entity.User;
import ynjh.personal.service.ArticleService;
import ynjh.personal.service.FollowService;
import ynjh.personal.service.MoodService;
import ynjh.personal.service.UserService;



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
	@Resource
	private UserService userService;
	@Resource
	private CompanyService companyService;
	@Resource
	private MoodService moodService;
	@Resource
	private FollowService followService;
	@Resource
	private CompanyRecruitService companyRecruitService;
	@Resource
	private CompanyDiscussService companyDiscussService;
	@Resource
	private CompanyIntService companyIntService;
	/**
	 * 首页的跳转
	 * @return
	 */
	@RequestMapping(value={"/","/index","/index.html"})
	public ModelAndView index(HttpSession session){
		ModelAndView mv=new ModelAndView("index");
		List<News> newses10=newsService.findTop10ByCreateDate();
		//为管理人才准备查询条件
		List<Job> manageJob=jobService.findJob2(4);
		String[] manageNames=manageJob.stream().map(j->j.getJobName()).toArray(size->new String[size]);
		String manageCondition=String.join(",", manageNames);
		//软件人才---管理人才
		List<Map<String, Object>> manageResume=myCommonResumeService.findByResumeTitle5(manageCondition);
		Integer countMangeResume=myCommonResumeService.countByResumeTitle(manageCondition);
		//为技术人才准备查询条件
		List<Job> masterJob=jobService.findJob2NotIncludeParentId(4);
		String[] masterNames=masterJob.stream().map(j->j.getJobName()).toArray(size->new String[size]);
		String masterCondition=String.join(",", masterNames);
		//软件人才---技术人才
		List<Map<String, Object>> masterResume=myCommonResumeService.findByResumeTitle5(masterCondition);
		Integer countMasterResume=myCommonResumeService.countByResumeTitle(masterCondition);
		//名企招聘----管理人才
		List<Map<String, Object>> manageRecuite=myCommonResumeService.findBycmpRecTitle5(manageCondition);
		Integer countManageRecuite=myCommonResumeService.countBycmpRecTitle(manageCondition);
		//名企招聘----技术人才
		List<Map<String, Object>> masterRecuite=myCommonResumeService.findBycmpRecTitle5(masterCondition);
		Integer countMasterReciute=myCommonResumeService.countBycmpRecTitle(masterCondition);
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
		//职位分类
		List<Job> myJobs=jobService.findJob1IncludeJob2();
		//推荐企业
		List<Map<String, Object>> recommendCompanys=companyService.findRecommentCompany();
		List<Map<String, Object>> recommendUsers=userService.recommendUsers();
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
		session.setAttribute("myJobs", myJobs);
		session.setAttribute("recommendCompanys", recommendCompanys);
		session.setAttribute("recommendUsers", recommendUsers);
		
		return mv;
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
	 * 主页的ajax显示<br />
	 * <h3>特别感谢刘志浩</h3>
	 * 牟勇：为了让企业和个人用户的页面跳转显示得比较顺滑，也为了让菜单很方便的处于它应该在的位置<br />
	 * 特别写了这个方法，把跳转的页面用于刷新个人中心和企业中心的右侧，而不是刷新整个页面，以提升客户体验
	 * @param page 右侧需要加载的页面
	 * @return 用户指定的右侧需要加载的页面，如果是另一个控制，需要加redirect前缀
	 */
	@RequestMapping("/ajax")
	@ResponseBody
	public ModelAndView ajax(String page,HttpSession session) {
		ModelAndView mv=new ModelAndView(page);
		//加载需要保存到session的对象
		addSessionVar(session);		
		//如果是点击跳转我的文章页面，则加载文章
		if("common/article/common_index_article".equals(page)){
			MyUser user=(MyUser)session.getAttribute("user");
			List<Article> articles=articleService.findUserArticle(null, user.getId());
			mv.addObject("articles", articles);
		}
		//如果是跳转添加文章页面，则加载文章类型
		if("common/article/common_add_article_index".equals(page)){
			//添加文章类型
			List<ArticleType> articleTypes=null;
			MyUser user=(MyUser) session.getAttribute("user");
			if(user.getId()>=1234567890){
				//个人用户
				articleTypes=articleTypeService.findArticleTypeForPersonal();
			}else{
				//企业用户
				articleTypes=articleTypeService.findArticleTypeForCompany();
			}
			mv.addObject("articleTypes", articleTypes);
		}
		return mv;
	}
	/**
	 * 检查session中是否缺少需要的对象集合，如果没有就添加<br />
	 * session中的对象应该是那种基本不会更新的<br />
	 * 目前有个人用户会用到的所有文章分类，一级职位分类
	 * @param session
	 */
	private void addSessionVar(HttpSession session){
		//加载一级岗位，即岗位种类
		if(session.getAttribute("myJobs1")==null){
			List<Job> myJobs=jobService.findJob1();
			session.setAttribute("myJobs1", myJobs);
		}
	}
	
	/**
	 * 牟勇：查询用户相关更多信息，包括用户的基本信息，用户所发表的文章
	 * 用于在用户中心，点击用户名时，查看用户更多信息并加关注
	 * @param userId 用户主键
	 * @return 跳转到/common/article/common_index_article
	 */
	@RequestMapping("/userMoreInfo/{userId}")
	public ModelAndView userMoreInfo(@PathVariable Integer userId,HttpSession session){
		ModelAndView mv=new ModelAndView("/common/article/common_index_article");
		List<Article> articles=articleService.findUserArticle(null, userId);
		//判断被查看信息的用户是个人还是企业
		if(userId>=1234567890){
			User user=userService.findUserById(userId);
			Mood mood=moodService.findLastestMoodByUserId(userId);
			mv.addObject("userMoreInfo", user);
			//个人用户才有心情文字，企业用户没有
			mv.addObject("moreInfoMood", mood);
		}else{
			Company user=companyService.findCompanyById(userId);
			mv.addObject("userMoreInfo", user);
		}
		//判断被查看信息的用户以前是否已被关注过
		MyUser user=(MyUser)session.getAttribute("user");
		Follow follow=followService.findIsFollowByFollowIdAndFollowId(user.getId(), userId);
		mv.addObject("moreInfoIsFollow", follow);
		mv.addObject("articles", articles);
		return mv;
	}
	/**
	 * 为首页“推荐企业”链接跳转的目标，准备好数据，以便在common/index/company.jsp上展示<br />
	 * 包括公司信息（company）,公司环境图片（detailImgs），文章列表（articles），招聘基本信息（companyRecruits）
	 * 对企业的评价（discusses，页面上未显示），关注（follow）
	 * @param companyId 公司主键
	 * @param session
	 * @return common/index/company.jsp
	 */
	@RequestMapping("/common/recommendCompanyDetail/{companyId}")
	public ModelAndView recommendCompanyDetail(@PathVariable Integer companyId,HttpSession session){
		ModelAndView mv=new ModelAndView("common/index/company");
		//公司信息
		Company company=companyService.findCompanyById(companyId);
		CompanyIntroduction companyInt=companyIntService.findById(companyId);
		//图片详情
		List<CompanyDetailImg>  detailImgs=companyService.findDetailImg(companyId);
		//文章列表（未过滤没有通过审核的文章）
		List<Article> articles=articleService.findUserArticle(null, companyId);
		articles=articles.stream().filter(a->a.getArticleStatus()==2).collect(Collectors.toList());
		//招聘基本信息（未过滤没有通过审核的招聘）：招聘岗位(cmpRecTitle)，月薪(cmpRecWage)，招聘人数(cmpRecPeople)，招聘发布的时间(cmpRecTime)，状态(cmpRecStatus)及应聘的人数统计(resumeNumber)
		List<Map<String, Object>> companyRecruits=companyRecruitService.findRecruitBaseInfo(null, companyId);
		companyRecruits=companyRecruits.stream().filter(r->((Integer)r.get("cmpRecStatus")).intValue()==2).collect(Collectors.toList());
		//对企业的评价
		List<Discuss> discusses=companyDiscussService.findDiscussByCompanyId(companyId);
		//如果用户登录了，就检查他有没有关注过这个企业
		if(session.getAttribute("user")!=null){
			MyUser user=(MyUser)session.getAttribute("user");
			Follow follow=followService.findIsFollowByFollowIdAndFollowId(user.getId(), companyId);
			mv.addObject("follow",follow);
		}
		mv.addObject("company",company);
		mv.addObject("detailImgs",detailImgs); 
		mv.addObject("articles",articles);
		mv.addObject("companyRecruits",companyRecruits);
		mv.addObject("discusses",discusses);
		mv.addObject("companyInt",companyInt);
		return mv;
	}
	/**
	 * 
	 * @param userId
	 * @return
	 */
	@RequestMapping("/common/recommendPersonalDetail/{userId}")
	public ModelAndView recommendPersonalDetail(@PathVariable Integer userId,HttpSession session){
		ModelAndView mv=new ModelAndView("common/index/personal");
		//用户基本信息
		Map<String, Object> personal=userService.recommentPersonalDetail(userId);
		//文章列表（未过滤没有通过审核的文章）
		List<Article> articles=articleService.findUserArticle(null, userId);
		articles=articles.stream().filter(a->a.getArticleStatus()==2).collect(Collectors.toList());
		//如果用户登录了，就检查他有没有关注过这个用户
		if(session.getAttribute("user")!=null){
			MyUser user=(MyUser)session.getAttribute("user");
			Follow follow=followService.findIsFollowByFollowIdAndFollowId(user.getId(), userId);
			mv.addObject("follow",follow);
		}
		mv.addObject("personal",personal);
		mv.addObject("articles",articles);
		return mv;
	}
}