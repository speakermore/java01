package ynjh.common.controller.apply;

import java.sql.Timestamp;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import ynjh.company.entity.CompanyResume;
import ynjh.company.service.CompanyResumeService;
import ynjh.personal.entity.Education;
import ynjh.personal.entity.Project;
import ynjh.personal.entity.Resume;
import ynjh.personal.entity.User;
import ynjh.personal.entity.Work;
import ynjh.personal.service.ResumeService;
/**
 * 应聘<br />
 * 包括提交应聘信息，查看公司信息，查看应聘者简历，提交offer<br />
 * 负责完成个人用户与企业用户之间的对接
 * @author 牟勇
 *
 */
@Controller
@RequestMapping("/common/apply")
public class ApplyController {
	@Resource
	ResumeService resumeService;
	@Resource
	CompanyResumeService companyResumeService;
	/**
	 * 我要应聘<br />
	 * 添加到companyResume表
	 * @param recruitId 招聘信息的主键
	 * @param session
	 * @return 
	 */
	@RequestMapping(value="/i_want_apply/{recruitId}",method=RequestMethod.POST)
	@ResponseBody
	public Object iWantApply(@PathVariable Integer recruitId,HttpSession session){
		User user=(User)session.getAttribute("user");
		//初始化应聘信息，其中2表示通过审核（因为后来说应聘不审核了），1表示企业还没有阅读应聘信息
		CompanyResume apply=new CompanyResume(null,new Timestamp(System.currentTimeMillis()),2,1,null);
		List<Resume> resumes=resumeService.findResumeByUserId(user.getId());
		if(resumes!=null&&resumes.size()>0){
			apply.setResumeId(resumes.get(0).getId());
		}
		apply.setCmpRecId(recruitId);
		//检查是否曾经投过简历，如果返回值大于0可表示投过
		if(companyResumeService.isCompanyResumeExist(recruitId, apply.getResumeId())>0){
			return "您已投递过简历，不要反复进行投递！";
		}
		//投递简历
		Integer result=companyResumeService.addCompanyResume(apply);
		String strResult="";
		if(result>0){
			strResult="添加应聘信息成功！";
		}else{
			strResult="添加应聘信息失败！";
		}
		return strResult;
	}
	/**
	 * 查看简历<br />
	 * 为简历准备相关数据，包括resume,work,education,project
	 * 修改应聘信息的状态
	 * @param resumeId 简历id，简历的主键
	 * @return 跳转简历内容显示页面personal/resume/personal_lookresume_index
	 */
	@RequestMapping("/check_resume/{resumeId}/{userLoginId}/{applyId}")
	public ModelAndView checkResume(@PathVariable Integer resumeId,@PathVariable String userLoginId,@PathVariable Integer applyId){
		ModelAndView mv=new ModelAndView("personal/resume/personal_lookresume_index");
		//准备resume
		Resume resume=resumeService.findResumeById(resumeId);
		//准备工作经验
		List<Work> works=resumeService.findWork(resumeId);
		//准备教育经验
		List<Education> educations=resumeService.findEducation(resumeId);
		//准备项目经验
		List<Project> projects=resumeService.findProject(resumeId);
		//修改应聘的状态为已阅读简历,4表示已阅读
		companyResumeService.updateCmpResumeStatus(applyId, 4);
		mv.addObject("resume", resume);
		mv.addObject("works",works);
		mv.addObject("projs",projects);
		mv.addObject("edus",educations);
		mv.addObject("userLoginId",userLoginId);
		mv.addObject("applyId",applyId);
		return mv;
	}
}
