package ynjh.personal.controller.common;

import java.sql.Timestamp;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import ynjh.company.entity.Company;
import ynjh.company.entity.CompanyIntroduction;
import ynjh.company.entity.CompanyRecruit;
import ynjh.company.entity.CompanyResume;
import ynjh.company.entity.Offer;
import ynjh.company.service.CompanyIntService;
import ynjh.company.service.CompanyOfferService;
import ynjh.company.service.CompanyRecruitService;
import ynjh.company.service.CompanyService;

import ynjh.personal.entity.ArticleByFollow;
import ynjh.personal.entity.Education;
import ynjh.personal.entity.Follow;
import ynjh.personal.entity.ForeignKeyEducation;
import ynjh.personal.entity.ForeignKeyProject;
import ynjh.personal.entity.ForeignKeyWork;
import ynjh.personal.entity.Mood;
import ynjh.personal.entity.MySendResume;
import ynjh.personal.entity.Project;
import ynjh.personal.entity.Resume;
import ynjh.personal.entity.User;
import ynjh.personal.entity.Work;
import ynjh.personal.service.ArticleService;
import ynjh.personal.service.FollowService;
import ynjh.personal.service.MoodService;
import ynjh.personal.service.NewlyService;
import ynjh.personal.service.ResumeService;
import ynjh.personal.service.UserService;

/**
 * 主页对象分配控制器
 * 
 * @author 刘志浩
 *
 */
@Controller
@RequestMapping("/personal/common/")
public class CommonController {
	@Resource
	private ResumeService rService;
	@Resource
	private ArticleService aService;
	@Resource
	private FollowService fService;
	@Resource
	private MoodService mService;
	@Resource
	private NewlyService nService;
	@Resource
	private UserService uService;
	@Resource
	private CompanyService companyService;
	@Resource
	private CompanyIntService companyIntService;
	@Resource
	private CompanyOfferService companyOfferService;
	@Resource
	private CompanyRecruitService companyRecruitService;

	/**
	 * 主页对象获取中转
	 * 牟勇：获得“我感兴趣的招聘信息”，“我投递过的简历”，“我收到的面试邀请（offer）”，
	 * 简历信息，教育经验，工作经验，项目经验，
	 * 发表的文章，对文章的回复，关注的数量，被关注的数量，关注企业等数据供页面显示
	 * @param userId 登录用户的主键
	 * @return 跳转到personal/user/personal_index
	 * @author 刘志浩 
	 */
	@RequestMapping("/initIndex")
	public ModelAndView initIndex(Integer userId, HttpSession session) {
		ModelAndView mv = new ModelAndView("personal/user/personal_index");
		//牟勇：我感兴趣的招聘信息（时间是6个月以内，必须通过审核）
		List<CompanyRecruit> companyRecruits=companyRecruitService.findMyIntrestRecruit(userId);
		session.setAttribute("comanyRecruits", companyRecruits);
		// 牟勇：我投递过的简历（时间是6个月以内，必须通过审核）
		List<MySendResume> mySendResumes = rService.findMySendResume(userId);
		session.setAttribute("mySendResumes", mySendResumes);
		// 牟勇：我收到的面试邀请（时间是6个月以内，必须通过审核）
		List<Offer> offers = companyOfferService.findUserOffers(userId);
		session.setAttribute("personal_offers_list", offers);
		// 获取简历
		Resume resume = rService.findResumeByOneUserId(userId);
		if (resume != null) {
			session.setAttribute("resume", resume);
			// 获取教育
			List<Education> edus = rService.findEducation(resume.getId());
			session.setAttribute("edus", edus);
			// 获取工作
			List<Work> works = rService.findWork(resume.getId());
			session.setAttribute("works", works);
			// 获取项目
			List<Project> projs = rService.findProject(resume.getId());
			session.setAttribute("projs", projs);
		}
		// 牟勇：获取最新关注者的文章发表日期不超过二周的文章消息,必须通过审核
		List<ArticleByFollow> articleByFollows = nService.findNewlyArticleByFollow(userId);
		session.setAttribute("articleByFollows", articleByFollows);
		// 获取最新面试消息。牟勇：这里就是未阅读的面试消息
		List<Offer> newlyOffers = nService.findNewlyFaceByUserId(userId);
		session.setAttribute("personal_offer", newlyOffers);
		// 牟勇：查询个人用户对我的文章的评论
		List<Map<String, Object>> articleByComments = nService.findNewlyCommentArticleByUserId(userId);
		session.setAttribute("personal_comments", articleByComments);
		// 获取心情对象
		Mood mood = mService.findLastestMoodByUserId(userId);
		session.setAttribute("mood", mood);
		// 查看我关注的人数统计
		int follows = fService.countFollow(userId);
		session.setAttribute("follows", follows);
		// 查看关注我的人数统计
		int byFollows = fService.countByFollow(userId);
		session.setAttribute("byFollows", byFollows);

		// 获取已经关注的个人用户
		List<Follow> UserFollows = fService.findUserFollow(userId);
		session.setAttribute("userFollows", UserFollows);
		// 获取已经关注的企业
		List<Follow> CompanyFollows = fService.findCompanyFollow(userId);
		session.setAttribute("companyFollows", CompanyFollows);
		return mv;
	}

	/***
	 * 跳转企业主页
	 * 
	 * @param id
	 * @return
	 * @author 刘志浩 ModelAndView
	 */
	@RequestMapping(value = "gotoCompanyById", method = RequestMethod.GET)
	public ModelAndView gotoCompanyById(Integer id, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		Company company = companyService.findCompanyById(id);
		CompanyIntroduction companyInt = companyIntService.findById(company.getId());
		session.setAttribute("company", company);
		session.setAttribute("companyInt", companyInt);
		mv.setViewName("company/artanddis/company_index");
		return mv;
	}

	/***
	 * 投递简历
	 * 
	 * @param id
	 * @return
	 * @author 刘志浩 ModelAndView
	 */
	@RequestMapping(value = "sendResumeToCompany", method = RequestMethod.GET)
	public ModelAndView sendResumeToCompany(Integer companyId, Integer resumeId, Integer companyResumeId,
			Integer companyrecruitId) {
		ModelAndView mv = new ModelAndView("personal/info");
		CompanyResume companyresume = new CompanyResume();
		//companyresume.setCompanyId(companyId);
		companyresume.setResumeId(resumeId);
		//companyresume.setCompanyResumeId(companyResumeId);
		//companyresume.setCompanyRecruitId(companyrecruitId);
		companyresume.setCmprTime(new Timestamp(System.currentTimeMillis()));
		int result = rService.sendResumeToCompany(companyresume);
		if (result > 0) {
			mv.addObject("operatorInfo", "投递简历成功");
			mv.addObject("toPage", "redirect:../common/gotoCompanyById?id=");
		} else {
			mv.addObject("operatorInfo", "投递简历失败");
			mv.addObject("toPage", "redirect:../common/gotoCompanyById?id=");
		}
		return mv;
	}

	/**
	 * 删除简历信息时分配对象
	 * 
	 * @param toPage
	 * @param userId
	 * @param session
	 * @return
	 * @author 刘志浩 ModelAndView
	 */
	@RequestMapping("/deleteRecord")
	@ResponseBody
	public ModelAndView deleteRecord(Integer toPage, String page, HttpSession session) {
		ModelAndView mv = new ModelAndView(page);
		User oldUser = (User) session.getAttribute("user");
		mv.addObject("curPage", toPage);
		/*
		 * // 文章已删除 List<Article> articleDels =
		 * aService.findArticleDeleteById(toPage, userId); int maxArticleDels =
		 * aService.getMaxArticleDeleteById(userId); mv.addObject("articleDels",
		 * articleDels); mv.addObject("maxArticleDels", maxArticleDels); //
		 * 简历已删除 List<Resume> resumeDels =
		 * rService.selectResumeDeleteById(toPage, userId); int maxResumeDels =
		 * rService.getMaxResumeDeleteById(userId); mv.addObject("resumeDels",
		 * resumeDels); mv.addObject("maxResumeDels", maxResumeDels);
		 */

		// 教育记录已删除
		List<ForeignKeyEducation> educationDels = rService.findEducationByDelete(toPage, oldUser.getId());
		int maxEducationDels = rService.getMaxEducationDeleteById(oldUser.getId());
		session.setAttribute("educationDels", educationDels);
		session.setAttribute("maxEducationDels", maxEducationDels);
		// 工作记录已删除
		List<ForeignKeyWork> workDels = rService.findWorkByDelete(toPage, oldUser.getId());
		int maxWorkDels = rService.getMaxWorkDeleteById(oldUser.getId());
		session.setAttribute("workDels", workDels);
		session.setAttribute("maxWorkDels", maxWorkDels);
		// 项目记录已删除
		List<ForeignKeyProject> projectDels = rService.findProjectByDelete(toPage, oldUser.getId());
		int maxProjectDels = rService.getMaxProjectDeleteById(oldUser.getId());
		session.setAttribute("projectDels", projectDels);
		session.setAttribute("maxProjectDels", maxProjectDels);
		return mv;
	}
	
	@RequestMapping("/test")
	public String test(){
		return "personal/resume/personal_resume_project";
	}
}
