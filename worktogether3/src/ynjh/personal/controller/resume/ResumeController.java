package ynjh.personal.controller.resume;

import java.util.Date;
import java.util.List;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import javax.annotation.Resource;
import javax.jws.soap.SOAPBinding.Use;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import com.sun.org.apache.bcel.internal.generic.NEW;
import ynjh.common.util.UploadFile;
import ynjh.personal.entity.Education;
import ynjh.personal.entity.ForeignKeyEducation;
import ynjh.personal.entity.ForeignKeyProject;
import ynjh.personal.entity.ForeignKeyWork;
import ynjh.personal.entity.Project;
import ynjh.personal.entity.Resume;
import ynjh.personal.entity.User;
import ynjh.personal.entity.Work;
import ynjh.personal.service.ResumeService;

/**
 * 
 * @author 刘志浩 简历信息控制器
 */
@Controller
@RequestMapping("/personal/resume")
public class ResumeController {
	@Resource
	private ResumeService rService;

	/**
	 * 跳转新建简历
	 * 
	 * @return
	 * 
	 * 		String
	 */
	@RequestMapping(value = "/createResume", method = RequestMethod.GET)
	public String createResume() {
		return "personal/resume/personal_createresume";
	}

	/**
	 * 处理创建简历 跳转主页
	 * 
	 * @param resume
	 *            简历对象
	 * @param session
	 * @return
	 * 
	 * 		ModelAndView
	 */
	@RequestMapping(value="/createResume",method=RequestMethod.POST)
	public ModelAndView createResume(Resume resume, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		resume.setResumeCreateDate(new Timestamp(System.currentTimeMillis()));
		User user = (User) session.getAttribute("user");
		resume.setUserId(user.getId());
		resume.setResumeTitle("我的简历");
		/*resume.setResumeHeadImg(UploadFile.uploadFile(
				UploadFile.getUserImgPath("/WEB-INF/resources/img/peraonal", user.getUserLoginId()),
				new MultipartFile[] { resumeFile }, session)[0]);*/
		int result = rService.addResume(resume);
		if (result > 0) {
			mv.addObject("resume", resume);
			mv.addObject("operatorInfo", "创建简历成功");
			mv.setViewName("redirect:../common/initIndex?toPage=1&userId=" + user.getId());
		} else {
			mv.addObject("operatorInfo", "创建简历失败");
			mv.setViewName("personal/resume/personal_createresume");
		}
		return mv;
	}

	/**
	 * 查看简历分页信息
	 * 
	 * @param toPage
	 *            当前页
	 * @param userId
	 *            用户id
	 * @return 页面信息
	 * 
	 *         Object
	 */
	@RequestMapping("/ajaxFindAllResume")
	@ResponseBody
	public Object ajaxFindAllResume(Integer toPage, Integer userId) {
		List<Resume> resumes = rService.findResumeUserId(toPage, userId);
		int maxPage = rService.getMaxResumeById(userId);
		StringBuffer sb = new StringBuffer();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		for (Resume resume : resumes) {
			sb.append("<tr>");
			sb.append("<td><a href='personal/resume/lookResume?id=" + resume.getId() + "'>" + resume.getResumeTitle()
					+ "</a></td>");
			sb.append("<td>"+resume.getResumeJor()+"</td>");
			sb.append("<td>" + sdf.format(resume.getResumeCreateDate()) + "</td>");
			if (resume.getResumeStatusThree() == 1) {
				sb.append("<th>待审核</th>");
			} else if (resume.getResumeStatusThree() == 2) {
				sb.append("<th>正常</th>");
			} else if (resume.getResumeStatusThree() == 3) {
				sb.append("<th>审核未通过</th>");
			} else if (resume.getResumeStatusThree() == 4) {
				sb.append("<th>已被删除</th>");
			}
			sb.append("<td>");
			if (resume.getResumeStatusThree() == 4) {
				sb.append(
						"<a href='personal/resume/updateResume?id=${res.id } '>修改</a>|<a href=\"javascript:if(confirm('你确定真的要恢复这篇简历吗？')){location.href='personal/resume/renewResume?id=${res.id }'} \">恢复</a>");
			} else {
				sb.append(
						"<a href='personal/resume/updateResume?id=${res.id }'>修改</a>|<a href=\"javascript:if(confirm('你确定真的要删除这篇简历吗？')){location.href='personal/resume/deleteResume?id=${res.id }'} \">删除</a>");
			}
			sb.append("</td>");
			sb.append("</tr>");
		}
		sb.append("---" + toPage + "---" + maxPage);
		return sb.toString();
	}

	/**
	 * 查看用户未被删除简历信息 跳转主页
	 * 
	 * @param toPage
	 *            当前页
	 * @param userId
	 *            用户id
	 * @param session
	 * @return
	 * 
	 * 		ModelAndView
	 */
	@RequestMapping("/findAllResume")
	public ModelAndView findAllResume(Integer toPage, Integer userId, HttpSession session) {
		ModelAndView mv = new ModelAndView("personal/user/personal_index");
		List<Resume> resumes = rService.findResumeUserId(toPage, userId);
		int maxPage = rService.getMaxResumeById(userId);
		mv.addObject("maxResumePage", maxPage);
		mv.addObject("curResumePage", toPage);
		mv.addObject("resumes", resumes);
		session.setAttribute("resumes", resumes);
		return mv;
	}

	/**
	 * 查看简历详细信息 跳转预览简历
	 * 
	 * @param id
	 *            简历id
	 * @param session
	 * @return
	 * 
	 * 		ModelAndView
	 */
	@RequestMapping(value = "/lookResume", method = RequestMethod.GET)
	public ModelAndView lookResume(Integer id) {
		ModelAndView mv = new ModelAndView();
		Resume resume = rService.findResumeById(id);
		if (resume != null) {
			mv.addObject("resume", resume);
			mv.setViewName("personal/resume/personal_lookresume");
		}
		return mv;
	}

	/**
	 * 跳转修改简历
	 * 
	 * @param id
	 *            简历id
	 * @return
	 * 
	 * 		ModelAndView
	 */
	@RequestMapping(value = "/updateResume", method = RequestMethod.GET)
	public ModelAndView gotoResume(Integer resumeId) {
		ModelAndView mv = new ModelAndView();
		Resume resume = rService.findResumeById(resumeId);
		if (resume != null) {
			mv.addObject("resume", resume);
			mv.setViewName("personal/resume/personal_updateresume");
		}
		return mv;
	}

	/**
	 * 修改简历 跳转主页
	 * 
	 * @param resume 简历修改的对象
	 * @return
	 * 
	 * 		ModelAndView
	 */
	@RequestMapping(value = "/updateResume", method = RequestMethod.POST)
	public ModelAndView updateResume(Resume resume,HttpSession session) {
		ModelAndView mv = new ModelAndView();
		int result = rService.updateResume(resume);
		if (result>0) {
			mv.addObject("operatorInfo", "修改简历成功！");
			session.setAttribute("resume", resume);
			mv.setViewName("personal/user/personal_index");
		}
		/*
		 * if (result>0) {
		 * 
		 * }else { mv.addObject("operatorInfo","修改简历失败！");
		 * mv.setViewName("personal/resume/personal_updateresume"); }
		 */
		return mv;
	}
	/**
	 * 修改简历头像
	 * 
	 */
	/*
	@RequestMapping(value = "/ajaxUpdateResumeHeadImg", method = RequestMethod.GET)
	public String ajaxUpdateResumeHeadImg(Integer resumeId,MultipartFile resumeHeadImg,HttpSession session){
		User user =(User) session.getAttribute("user");
		String uploadImgNewFileName=UploadFile.uploadFile(
				UploadFile.getUserImgPath("/WEB-INF/resources/img/upload/personal", user.getUserLoginId()),
				new MultipartFile[] { resumeHeadImg }, session)[0];
		Integer result=rService.changeResumeHeadImg(resumeId, uploadImgNewFileName);
		if (result>0) {
			return uploadImgNewFileName;
		}else {
			return null;
		}
	}*/
	
	/**
	 * 删除简历 跳转主页
	 * 
	 * @param id
	 *            简历id
	 * @return
	 * 
	 * 		ModelAndView
	 */
	@RequestMapping(value = "/deleteResume", method = RequestMethod.GET)
	public ModelAndView deleteResume(Integer id, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		int result = rService.deleteResumeById(id);
		User user = (User) session.getAttribute("user");
		if (result > 0) {
			mv.addObject("operatorInfo", "删除简历成功！");
			// mv.addObject("toPage","personal/user/personal_index");
			mv.setViewName("redirect:../common/initIndex?toPage=1&userId=" + user.getId());
		} else {
			mv.addObject("operatorInfo", "删除简历失败！");
			mv.setViewName("personal/user/personal_index");
			// mv.addObject("toPage","personal/user/personal_index");
		}
		return mv;
	}

	/**
	 * 恢复被删除的简历 跳转主页
	 * 
	 * @param id
	 *            简历
	 * @return
	 * 
	 * 		ModelAndView
	 */
	@RequestMapping(value = "/renewResume", method = RequestMethod.GET)
	public ModelAndView renewResume(Integer id, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		int result = rService.renewResumeById(id);
		User user = (User) session.getAttribute("user");
		if (result > 0) {
			mv.addObject("operatorInfo", "恢复简历成功！");
			// mv.addObject("toPage","personal/user/personal_index");
			mv.setViewName("redirect:../common/initIndex?toPage=1&userId=" + user.getId());
		} else {
			mv.addObject("operatorInfo", "恢复简历失败，请联系管理员！");
			mv.setViewName("personal/user/personal_index");
			// mv.addObject("toPage","personal/user/personal_index");
		}
		return mv;
	}

	/* 教育、工作、项目记录增加 */
	/*
	 * 跳转
	 * 
	 * @RequestMapping(value = "/gotoCreateEducation", method =
	 * RequestMethod.GET) public String gotoCreateEducation(Integer resumeId,
	 * HttpSession session) { session.setAttribute("resumeId", resumeId); return
	 * "personal/resume/personal_resume_education"; }
	 */

	/**
	 * 跳转新建工作记录
	 * 
	 * @param resumeId
	 * @param session
	 * @return
	 * 
	 * 		String
	 */
	@RequestMapping(value = "/gotoCreateWork", method = RequestMethod.GET)
	public String gotoCreateWork(Integer resumeId, HttpSession session) {
		session.setAttribute("resumeId", resumeId);
		return "personal/resume/personal_resume_work";
	}

	/**
	 * 跳转新建项目记录
	 * 
	 * @param resumeId
	 * @param session
	 * @return
	 * 
	 * 		String
	 */
	@RequestMapping(value = "/gotoCreateProject", method = RequestMethod.GET)
	public String gotoCreateProject(Integer resumeId, HttpSession session) {
		session.setAttribute("resumeId", resumeId);
		return "personal/resume/personal_resume_project";
	}

	/**
	 * 新建教育经历
	 * 
	 * @param education
	 * @param session
	 * @return
	 * 
	 * 		ModelAndView
	 */
	@RequestMapping(value = "/CreateEducation", method = RequestMethod.POST)
	public ModelAndView CreateEducation(Education education, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		User user = (User) session.getAttribute("user");
		education.setUserId(user.getId());
		education.setResumeType(1);
		int result = rService.addEducation(education);
		if (result > 0) {
			Resume resume = rService.findResumeById(education.getResumeId());
			List<Education> edus = rService.findEducation(resume.getId());
			session.setAttribute("edus", edus);
			mv.addObject("operatorInfo", "添加成功");
			mv.setViewName("personal/resume/personal_lookresume");
		} else {
			mv.addObject("operatorInfo", "添加失败");
			mv.setViewName("personal/resume/personal_resume_education");
		}
		return mv;
	}
	@RequestMapping("/ajaxCreateEducation")
	@ResponseBody
	public Object ajaxCreateEducation(Education education, HttpSession session) {
		User user = (User) session.getAttribute("user");
		education.setUserId(user.getId());
		education.setResumeType(1);
		int result = rService.addEducation(education);
		if (result > 0) {
			/*mv.addObject("operatorInfo", "添加成功");
			mv.addObject("resume", resume);
			mv.setViewName("personal/resume/personal_lookresume");*/
			StringBuffer sb = new StringBuffer();
			List<Education> edus = rService.findEducation(education.getResumeId());
			SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
			for(Education edu:edus){
			sb.append("<tr>");
			sb.append("<td>学校名称：</td>");
			sb.append("<td>"+edu.getEducationSchool()+"</td></tr>");
			sb.append("<tr><td>教育描述：</td>");
			sb.append("<td><p>"+edu.getEducationContent()+"</p></td></tr>");
			sb.append("<tr><td>教育时间：</td>");
			sb.append("<td>"+sdf.format(edu.getEducationBeginTime()));
			sb.append("到"+sdf.format(edu.getEducationEndTime())+"</td></tr>");
			sb.append("<tr><td></td><td class='text-right'><a href='#'>编辑</a>|<a href='personal/resume/deleteResumeEducation?id=${edu.id }'>删除</a></td>");
			sb.append("</tr>");
			}
			return sb;
		} else {
			/*mv.addObject("operatorInfo", "添加失败");
			mv.setViewName("personal/resume/personal_resume_education");*/
		}
		return "空";
		
	}

	/**
	 * 新建工作经历
	 * 
	 * @param work
	 * @param session
	 * @return
	 * 
	 * 		ModelAndView
	 */
	@RequestMapping(value = "/CreateWork", method = RequestMethod.POST)
	public ModelAndView CreateWork(Work work, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		User user = (User) session.getAttribute("user");
		work.setUserId(user.getId());
		work.setResumeType(1);
		int result = rService.addWork(work);
		Resume resume = rService.findResumeById(work.getResumeId());
		if (result > 0) {
			mv.addObject("operatorInfo", "添加成功");
			List<Work> works = rService.findWork(resume.getId());
			session.setAttribute("works", works);
			mv.addObject("resume", resume);
			mv.setViewName("personal/resume/personal_lookresume");
		} else {
			mv.addObject("operatorInfo", "添加失败");
			mv.setViewName("personal/resume/personal_resume_work");
		}
		return mv;
	}

	/**
	 * 新建项目记录
	 * 
	 * @param session
	 * @param project
	 * @return
	 * 
	 * 		ModelAndView
	 */
	@RequestMapping(value = "/CreateProject", method = RequestMethod.POST)
	public ModelAndView CreateProject(HttpSession session, Project project) {
		ModelAndView mv = new ModelAndView();
		User user = (User) session.getAttribute("user");
		project.setUserId(user.getId());
		project.setResumeType(1);
		int result = rService.addProject(project);
		Resume resume = rService.findResumeById(project.getResumeId());
		if (result > 0) {
			mv.addObject("operatorInfo", "添加成功");
			List<Project> projs = rService.findProject(resume.getId());
			session.setAttribute("projs", projs);
			mv.addObject("resume", resume);
			mv.setViewName("personal/resume/personal_lookresume");
		} else {
			mv.addObject("operatorInfo", "添加失败");
			mv.setViewName("personal/resume/personal_resume_project");
		}
		return mv;
	}

	/**
	 * 查看教育经历列表
	 * 
	 * @param resumeId
	 * @return
	 * 
	 * 		ModelAndView
	 */
	@RequestMapping("/lookResumeEdus")
	public String lookResumeEducation(Integer resumeId,HttpSession session) {
		List<Education> edus = rService.findEducation(resumeId);
		session.setAttribute("edus", edus);
		return "personal/resume/personal_lookresume";
		
	}

	/*@RequestMapping("/ajaxlookResumeEdus")
	@ResponseBody
	public Object ajaxlookResumeEducation(Integer resumeId) {
		StringBuffer sb = new StringBuffer();
		List<Education> edus = rService.findEducation(resumeId);
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
		for(Education edu:edus){
		sb.append("<tr><td>学校名称：</td>");
		sb.append("<td>"+edu.getEducationSchool()+"</td></tr>");
		sb.append("<tr><td>教育描述：</td>");
		sb.append("<td><p>"+edu.getEducationContent()+"</p></td></tr>");
		sb.append("<tr><td>教育时间：</td>");
		sb.append("<td>"+sdf.format(edu.getEducationBeginTime()));
		sb.append("到"+sdf.format(edu.getEducationEndTime())+"</td></tr>");
		sb.append(
				"<tr><td></td><td class=\"text-right\"><a href=\"#\">编辑</a>|<a href=\"personal/resume/deleteResumeEducation?id=${edu.id }\">删除</a></td></tr>");
		}
		return sb;
	}*/

	/**
	 * 查看工作记录列表
	 * 
	 * @param resumeId
	 * @return
	 * 
	 * 		ModelAndView
	 */
	@RequestMapping("/lookResumeWork")
	public String lookResumeWork(Integer resumeId,HttpSession session) {
		List<Work> works = rService.findWork(resumeId);
		session.setAttribute("works", works);
		return "personal/resume/personal_lookresume";
	}

	/**
	 * 查看项目记录列表
	 * 
	 * @param resumeId
	 * @return
	 * 
	 * 		ModelAndView
	 */
	@RequestMapping("/lookResumeProjs")
	public String lookResumeProject(Integer resumeId,HttpSession session) {
		List<Project> projs = rService.findProject(resumeId);
		session.setAttribute("projs", projs);
		return "personal/resume/personal_lookresume";
	}

	/**
	 * 删除教育记录
	 * 
	 * @param id
	 * @param session
	 * @return
	 * 
	 * 		ModelAndView
	 */
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

	/**
	 * 删除工作记录
	 * 
	 * @param id
	 * @param session
	 * @return
	 * 
	 * 		ModelAndView
	 */
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

	/**
	 * 删除项目记录
	 * 
	 * @param id
	 * @param session
	 * @return
	 * 
	 * 		ModelAndView
	 */
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

	/**
	 * 恢复被删除的教育经历 跳转当前页
	 * 
	 * @param id
	 *            简历
	 * @return
	 * 
	 * 		ModelAndView
	 */
	@RequestMapping(value = "/renewEducation", method = RequestMethod.GET)
	public ModelAndView renewEducation(Integer id, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		int result = rService.renewEducationByDelete(id);
		User user = (User) session.getAttribute("user");
		if (result > 0) {
			mv.addObject("operatorInfo", "恢复成功！");
			mv.setViewName("redirect:../common/initIndex?toPage=1&userId=" + user.getId());
		} else {
			mv.addObject("operatorInfo", "恢复失败，请联系管理员！");
			mv.setViewName("personal/user/personal_index");
		}
		return mv;
	}

	/**
	 * 恢复被删除的工作历 跳转当前页
	 * 
	 * @param id
	 *            简历
	 * @return
	 * 
	 * 		ModelAndView
	 */
	@RequestMapping(value = "/renewWork", method = RequestMethod.GET)
	public ModelAndView renewWork(Integer id, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		int result = rService.renewWorkByDelete(id);
		User user = (User) session.getAttribute("user");
		if (result > 0) {
			mv.addObject("operatorInfo", "恢复成功！");
			mv.setViewName("redirect:../common/initIndex?toPage=1&userId=" + user.getId());
		} else {
			mv.addObject("operatorInfo", "恢复失败，请联系管理员！");
			mv.setViewName("personal/user/personal_index");
		}
		return mv;
	}

	/**
	 * 恢复被删除的项目经历 跳转当前页
	 * 
	 * @param id
	 *            简历
	 * @return
	 * 
	 * 		ModelAndView
	 */
	@RequestMapping(value = "/renewProject", method = RequestMethod.GET)
	public ModelAndView renewProject(Integer id, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		int result = rService.renewProjectByDelete(id);
		User user = (User) session.getAttribute("user");
		if (result > 0) {
			mv.addObject("operatorInfo", "恢复成功！");
			mv.setViewName("redirect:../common/initIndex?toPage=1&userId=" + user.getId());
		} else {
			mv.addObject("operatorInfo", "恢复失败，请联系管理员！");
			mv.setViewName("personal/user/personal_index");
		}
		return mv;
	}

	/**
	 * 查看被删除的教育记录
	 * 
	 * @param page
	 * @param userId
	 * @return
	 * 
	 * 		ModelAndView
	 */
	@RequestMapping("/findEducationByDelete")
	@ResponseBody
	public Object findEducationByDelete(Integer toPage, Integer userId) {
		List<ForeignKeyEducation> educationDels = rService.findEducationByDelete(toPage, userId);
		int maxPage = rService.getMaxEducationDeleteById(userId);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		StringBuffer sb = new StringBuffer();
		for (ForeignKeyEducation eDels : educationDels) {
			sb.append("<tr>");
			sb.append("<td>" + eDels.getResumeTitle() + "</td>");
			sb.append("<td>" + sdf.format(eDels.getEducationBeginTime()) + "</td>");
			sb.append("<td>" + sdf.format(eDels.getEducationEndTime()) + "</td>");
			sb.append("<td>" + eDels.getEducationSchool() + "</td>");
			sb.append(
					"<td><a href=\"javascript:if(confirm('你确定真的要恢复教育记录吗？')){location.href='personal/resume/renewEducation?id=${eDels.id }'}\">恢复</a></td>");
			sb.append("</tr>");
		}
		sb.append("---" + toPage + "---" + maxPage);
		return sb.toString();
	}

	/**
	 * 查看被删除的工作记录
	 * 
	 * @param page
	 * @param userId
	 * @return
	 * 
	 * 		ModelAndView
	 */
	@RequestMapping("/findWorkByDelete")
	@ResponseBody
	public Object findWorkByDelete(Integer toPage, Integer userId) {
		List<ForeignKeyWork> workDels = rService.findWorkByDelete(toPage, userId);
		int maxPage = rService.getMaxEducationDeleteById(userId);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		StringBuffer sb = new StringBuffer();
		for (ForeignKeyWork wDels : workDels) {
			sb.append("<tr>");
			sb.append("<td>" + wDels.getResumeTitle() + "</td>");
			sb.append("<td>" + sdf.format(wDels.getWorkBeginTime()) + "</td>");
			sb.append("<td>" + sdf.format(wDels.getWorkEndTime()) + "</td>");
			sb.append("<td>" + wDels.getWorkFirmName() + "</td>");
			sb.append(
					"<td><a href=\"javascript:if(confirm('你确定真的要恢复工作记录吗？')){location.href='personal/resume/renewWork?id=${wDels.id }'}\">恢复</a></td>");
			sb.append("</tr>");
		}
		sb.append("---" + toPage + "---" + maxPage);
		return sb.toString();
	}

	/**
	 * 查看被删除的项目记录
	 * 
	 * @param page
	 * @param userId
	 * @return
	 * 
	 * 		ModelAndView
	 */
	@RequestMapping("/findProjectByDelete")
	@ResponseBody
	public Object findProjectByDelete(Integer toPage, Integer userId) {
		List<ForeignKeyProject> projectDels = rService.findProjectByDelete(toPage, userId);
		int maxPage = rService.getMaxEducationDeleteById(userId);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		StringBuffer sb = new StringBuffer();
		for (ForeignKeyProject pDels : projectDels) {
			sb.append("<tr>");
			sb.append("<td>" + pDels.getResumeTitle() + "</td>");
			sb.append("<td>" + sdf.format(pDels.getProjectBeginTime()) + "</td>");
			sb.append("<td>" + sdf.format(pDels.getProjectEndTime()) + "</td>");
			sb.append("<td>" + pDels.getProjectName() + "</td>");
			sb.append(
					"<td><a href=\"javascript:if(confirm('你确定真的要恢复项目记录吗？')){location.href='personal/resume/renewProject?id=${pDels.id }'}\">恢复</a></td>");
			sb.append("</tr>");
		}
		sb.append("---" + toPage + "---" + maxPage);
		return sb.toString();
	}

	@RequestMapping(value = "/test", method = RequestMethod.GET)
	public String test() {
		return "personal/resume/test";
	}

}
