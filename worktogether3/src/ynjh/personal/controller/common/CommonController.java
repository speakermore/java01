package ynjh.personal.controller.common;

import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;
import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import ynjh.common.util.GetAge;
import ynjh.company.entity.Company;
import ynjh.company.entity.CompanyIntroduction;
import ynjh.company.entity.CompanyResume;
import ynjh.company.entity.Offer;
import ynjh.company.service.CompanyIntService;
import ynjh.company.service.CompanyOfferService;
import ynjh.company.service.CompanyService;
import ynjh.personal.entity.Article;
import ynjh.personal.entity.ArticleByFollow;
import ynjh.personal.entity.CompanyList;
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

	/**
	 * 主页对象获取中转
	 * 
	 * @param toPage
	 * @param userId
	 * @return
	 * @author 刘志浩 ModelAndView
	 */
	@RequestMapping("/initIndex")
	public ModelAndView initIndex(Integer toPage, Integer userId, HttpSession session) {
		ModelAndView mv = new ModelAndView("personal/user/personal_index");
		// 简历未删除
		List<Resume> resumes = rService.findResumeUserId(toPage, userId);
		int maxResumePage = rService.getMaxResumeById(userId);
		session.setAttribute("resumes", resumes);
		session.setAttribute("maxResumePage", maxResumePage);

		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		// 我投递过的简历
		List<MySendResume> mySendResumes = rService.findMySendResume(userId);
		if (mySendResumes.size() > 0) {
			session.setAttribute("mySendResumes", mySendResumes);
		} else {
			session.setAttribute("mySendResumes", null);
		}

		// 我收到的面试邀请
		List<Offer> offers=companyOfferService.findUserOffers(userId,toPage);
		int maxPage=companyOfferService.findUserOffersPage(userId);
		if (offers.size() > 0) {
			session.setAttribute("offers", offers);
			session.setAttribute("maxPage",maxPage);
		} else {
			session.setAttribute("offers", null);
		}
		/*List<Offer> offers = rService.findMyReceiveOffer(userId);
		if (offers.size() > 0) {
			session.setAttribute("offers", offers);
		} else {
			session.setAttribute("offers", null);
		}*/

		// 获取简历
		Resume resume = rService.findResumeByOneUserId(userId);
		if (resume != null) {
			try {
				resume.setAge(GetAge.getAgeTools(sdf.parse(sdf.format(resume.getResumeBirthday()))));
				resume.setWorks(GetAge.getAgeTools(sdf.parse(sdf.format(resume.getResumeWorks()))));
			} catch (ParseException e) {
				e.printStackTrace();
			}
			session.setAttribute("resume", resume);
			// 获取教育
			List<Education> edus = rService.findEducation(resume.getId());
			if (edus.size() > 0) {
				session.setAttribute("edus", edus);
			} else {
				session.setAttribute("edus", null);
			}
			// 获取工作
			List<Work> works = rService.findWork(resume.getId());
			if (works.size() > 0) {
				session.setAttribute("works", works);
			} else {
				session.setAttribute("works", null);
			}
			// 获取项目
			List<Project> projs = rService.findProject(resume.getId());
			if (projs.size() > 0) {
				session.setAttribute("projs", projs);
			} else {
				session.setAttribute("projs", null);
			}
		}
		// 获取最新面试消息
		Offer offer = nService.findNewlyFaceByUserId(userId);
		session.setAttribute("offer", offer);

		// 最新发布文章
		Article articleNewly = aService.findNewlyArticleByUserId(userId);
		session.setAttribute("articleNewly", articleNewly);

		// 最近发布的简历
		Resume resumeNewly = rService.findNewlyResumeByUserId(userId);
		session.setAttribute("resumeNewly", resumeNewly);

		// 文章未删除
		List<Article> articles = aService.findUserArticle(toPage, userId);
		int maxArticlePage = aService.getMaxArticleById(userId);
		session.setAttribute("articles", articles);
		session.setAttribute("maxArticlePage", maxArticlePage);
		// 获取评论内容
		Mood mood = mService.selectMoodById(userId);
		session.setAttribute("mood", mood);

		// 查看关注的人数
		int follows = fService.selectUserFollowCount(userId);
		session.setAttribute("follows", follows);
		// 查看被关注的人数
		int byFollows = fService.selectUserByFollowCount(userId);
		session.setAttribute("byFollows", byFollows);

		// 获取已经关注的对象
		List<Follow> UserFollows = fService.selectUserFollow(userId);
		session.setAttribute("UserFollows", UserFollows);
		// 获取已经关注的企业
		List<Follow> CompanyFollows = fService.selectCompanyFollow(userId);
		session.setAttribute("CompanyFollows", CompanyFollows);

		// 获取关注者的最新文章消息
		List<ArticleByFollow> articleByFollows = nService.findNewlyArticleByFollow(userId);
		session.setAttribute("articleByFollows", articleByFollows);

		mv.addObject("curPage", toPage);
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
		Company company = companyService.findCompany(id);
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
		companyresume.setCompanyId(companyId);
		companyresume.setResumeId(resumeId);
		companyresume.setCompanyResumeId(companyResumeId);
		companyresume.setCompanyRecruitId(companyrecruitId);
		companyresume.setCmprTime(new Timestamp(System.currentTimeMillis()));
		int result = rService.sendResumeToCompany(companyresume);
		if (result > 0) {
			mv.addObject("operatorInfo", "投递简历成功");
			mv.addObject("toPage", "redirect:../common/gotoCompanyById?id=" + companyresume.getCompanyId());
		} else {
			mv.addObject("operatorInfo", "投递简历失败");
			mv.addObject("toPage", "redirect:../common/gotoCompanyById?id=" + companyresume.getCompanyId());
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
}
