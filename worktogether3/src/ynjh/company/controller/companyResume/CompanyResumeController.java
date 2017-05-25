package ynjh.company.controller.companyResume;
import java.util.List;
import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import ynjh.company.entity.Company;
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
	public ModelAndView findAllResume(Integer companyId,HttpSession session){
		companyId=((Company)session.getAttribute("user")).getId();
		List<CompanyResume> companyResumes=companyResumeService.findAllResume(companyId);
		ModelAndView mv=new ModelAndView("company/cmprs/companyResume_index");
		session.setAttribute("companyResumes", companyResumes);
		return mv;
	}
	@RequestMapping(value="/companyResume/findById")
	public ModelAndView findById(Integer id,String toPage,HttpSession session){
		int result=companyResumeService.updateCmpResumeStatus(id, 4);
		CompanyResume companyResume=companyResumeService.findById(id);
		ModelAndView mv=new ModelAndView("company/cmprs/companyResumeInfomation");
		session.setAttribute("cmprs", companyResume);
		mv.setViewName(toPage);
		return mv;
	}
/*	@RequestMapping(value="/companyResume/findEducation")
	public String findEducation(Integer resumeId,HttpSession session){
		List<Education> edus = companyResumeService.findEducation(resumeId);
		session.setAttribute("edus", edus);
		return "company/cmprs/companyResumeInfomation";
	}
	@RequestMapping(value="/companyResume/findProject")
	public String findProject(Integer resumeId,HttpSession session){
		List<Project> projs=companyResumeService.findProject(resumeId);
		session.setAttribute("projs", projs);
		return "company/cmprs/companyResumeInfomation";
	}
	@RequestMapping(value="/companyResume/findWork")
	public String findWork(Integer resumeId,HttpSession session){
		List<Work> works=companyResumeService.findWork(resumeId);
		session.setAttribute("works", works);
		return "company/cmprs/companyResumeInfomation";
	}
*/
}
