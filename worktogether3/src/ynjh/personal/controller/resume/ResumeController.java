package ynjh.personal.controller.resume;

import java.util.List;
import java.sql.Timestamp;
import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import ynjh.personal.entity.Education;
import ynjh.personal.entity.Project;
import ynjh.personal.entity.Resume;
import ynjh.personal.entity.User;
import ynjh.personal.entity.Work;
import ynjh.personal.service.ResumeService;

@Controller
@RequestMapping("/personal/resume")
public class ResumeController {
	@Resource
	private ResumeService rService;

	// 跳转
	@RequestMapping(value = "/createResume", method = RequestMethod.GET)
	public String createResume() {
		return "personal/resume/personal_createresume";
	}

	// 创建简历
	@RequestMapping(value = "/createResume", method = RequestMethod.POST)
	public ModelAndView createResume(Resume resume, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		resume.setResumeCreateDate(new Timestamp(System.currentTimeMillis()));
		resume.setResumeBirthday(new Timestamp(System.currentTimeMillis()));
		resume.setResumeGraduationTime(new Timestamp(System.currentTimeMillis()));
		User user = (User) session.getAttribute("user");
		resume.setUserId(user.getId());
		int result = rService.addResume(resume);
		if (result > 0) {
			mv.addObject("resume", resume);
			mv.addObject("operatorInfo", "创建简历成功");
			mv.setViewName("personal/user/personal_index");
		} else {
			mv.addObject("operatorInfo", "创建简历失败");
			mv.setViewName("personal/resume/personal_createresume");
		}
		return mv;
	}

	/* 主页 */
	@RequestMapping("/ajaxFindAllResume")
	public ModelAndView findAllResume(Integer toPage,Integer userId) {
		ModelAndView mv = new ModelAndView("personal/user/personal_index");
		List<Resume> resumes = rService.selectResumeUserId(toPage,userId);
		int maxPage=rService.getMaxResumeById(userId);
		mv.addObject("maxPage", maxPage);
		mv.addObject("curPage", toPage);
		mv.addObject("resumes", resumes);
		return mv;
	}

	/* 详细 */
	@RequestMapping(value = "/lookResume", method = RequestMethod.GET)
	public ModelAndView lookResume(Integer id, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		Resume resume = rService.selectResumeById(id);
		if (resume != null) {
			mv.addObject("resume", resume);
			session.setAttribute("resume", resume);
			mv.setViewName("personal/resume/personal_lookresume");
		}
		return mv;
	}

	// 跳转查询
	@RequestMapping(value = "/updateResume", method = RequestMethod.GET)
	public ModelAndView gotoResume(Integer id) {
		ModelAndView mv = new ModelAndView();
		Resume resume = rService.selectResumeById(id);
		if (resume != null) {
			mv.addObject("resume", resume);
			mv.setViewName("personal/resume/personal_updateresume");
		}
		return mv;
	}

	/* 修改简历 */
	@RequestMapping(value = "/updateResume", method = RequestMethod.POST)
	public ModelAndView updateResume(Resume resume) {
		ModelAndView mv = new ModelAndView();
		int result = rService.updateResume(resume);
		mv.addObject("operatorInfo", "修改简历成功！");
		mv.addObject("resume", resume);
		mv.setViewName("personal/user/personal_index");
		/*
		 * if (result>0) {
		 * 
		 * }else { mv.addObject("operatorInfo","修改简历失败！");
		 * mv.setViewName("personal/resume/personal_updateresume"); }
		 */
		return mv;
	}

	// 删除
	@RequestMapping(value = "/deleteResume", method = RequestMethod.GET)
	public ModelAndView deleteResume(Integer id) {
		ModelAndView mv = new ModelAndView();
		int result = rService.deleteResumeById(id);
		if (result > 0) {
			mv.addObject("operatorInfo", "删除简历成功！");
			// mv.addObject("toPage","personal/user/personal_index");
			mv.setViewName("personal/user/personal_index");
		} else {
			mv.addObject("operatorInfo", "删除简历失败！");
			mv.setViewName("personal/user/personal_index");
			// mv.addObject("toPage","personal/user/personal_index");
		}
		return mv;
	}

	// 查询被删除的简历
	@RequestMapping("/findResumeByDelete")
	public ModelAndView findResumeByDelete(Integer userId) {
		ModelAndView mv = new ModelAndView("personal/user/personal_index");
		List<Resume> resumes = rService.selectResumeByDelete(userId);
		mv.addObject("resumeBD", resumes);
		return mv;
	}

	// 恢复被删除的简历
	@RequestMapping(value = "/renewResume", method = RequestMethod.GET)
	public ModelAndView renewResume(Integer id) {
		ModelAndView mv = new ModelAndView();
		int result = rService.renewResumeById(id);
		if (result > 0) {
			mv.addObject("operatorInfo", "恢复简历成功！");
			// mv.addObject("toPage","personal/user/personal_index");
			mv.setViewName("personal/user/personal_index");
		} else {
			mv.addObject("operatorInfo", "恢复简历失败，请联系管理员！");
			mv.setViewName("personal/user/personal_index");
			// mv.addObject("toPage","personal/user/personal_index");
		}
		return mv;
	}

	/* 教育、工作、项目记录增加 */
	/* 跳转 
	@RequestMapping(value = "/gotoCreateEducation", method = RequestMethod.GET)
	public String gotoCreateEducation(Integer resumeId, HttpSession session) {
		session.setAttribute("resumeId", resumeId);
		return "personal/resume/personal_resume_education";
	}*/

	/* 跳转 */
	@RequestMapping(value = "/gotoCreateWork", method = RequestMethod.GET)
	public String gotoCreateWork(Integer resumeId, HttpSession session) {
		session.setAttribute("resumeId", resumeId);
		return "personal/resume/personal_resume_work";
	}

	/* 跳转 */
	@RequestMapping(value = "/gotoCreateProject", method = RequestMethod.GET)
	public String gotoCreateProject(Integer resumeId, HttpSession session) {
		session.setAttribute("resumeId", resumeId);
		return "personal/resume/personal_resume_project";
	}

	/* 添加Education */
	@RequestMapping(value = "/CreateEducation", method = RequestMethod.POST)
	public ModelAndView CreateEducation(Education education,
			HttpSession session) {
		ModelAndView mv = new ModelAndView();
		User user = (User) session.getAttribute("user");
		education.setUserId(user.getId());
		education.setResumeType(1);
		int result = rService.addEducation(education);
		Resume resume = rService.selectResumeById(education.getResumeId());
		mv.addObject("resume", resume);
		mv.setViewName("personal/resume/personal_lookresume");
		if (result > 0) {
			mv.addObject("operatorInfo", "添加成功");

		} else {
			mv.addObject("operatorInfo", "添加失败");
			mv.setViewName("personal/resume/personal_resume_education");
		}
		return mv;
	}

	/* 添加Work */
	@RequestMapping(value = "/CreateWork", method = RequestMethod.POST)
	public ModelAndView CreateWork( Work work,
			HttpSession session) {
		ModelAndView mv = new ModelAndView();
		User user = (User) session.getAttribute("user");
		Integer resumeId = (Integer) session.getAttribute("resumeId");
		work.setResumeId(resumeId);
		work.setUserId(user.getId());
		work.setResumeType(1);
		int result = rService.addWork(work);
		Resume resume = rService.selectResumeById(resumeId);
		if (result > 0) {
			mv.addObject("operatorInfo", "添加成功");
			mv.addObject("resume", resume);
			mv.setViewName("personal/resume/personal_lookresume");
		} else {
			mv.addObject("operatorInfo", "添加失败");
			mv.setViewName("personal/resume/personal_resume_work");
		}
		return mv;
	}

	/* 添加Project */
	@RequestMapping(value = "/CreateProject", method = RequestMethod.POST)
	public ModelAndView CreateProject(HttpSession session,
			Project project) {
		ModelAndView mv = new ModelAndView();
		User user = (User) session.getAttribute("user");
		Integer resumeId = (Integer) session.getAttribute("resumeId");
		project.setUserId(user.getId());
		project.setResumeId(resumeId);
		project.setResumeType(1);
		int result = rService.addProject(project);
		Resume resume = rService.selectResumeById(resumeId);
		if (result > 0) {
			mv.addObject("operatorInfo", "添加成功");
			mv.addObject("resume", resume);
			mv.setViewName("personal/resume/personal_lookresume");
		} else {
			mv.addObject("operatorInfo", "添加失败");
			mv.setViewName("personal/resume/personal_resume_project");
		}
		return mv;
	}

	/* 查看Education */
	@RequestMapping("/lookResumeEdus")
	public ModelAndView lookResumeEducation(Integer resumeId) {
		ModelAndView mv = new ModelAndView();
		List<Education> edus = rService.findEducation(resumeId);
		mv.addObject("edus", edus);
		mv.setViewName("personal/resume/personal_lookresume");
		return mv;
	}

	/* 查看Work */
	@RequestMapping("/lookResumeWork")
	public ModelAndView lookResumeWork(Integer resumeId) {
		ModelAndView mv = new ModelAndView();
		List<Work> works = rService.findWork(resumeId);
		mv.addObject("works", works);
		mv.setViewName("personal/resume/personal_lookresume");
		return mv;
	}

	/* 查看Project */
	@RequestMapping("/lookResumeProjs")
	public ModelAndView lookResumeProject(Integer resumeId) {
		ModelAndView mv = new ModelAndView();
		List<Project> projs = rService.findProject(resumeId);
		mv.addObject("projs", projs);
		mv.setViewName("personal/resume/personal_lookresume");
		return mv;
	}

	/* 删除Education */
	@RequestMapping(value = "/deleteResumeEducation", method = RequestMethod.GET)
	public ModelAndView deleteResumeEducation(Integer id, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		int result = rService.deleteEducation(id);
		Resume resume = (Resume) session.getAttribute("resume");
		if (result > 0) {
			mv.addObject("operatorInfo", "删除成功！");
			mv.addObject("resume", resume);
			mv.setViewName("personal/resume/personal_lookresume");
		}
		return mv;
	}

	/* 删除Work */
	@RequestMapping(value = "/deleteResumeWork", method = RequestMethod.GET)
	public ModelAndView deleteResumeWork(Integer id, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		int result = rService.deleteWork(id);
		Resume resume = (Resume) session.getAttribute("resume");
		if (result > 0) {
			mv.addObject("operatorInfo", "删除成功！");
			mv.addObject("resume", resume);
			mv.setViewName("personal/resume/personal_lookresume");
		}
		return mv;
	}

	/* 删除Project */
	@RequestMapping(value = "/deleteResumeProject", method = RequestMethod.GET)
	public ModelAndView deleteResumeProject(Integer id, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		int result = rService.deleteProject(id);
		Resume resume = (Resume) session.getAttribute("resume");
		if (result > 0) {
			mv.addObject("operatorInfo", "删除成功！");
			mv.addObject("resume", resume);
			mv.setViewName("personal/resume/personal_lookresume");
		}
		return mv;
	}

	@RequestMapping(value = "/test", method = RequestMethod.GET)
	public String test() {
		return "personal/resume/test";
	}

	
}
