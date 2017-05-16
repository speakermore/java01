package ynjh.personal.controller.common;

import java.util.List;
import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javafx.scene.shape.Arc;
import ynjh.company.entity.Offer;
import ynjh.personal.entity.Article;
import ynjh.personal.entity.ArticleByFollow;
import ynjh.personal.entity.CompanyList;
import ynjh.personal.entity.Education;
import ynjh.personal.entity.Follow;
import ynjh.personal.entity.ForeignKeyEducation;
import ynjh.personal.entity.ForeignKeyProject;
import ynjh.personal.entity.ForeignKeyWork;
import ynjh.personal.entity.Mood;
import ynjh.personal.entity.Newly;
import ynjh.personal.entity.Project;
import ynjh.personal.entity.Resume;
import ynjh.personal.entity.User;
import ynjh.personal.entity.UserAndResume;
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

		// 获取简历
		Resume resume = rService.findResumeByOneUserId(userId);
		
		if (resume!=null) {
			session.setAttribute("resume", resume);
			// 获取教育
			List<Education> edus = rService.findEducation(resume.getId());
			if (edus.size()>0) {
				session.setAttribute("edus", edus);
			}else {
				session.setAttribute("edus", null);
			}
			// 获取工作
			List<Work> works = rService.findWork(resume.getId());
			if (works.size()>0) {
				session.setAttribute("works", works);
			}else {
				session.setAttribute("works", null);
			}
			// 获取项目
			List<Project> projs = rService.findProject(resume.getId());
			if (projs.size()>0) {
				session.setAttribute("projs", projs);
			}else {
				session.setAttribute("projs", null);
			}
		}
		
		//最新发布文章
		Article articleNewly =aService.findNewlyArticleByUserId(userId);
		session.setAttribute("articleNewly", articleNewly);
		
		// 最近发布的简历
		Resume resumeNewly = rService.findNewlyResumeByUserId(userId);
		session.setAttribute("resumeNewly", resumeNewly);

		// 文章未删除
		List<Article> articles = aService.findUserArticle(toPage, userId);
		int maxArticlePage = aService.getMaxArticleById(userId);
		session.setAttribute("articles", articles);
		session.setAttribute("maxArticlePage", maxArticlePage);

		// 查看关注的人数
		int follows = fService.selectUserFollowCount(userId);
		session.setAttribute("follows", follows);

		// 查看被关注的人数
		int byFollows = fService.selectUserByFollowCount(userId);
		session.setAttribute("byFollows", byFollows);

		// 获取评论内容
		Mood mood = mService.selectMoodById(userId);
		session.setAttribute("mood", mood);

		// 获取最新面试消息
		Offer offer = nService.findNewlyFaceByUserId(userId);
		session.setAttribute("offer", offer);

		// 获取已经关注的对象
		List<Follow> followes = fService.selectUserFollow(userId);
		session.setAttribute("followes", followes);

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
	public ModelAndView gotoCompanyById(Integer id) {
		ModelAndView mv = new ModelAndView("company/article/company_index");
		CompanyList user = uService.findCompanyById(id);
		mv.addObject("user", user);
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
	@RequestMapping(value = "/deleteRecord", method = RequestMethod.GET)
	public ModelAndView deleteRecord(Integer toPage, Integer userId, HttpSession session) {
		ModelAndView mv = new ModelAndView("personal/user/personal_delete");
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
		List<ForeignKeyEducation> educationDels = rService.findEducationByDelete(toPage, userId);
		int maxEducationDels = rService.getMaxEducationDeleteById(userId);
		session.setAttribute("educationDels", educationDels);
		session.setAttribute("maxEducationDels", maxEducationDels);
		// 工作记录已删除
		List<ForeignKeyWork> workDels = rService.findWorkByDelete(toPage, userId);
		int maxWorkDels = rService.getMaxWorkDeleteById(userId);
		session.setAttribute("workDels", workDels);
		session.setAttribute("maxWorkDels", maxWorkDels);
		// 项目记录已删除
		List<ForeignKeyProject> projectDels = rService.findProjectByDelete(toPage, userId);
		int maxProjectDels = rService.getMaxProjectDeleteById(userId);
		session.setAttribute("projectDels", projectDels);
		session.setAttribute("maxProjectDels", maxProjectDels);
		return mv;
	}
}
