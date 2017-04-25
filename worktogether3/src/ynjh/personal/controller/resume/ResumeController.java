package ynjh.personal.controller.resume;

import java.util.Date;
import java.util.List;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;

import javax.annotation.Resource;
import javax.jws.soap.SOAPBinding.Use;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import ynjh.personal.entity.Education;
import ynjh.personal.entity.Project;
import ynjh.personal.entity.Resume;
import ynjh.personal.entity.User;
import ynjh.personal.entity.Work;
import ynjh.personal.service.ResumeService;
/**
 * 
 * @author 刘志浩
 * 简历信息控制器
 */
@Controller
@RequestMapping("/personal/resume")
public class ResumeController {
	@Resource
	private ResumeService rService;
	/**
	 * 跳转新建简历
	 * @return
	 * 
	 * String
	 */
	@RequestMapping(value = "/createResume", method = RequestMethod.GET)
	public String createResume() {
		return "personal/resume/personal_createresume";
	}

	/**
	 * 处理创建简历 跳转主页
	 * @param resume 简历对象
	 * @param session
	 * @return
	 * 
	 * ModelAndView
	 */
	@RequestMapping(value = "/createResume", method = RequestMethod.POST)
	public ModelAndView createResume(Resume resume, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		resume.setResumeCreateDate(new Timestamp(System.currentTimeMillis()));
		User user = (User) session.getAttribute("user");
		resume.setUserId(user.getId());
		int result = rService.addResume(resume);
		if (result > 0) {
			mv.addObject("resume", resume);
			mv.addObject("operatorInfo", "创建简历成功");
			mv.setViewName("redirect:../resume/findAllResume?toPage=1&userId="+user.getId());
		} else {
			mv.addObject("operatorInfo", "创建简历失败");
			mv.setViewName("personal/resume/personal_createresume");
		}
		return mv;
	}

	/**
	 * 查看简历分页信息
	 * @param toPage 当前页
	 * @param userId 用户id
	 * @return 页面信息
	 * 
	 * Object
	 */
	@RequestMapping("/ajaxFindAllResume")
	@ResponseBody
	public Object ajaxFindAllResume(Integer toPage,Integer userId) {
		List<Resume> resumes = rService.selectResumeUserId(toPage,userId);
		int maxPage=rService.getMaxResumeById(userId);
		StringBuffer sb=new StringBuffer();
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd"); 
		for(Resume resume:resumes){
			sb.append("<tr>");
			sb.append("<td><a href=\"personal/resume/lookResume?id="+resume.getId()+"\">"+resume.getResumeTitle()+"</a></td>");
			sb.append("<td>"+sdf.format(resume.getResumeCreateDate())+"</td>");
			if (resume.getResumeStatusThree()==1) {
				sb.append("<th>待审核</th>");
			}else if (resume.getResumeStatusThree()==2) {
				sb.append("<th>正常</th>");
			}else if (resume.getResumeStatusThree()==3) {
				sb.append("<th>审核未通过</th>");
			}else if (resume.getResumeStatusThree()==4) {
				sb.append("<th>已被删除</th>");
			}
			sb.append("<td>");
			if (resume.getResumeStatusThree() == 4) {
					sb.append("<a href=\"personal/resume/updateResume?id=${resume.id }\">修改</a>|<a href=\"javascript:if(confirm('你确定真的要恢复这篇简历吗？')){location.href='personal/resume/renewResume?id=${art.id }'}\">恢复</a>");
			}else {
				sb.append("<a href=\"personal/resume/updateResume?id=${resume.id }\">修改</a>|<a href=\"javascript:if(confirm('你确定真的要删除这篇简历吗？')){location.href='personal/resume/deleteResume?id=${resume.id }'}\">删除</a>");
			}
				sb.append("</td>");
				sb.append("</tr>");
		}sb.append("---"+toPage+"---"+maxPage);
		return sb.toString();
	}
	/**
	 * 查看用户未被删除简历信息  跳转主页
	 * @param toPage 当前页
	 * @param userId 用户id
	 * @param session
	 * @return
	 * 
	 * ModelAndView
	 */
/*	@RequestMapping("/findAllResume")
	public ModelAndView findAllResume(Integer toPage,Integer userId,HttpSession session) {
		ModelAndView mv = new ModelAndView("personal/user/personal_index");
		List<Resume> resumes = rService.selectResumeUserId(toPage,userId);
		int maxPage=rService.getMaxResumeById(userId);
		mv.addObject("maxResumePage", maxPage);
		mv.addObject("curResumePage", toPage);
		mv.addObject("resumes", resumes);
		session.setAttribute("resumes", resumes);
		return mv;
	}*/

	/**
	 * 查看简历详细信息 跳转预览简历
	 * @param id 简历id
	 * @param session
	 * @return
	 * 
	 * ModelAndView
	 */
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

	/**
	 * 跳转修改简历
	 * @param id 简历id
	 * @return
	 * 
	 * ModelAndView
	 */
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

	/**
	 * 修改简历 跳转主页
	 * @param resume 简历修改的对象
	 * @return
	 * 
	 * ModelAndView
	 */
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

	/**
	 * 删除简历 跳转主页
	 * @param id 简历id
	 * @return
	 * 
	 * ModelAndView
	 */
	@RequestMapping(value = "/deleteResume", method = RequestMethod.GET)
	public ModelAndView deleteResume(Integer id,HttpSession session) {
		ModelAndView mv = new ModelAndView();
		int result = rService.deleteResumeById(id);
		User user =(User) session.getAttribute("user");
		if (result > 0) {
			mv.addObject("operatorInfo", "删除简历成功！");
			// mv.addObject("toPage","personal/user/personal_index");
			mv.setViewName("redirect:../common/initIndex?toPage=1&userId="+user.getId());
		} else {
			mv.addObject("operatorInfo", "删除简历失败！");
			mv.setViewName("personal/user/personal_index");
			// mv.addObject("toPage","personal/user/personal_index");
		}
		return mv;
	}

	

	/**
	 * 恢复被删除的简历 跳转主页
	 * @param id 简历
	 * @return
	 * 
	 * ModelAndView
	 */
	@RequestMapping(value = "/renewResume", method = RequestMethod.GET)
	public ModelAndView renewResume(Integer id,HttpSession session) {
		ModelAndView mv = new ModelAndView();
		int result = rService.renewResumeById(id);
		User user=(User) session.getAttribute("user");
		if (result > 0) {
			mv.addObject("operatorInfo", "恢复简历成功！");
			// mv.addObject("toPage","personal/user/personal_index");
			mv.setViewName("redirect:../common/initIndex?toPage=1&userId="+user.getId());
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
