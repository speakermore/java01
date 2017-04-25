package ynjh.personal.controller.common;

import java.util.List;
import javax.annotation.Resource;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import ynjh.personal.entity.Article;
import ynjh.personal.entity.Education;
import ynjh.personal.entity.Project;
import ynjh.personal.entity.Resume;
import ynjh.personal.entity.Work;
import ynjh.personal.service.ArticleService;
import ynjh.personal.service.ResumeService;

@Controller
@RequestMapping("/personal/common/")
public class CommonController {
	@Resource
	private ResumeService rService;
	@Resource
	private ArticleService aService;

	/**
	 * 主页对象获取中转
	 * 
	 * @param toPage
	 * @param userId
	 * @return
	 * 
	 * 		ModelAndView
	 */
	@RequestMapping("/initIndex")
	public ModelAndView initIndex(Integer toPage, Integer userId) {
		ModelAndView mv = new ModelAndView("personal/user/personal_index");
		// 文章未删除
		List<Article> articles = aService.findUserArticle(toPage, userId);
		int maxArticlePage = aService.getMaxArticleById(userId);
		mv.addObject("articles", articles);
		mv.addObject("maxArticlePage", maxArticlePage);

		// 简历未删除
		List<Resume> resumes = rService.selectResumeUserId(toPage, toPage);
		int maxResumePage = rService.getMaxResumeById(userId);
		mv.addObject("resumes", resumes);
		mv.addObject("maxResumePage", maxResumePage);

		mv.addObject("curPage", toPage);
		return mv;

	}

	@RequestMapping(value = "/deleteRecord", method = RequestMethod.GET)
	public ModelAndView deleteRecord(Integer toPage, Integer userId) {
		ModelAndView mv = new ModelAndView("personal/user/personal_delete");
		mv.addObject("curPage", toPage);
		/*// 文章已删除
		List<Article> articleDels = aService.findArticleDeleteById(toPage, userId);
		int maxArticleDels = aService.getMaxArticleDeleteById(userId);
		mv.addObject("articleDels", articleDels);
		mv.addObject("maxArticleDels", maxArticleDels);
		// 简历已删除
		List<Resume> resumeDels = rService.selectResumeDeleteById(toPage, userId);
		int maxResumeDels = rService.getMaxResumeDeleteById(userId);
		mv.addObject("resumeDels", resumeDels);
		mv.addObject("maxResumeDels", maxResumeDels);*/
		
		
		//教育记录已删除
		List<Education> educationDels=rService.findEducationByDelete(toPage, userId);
		int maxEducationDels=rService.getMaxEducationDeleteById(userId);
		mv.addObject("educationDels", educationDels);
		mv.addObject("maxEducationDels", maxEducationDels);
		//工作记录已删除
		List<Work> workDels=rService.findWorkByDelete(toPage, userId);
		int maxWorkDels=rService.getMaxWorkDeleteById(userId);
		mv.addObject("workDels", workDels);
		mv.addObject("maxWorkDels", maxWorkDels);
		//项目记录已删除
		List<Project> projectDels=rService.findProjectByDelete(toPage, userId);
		int maxProjectDels=rService.getMaxProjectDeleteById(userId);
		mv.addObject("projectDels", projectDels);
		mv.addObject("maxProjectDels", maxProjectDels);
		return mv;
	}
}
