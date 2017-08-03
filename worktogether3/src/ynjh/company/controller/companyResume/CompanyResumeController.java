package ynjh.company.controller.companyResume;
import java.util.List;
import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import ynjh.company.entity.CompanyResume;
import ynjh.company.service.CompanyResumeService;
import ynjh.personal.entity.Education;
import ynjh.personal.entity.Project;
import ynjh.personal.entity.Work;

@Controller
@RequestMapping("/company/cmprs")
public class CompanyResumeController {
	@Resource
	private CompanyResumeService companyResumeService;
	@RequestMapping(value={"/companyResume","/"}, method=RequestMethod.GET)
	public String index(){
		return "company/cmprs/companyResume";
	}
	@RequestMapping(value="/companyResume/findAllResume")
	public ModelAndView findAllResume(Integer companyRecruitId,HttpSession session){
		List<CompanyResume> companyResumes=companyResumeService.findAllResume(companyRecruitId);
		ModelAndView mv=new ModelAndView("company/cmprs/companyResume_index");
		session.setAttribute("companyResumes", companyResumes);
		return mv;
	}
	@RequestMapping(value="/companyResume/findById")
	public ModelAndView findById(Integer id,String toPage,HttpSession session){
		int result=companyResumeService.updateCmpResumeStatus(id, 4);
		CompanyResume companyResume=companyResumeService.findById(id);
		List<Education> edus = companyResumeService.findEducation(companyResume.getResumeId());
		session.setAttribute("edus", edus);
		List<Project> projs=companyResumeService.findProject(companyResume.getResumeId());
		session.setAttribute("projs", projs);
		List<Work> works=companyResumeService.findWork(companyResume.getResumeId());
		session.setAttribute("works", works);
		ModelAndView mv=new ModelAndView("company/cmprs/companyResumesdetail");
		session.setAttribute("cmprs", companyResume);
		mv.setViewName(toPage);
		return mv;
	}
/*	@RequestMapping(value="/companyResume/findEducation")
	public String findEducation(Integer resumeId,HttpSession session){
				return "company/cmprs/companyResumesdetail";
	}*/
/*	@RequestMapping(value="/companyResume/findProject")
	public String findProject(Integer resumeId,HttpSession session){
		return "company/cmprs/companyResumesdetail";
	}
	@RequestMapping(value="/companyResume/findWork")
	public String findWork(Integer resumeId,HttpSession session){
		return "company/cmprs/companyResumesdetail";
	}*/

}
