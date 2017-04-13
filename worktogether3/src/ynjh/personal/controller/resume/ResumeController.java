package ynjh.personal.controller.resume;

import java.sql.Timestamp;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import ynjh.personal.entity.Resume;
import ynjh.personal.entity.User;
import ynjh.personal.service.ResumeService;
@Controller
@RequestMapping("/personal/resume")
public class ResumeController {
	@Resource
	private	ResumeService rService;
	//跳转
	@RequestMapping(value="/createResume",method=RequestMethod.GET)
	public String createResume(){
		return "personal/resume/personal_createresume";
	}
	//创建简历
	@RequestMapping(value="/createResume",method=RequestMethod.POST)
	public ModelAndView createResume(Resume resume,HttpSession session){
		ModelAndView mv=new ModelAndView();
		resume.setResumeCreateDate(new Timestamp(System.currentTimeMillis()));
		resume.setResumeBirthday(new Timestamp(System.currentTimeMillis()));
		resume.setResumeGraduationTime(new Timestamp(System.currentTimeMillis()));
		User user =(User) session.getAttribute("user");
		resume.setUserId(user.getId());
		int result =rService.addResume(resume);
		if (result>0) {
			mv.addObject("resume", resume);
			mv.addObject("operatorInfo", "创建简历成功");
			mv.setViewName("personal/user/personal_index");
		}else {
			mv.addObject("operatorInfo", "创建简历失败");
			mv.setViewName("personal/resume/personal_createresume");
		}
		return mv;
	}
	/*主页*/
	@RequestMapping("/findAllResume")
	public ModelAndView findAllResume(Integer userId){
		ModelAndView mv=new ModelAndView("personal/user/personal_index");
		List<Resume> resumes = rService.selectResumeUserId(userId);
		mv.addObject("resumes", resumes);
		return mv;
	}
	/*详细*/
	@RequestMapping(value="/lookResume",method=RequestMethod.GET)
	public ModelAndView lookResume(Integer id){
		ModelAndView mv=new ModelAndView();
		Resume resume =rService.selectResumeById(id);
		if (resume!=null) {
			mv.addObject("resume", resume);
			mv.setViewName("personal/resume/personal_lookresume");
		}
		return mv;
	}
	//跳转查询
	@RequestMapping(value="/updateResume",method=RequestMethod.GET)
	public ModelAndView gotoResume(Integer id){
		ModelAndView mv=new ModelAndView();
		Resume resume =rService.selectResumeById(id);
		if (resume!=null) {
			mv.addObject("resume", resume);
			mv.setViewName("personal/resume/personal_updateresume");
		}
		return mv;
	}
	/*修改简历*/
	@RequestMapping(value="/updateResume",method=RequestMethod.POST)
	public ModelAndView updateResume(Resume resume){
		ModelAndView mv=new ModelAndView();
		int result =rService.updateResume(resume);
		mv.addObject("operatorInfo","修改简历成功！");
		mv.addObject("resume", resume);
		mv.setViewName("personal/user/personal_index");
		/*if (result>0) {
			
		}else {
			mv.addObject("operatorInfo","修改简历失败！");
			mv.setViewName("personal/resume/personal_updateresume");
		}*/
		return mv;
	}
	//删除
	@RequestMapping(value="/deleteResume",method=RequestMethod.GET)
	public ModelAndView deleteResume(Integer id){
		ModelAndView mv=new ModelAndView();
		int result=rService.deleteResumeById(id);
		if (result>0) {
			mv.addObject("operatorInfo","删除简历成功！");
			//mv.addObject("toPage","personal/user/personal_index");
			mv.setViewName("personal/user/personal_index");
		}else {
			mv.addObject("operatorInfo","删除简历失败！");
			mv.setViewName("personal/user/personal_index");
			//mv.addObject("toPage","personal/user/personal_index");
		}
		return mv;
	}
	
	//查询被删除的简历
	@RequestMapping("/findResumeByDelete")
	public ModelAndView findResumeByDelete(Integer userId){
		ModelAndView mv=new ModelAndView("personal/user/personal_index");
		List<Resume> resumes = rService.selectResumeByDelete(userId);
		mv.addObject("resumeBD", resumes);
		return mv;
	}
	//恢复被删除的简历
	@RequestMapping(value="/renewResume",method=RequestMethod.GET)
	public ModelAndView renewResume(Integer id){
		ModelAndView mv=new ModelAndView();
		int result=rService.renewResumeById(id);
		if (result>0) {
			mv.addObject("operatorInfo","恢复简历成功！");
			//mv.addObject("toPage","personal/user/personal_index");
			mv.setViewName("personal/user/personal_index");
		}else {
			mv.addObject("operatorInfo","恢复简历失败，请联系管理员！");
			mv.setViewName("personal/user/personal_index");
			//mv.addObject("toPage","personal/user/personal_index");
		}
		return mv;
	}
}
