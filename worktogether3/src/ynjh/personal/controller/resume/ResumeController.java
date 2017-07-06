package ynjh.personal.controller.resume;

import java.util.List;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import ynjh.common.crowdfund.entity.Job;
import ynjh.common.crowdfund.service.JobService;
import ynjh.common.exception.AgeOverFlowException;
import ynjh.common.exception.ResumeExistsException;
import ynjh.common.util.CommonStatus;
import ynjh.common.util.GetAge;
import ynjh.company.entity.CompanyResume;
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
	@Resource//牟勇：添加岗位的查询业务，以便在createResume中使用
	private JobService jobService;
	/**
	 * 跳转新建简历
	 * @param session 牟勇：添加session，为了在岗位集合不存在的情况下进行集合准备
	 * @return
	 * 
	 * 		String
	 */
	@RequestMapping(value = "/createResume", method = RequestMethod.GET)
	public String createResume(HttpSession session) {
		//牟勇：为了在页面上添加简历标题，备选内容为一级岗位名称而增加的判断，如果没有一级岗位的集合存在，则将它添加到session中
		if(session.getAttribute("myJobs1")==null){
			List<Job> myJobs=jobService.findJob1();
			session.setAttribute("myJobs1", myJobs);
		}
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
	@RequestMapping(value = "/createResume", method = RequestMethod.POST)
	public ModelAndView createResume(Resume resume, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		resume.setResumeCreateDate(new Timestamp(System.currentTimeMillis()));
		//牟勇：
		//1.简历属性更改为空是否有必要？
		//2.民族更改两遍，导致在第二次更改时报空指针
		//3.调用equals方法进行比较时，最好调用常量的equals方法，这样可以避免空指针
		if ("".equals(resume.getResumePlace())) {
			resume.setResumePlace(null);
		}
		if ("".equals(resume.getResumeNation())) {
			resume.setResumeNation(null);
		}
		if ("".equals(resume.getResumeQQ())) {
			resume.setResumeQQ(null);
		}
		if ("".equals(resume.getResumeEducation())) {
			resume.setResumeEducation(null);
		}
		if ("".equals(resume.getResumeMajor())) {
			resume.setResumeMajor(null);
		}
		if ("".equals(resume.getResumeGraduationSchool())) {
			resume.setResumeGraduationSchool(null);
		}
		if ("".equals(resume.getResumeGraduationTime())) {
			resume.setResumeGraduationTime(null);
		}
		if ("".equals(resume.getResumeSelfEvaluation())) {
			resume.setResumeSelfEvaluation(null);
		}
		if ("".equals(resume.getResumeHouseAddress())) {
			resume.setResumeHouseAddress(null);
		}
		
		User user = (User) session.getAttribute("user");
		resume.setUserId(user.getId());
		//牟勇：在页面上增加了标题的下拉框，这句代码不再需要了。
		//resume.setResumeTitle("我的简历");
		try {
			//牟勇：检查简历是否重复（因为只允许写一份简历）
			Resume oldResume=rService.findResumeByOneUserId(user.getId());
			if(oldResume!=null){
				throw new ResumeExistsException();
			}
			int result = rService.addResume(resume);
			if (result > 0) {
				mv.addObject("resume", resume);
				mv.addObject("operatorInfo", "创建简历成功");
				mv.setViewName("redirect:../common/initIndex?toPage=1&userId=" + user.getId());
			} else {
				mv.addObject("operatorInfo", "创建简历失败");
				mv.setViewName("personal/resume/personal_createresume");
			}
		} catch (ResumeExistsException e) {
			//牟勇：发现简历有重复，进这里，保存错误信息，并在错误页面上显示
			mv.addObject("errorInfo", e.toString());
			mv.setViewName("/notlogin");
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
			sb.append("<td>" + resume.getResumeJor() + "</td>");
			sb.append("<td>" + sdf.format(resume.getResumeCreateDate()) + "</td>");
			sb.append("<th>"+CommonStatus.AUDIT_STATUS[resume.getResumeStatusThree()]+"</th>");
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
	@RequestMapping("/updateResumeById")
	@ResponseBody
	public ModelAndView updateResumeById(String page, Integer resumeId, HttpSession session) {
		ModelAndView mv = new ModelAndView(page);
		Resume resume = rService.findResumeById(resumeId);
		if (resume != null) {
			session.setAttribute("resume_update", resume);
		}
		return mv;
	}

	/**
	 * 修改简历 跳转主页
	 * 
	 * @param resume
	 *            简历修改的对象
	 * @return
	 * 
	 * 		ModelAndView
	 */
	@RequestMapping(value = "/updateResume", method = RequestMethod.POST)
	@ResponseBody
	public ModelAndView updateResume(Resume resume, String page, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		Resume oldResume = (Resume) session.getAttribute("resume_update");
		resume.setResumeCreateDate(oldResume.getResumeCreateDate());
		resume.setId(oldResume.getId());
		resume.setUserId(oldResume.getUserId());
		resume.setResumePersonality(oldResume.getResumePersonality());
		resume.setResumeStatusOne(oldResume.getResumeStatusOne());
		resume.setResumeStatusThree(1);
		resume.setResumeHeadImg(oldResume.getResumeHeadImg());
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		try {
			resume.setAge(GetAge.getAgeTools(sdf.parse(sdf.format(resume.getResumeBirthday()))));
			resume.setWorks(GetAge.getAgeTools(sdf.parse(sdf.format(resume.getResumeWorks()))));
		} catch (ParseException e) {
			e.printStackTrace();
		} catch (AgeOverFlowException e) {
			e.printStackTrace();
		}
		int result = rService.updateResume(resume);
		if (result > 0) {
			session.setAttribute("resume", resume);
			mv.setViewName(page);
		}
		
		return mv;
	}
	

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
	@ResponseBody
	public ModelAndView CreateEducation(Education education,String createEducationpage,HttpSession session) {
		ModelAndView mv = new ModelAndView();
		User user = (User) session.getAttribute("user");
		education.setUserId(user.getId());
		education.setResumeType(1);
		int result = rService.addEducation(education);
		if (result > 0) {
			Resume resume = rService.findResumeById(education.getResumeId());
			List<Education> edus = rService.findEducation(resume.getId());
			session.setAttribute("edus", edus);
			mv.setViewName(createEducationpage);
		} else {
			mv.setViewName("error");
		}
		return mv;
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
	@ResponseBody
	public ModelAndView CreateWork(Work work,String createWorkpage, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		User user = (User) session.getAttribute("user");
		work.setUserId(user.getId());
		work.setResumeType(1);
		int result = rService.addWork(work);
		if (result > 0) {
			Resume resume = rService.findResumeById(work.getResumeId());
			List<Work> works = rService.findWork(resume.getId());
			session.setAttribute("works", works);
			session.setAttribute("resume", resume);
			mv.setViewName(createWorkpage);
		}else{
			mv.setViewName("error");
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
	@ResponseBody
	public ModelAndView CreateProject(HttpSession session,String createProjectpage, Project project) {
		ModelAndView mv = new ModelAndView();
		User user = (User) session.getAttribute("user");
		project.setUserId(user.getId());
		project.setResumeType(1);
		int result = rService.addProject(project);
		if (result > 0) {
			Resume resume = rService.findResumeById(project.getResumeId());
			List<Project> projs = rService.findProject(resume.getId());
			session.setAttribute("projs", projs);
			mv.addObject("resume", resume);
			mv.setViewName(createProjectpage);
		} else {
			mv.setViewName("error");
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
	public String lookResumeEducation(Integer resumeId, HttpSession session) {
		List<Education> edus = rService.findEducation(resumeId);
		session.setAttribute("edus", edus);
		return "personal/resume/personal_lookresume";

	}

	

	/**
	 * 查看工作记录列表
	 * 
	 * @param resumeId
	 * @return
	 * 
	 * 		ModelAndView
	 */
	@RequestMapping("/lookResumeWork")
	public String lookResumeWork(Integer resumeId, HttpSession session) {
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
	public String lookResumeProject(Integer resumeId, HttpSession session) {
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
	@ResponseBody
	public ModelAndView deleteResumeEducation(Integer id,String page,HttpSession session) {
		ModelAndView mv = new ModelAndView();
		int result = rService.deleteEducation(id);
		if (result > 0) {
			Resume resume = (Resume) session.getAttribute("resume");
			List<Education> edus = rService.findEducation(resume.getId());
			if (edus.size()>0) {
				session.setAttribute("edus", edus);
			}else {
				session.setAttribute("edus", null);
			}
			session.setAttribute("resume", resume);
			mv.setViewName(page);
		}else {
			mv.setViewName("error");
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
	@ResponseBody
	public ModelAndView deleteResumeWork(Integer id,String page, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		int result = rService.deleteWork(id);
		if (result > 0) {
			Resume resume = (Resume) session.getAttribute("resume");
			List<Work> works = rService.findWork(resume.getId());
			if (works.size()>0) {
				session.setAttribute("works", works);
			}else {
				session.setAttribute("works", null);
			}
			session.setAttribute("resume", resume);
			mv.setViewName(page);
		}else {
			mv.setViewName("error");
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
	@ResponseBody
	public ModelAndView deleteResumeProject(Integer id,String page, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		int result = rService.deleteProject(id);
		if (result > 0) {
			Resume resume = (Resume) session.getAttribute("resume");
			List<Project> projs = rService.findProject(resume.getId());
			if (projs.size()>0) {
				session.setAttribute("projs", projs);
			}else {
				session.setAttribute("projs", null);
			}
			session.setAttribute("resume", resume);
			mv.setViewName(page);
		}else {
			mv.setViewName("error");
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

	/**
	 * 发送简历(只能发送已审核的) 参数 companyId 公司id, resumeId 简历id, companyResumeId
	 * 投递简历的用户ID, companyrecruitId 岗位ID, cmprTime 投递时间
	 * 
	 * @return
	 * 
	 * 		String
	 */
	@RequestMapping("/sendResumeToCompany")
	public ModelAndView sendResumeToCompany(Integer companyId, Integer companyrecruitId, HttpSession session) {
		ModelAndView mv = new ModelAndView("company/info");
		CompanyResume companyResume = new CompanyResume();
		Resume oldResume = (Resume) session.getAttribute("resume");
		User oldUser = (User) session.getAttribute("user");
		companyResume.setCompanyId(companyId);
		companyResume.setCompanyResumeId(oldUser.getId());
		companyResume.setResumeId(oldResume.getId());
		companyResume.setCompanyRecruitId(companyrecruitId);
		companyResume.setCmprTime(new Timestamp(System.currentTimeMillis()));
		int result = rService.sendResumeToCompany(companyResume);
		if (result > 0) {
			mv.addObject("operatorInfo", "投递简称成功，请静候佳音！");
			mv.addObject("toPage", "company/artanddis/company_index");
		} else {
			mv.addObject("operatorInfo", "投递简称失败，请检查你的人品！");
			mv.addObject("toPage", "company/artanddis/company_index");
		}
		return mv;
	}

	/**
	 * 刘志浩：修改教育记录
	 * 
	 * @param education
	 * @param page
	 * @return
	 * 
	 * 		ModelAndView
	 */
	@RequestMapping(value = "/updateEducation", method = RequestMethod.POST)
	@ResponseBody
	public ModelAndView updateEducation(Education education, Integer id, String page, HttpSession session) {
		ModelAndView mv = new ModelAndView(page);
		Resume oldResume = (Resume) session.getAttribute("resume");
		User oldUser = (User) session.getAttribute("user");
		education.setUserId(oldUser.getId());
		education.setResumeId(oldResume.getId());
		education.setResumeType(1);
		int result = rService.updateEducation(education, id);
		if (result > 0) {
			// 获取教育
			List<Education> edus = rService.findEducation(oldResume.getId());
			if (edus.size() > 0) {
				session.setAttribute("edus", edus);
			} else {
				session.setAttribute("edus", null);
			}
		}
		return mv;
	}

	/**
	 * 刘志浩：修改工作记录
	 * 
	 * @param education
	 * @param page
	 * @return
	 * 
	 * 		ModelAndView
	 */
	@RequestMapping(value = "/updateWork", method = RequestMethod.POST)
	@ResponseBody
	public ModelAndView updateWork(Work work, Integer id, String page, HttpSession session) {
		ModelAndView mv = new ModelAndView(page);
		Resume oldResume = (Resume) session.getAttribute("resume");
		User oldUser = (User) session.getAttribute("user");
		work.setUserId(oldUser.getId());
		work.setResumeId(oldResume.getId());
		work.setResumeType(1);
		int result=rService.updateWork(work, id);
		if (result>0) {
			List<Work> works = rService.findWork(oldResume.getId());
			if (works.size() > 0) {
				session.setAttribute("works", works);
			} else {
				session.setAttribute("works", null);
			}
		}
		return mv;
	}

	/**
	 * 刘志浩：修改项目记录
	 * 
	 * @param education
	 * @param page
	 * @return
	 * 
	 * 		ModelAndView
	 */
	@RequestMapping(value = "/updateProject", method = RequestMethod.POST)
	@ResponseBody
	public ModelAndView updateProject(Project project, Integer id, String page, HttpSession session) {
		ModelAndView mv = new ModelAndView(page);
		Resume oldResume = (Resume) session.getAttribute("resume");
		User oldUser = (User) session.getAttribute("user");
		project.setUserId(oldUser.getId());
		project.setResumeId(oldResume.getId());
		project.setResumeType(1);
		int result = rService.updateProject(project, id);
		if (result > 0) {
			// 获取项目
			List<Project> projs = rService.findProject(oldResume.getId());
			if (projs.size() > 0) {
				session.setAttribute("projs", projs);
			} else {
				session.setAttribute("projs", null);
			}
		}
		return mv;
	}
}
