package ynjh.company.controller.companyrecruit;

import java.sql.Timestamp;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;



import ynjh.company.entity.CompanyRecruit;
import ynjh.company.service.CompanyRecruitService;


@Controller
@RequestMapping("/companyRecruit")
public class CompanyRecruitController {
	@Resource
	private CompanyRecruitService companyRecruitService;
	@RequestMapping(value="/addCompanyRecruit", method=RequestMethod.GET)
	public String addCompanyRecuit(){
		return "addCompanyRecruit";
	}
	@RequestMapping(value="/addCompanyRecruit", method=RequestMethod.POST)
	public ModelAndView addCompanyRecruit(CompanyRecruit companyRecruit,HttpSession session){
		CompanyRecruit user=(CompanyRecruit)session.getAttribute("companyId");
		companyRecruit.setId(user.getId());
		companyRecruit.setCmpRecTime(new Timestamp(System.currentTimeMillis()));
		int result=companyRecruitService.addCompanyRecruit(companyRecruit);
		ModelAndView mv=new ModelAndView();
		if(result>0){
			mv.addObject("operatorInfo","文章添加成功");
			mv.addObject("toPage","companyRecruit/findAll");
			mv.setViewName("info");
		}else{
			mv.addObject("operatorInfo", "文章添加失败");
			mv.setViewName("redirect:/addCompanyRecruit");
		}
		return mv;
	}
	 @RequestMapping(value="/findAll")
	 public ModelAndView findAll(){
		 List<CompanyRecruit> companyRecruit=companyRecruitService.findAll(null);
		 ModelAndView mv=new ModelAndView("index");
		 mv.addObject("companyRecruits", companyRecruit);
		 return mv;
	 }
	 @RequestMapping(value="findById")
	 public ModelAndView findById(Integer id,String topage){
		 CompanyRecruit companyRecruit=companyRecruitService.findById(id);
		 ModelAndView mv=new ModelAndView();
		 mv.addObject("companyRecruit",companyRecruit );
		 return mv;
	 }
	 @RequestMapping(value="hidden")
	 public ModelAndView hidden(Integer id){
			int result=companyRecruitService.hidden(id);
			ModelAndView mv=new ModelAndView();
			if(result>0){
				mv.addObject("operatorInfo","修改成功");
				mv.addObject("toPage","findAll");
				mv.setViewName("info");
			}else{
				mv.addObject("operatorInfo","修改失败");
				mv.addObject("toPage","addCompanyRecruit");
				
				mv.setViewName("info");
			}
			return mv;
}
}
