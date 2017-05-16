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
	
}
