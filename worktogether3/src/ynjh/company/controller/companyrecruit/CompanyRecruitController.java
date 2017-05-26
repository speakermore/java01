package ynjh.company.controller.companyrecruit;

import java.sql.Timestamp;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import ynjh.company.entity.Company;
import ynjh.company.entity.CompanyRecruit;
import ynjh.company.service.CompanyRecruitService;

@Controller
@RequestMapping("/company/cmprs")
public class CompanyRecruitController {
	@Resource
	private CompanyRecruitService companyRecruitService;

	@RequestMapping(value = { "/companyRecruit", "/" }, method = RequestMethod.GET)
	public String index() {
		return "company/cmprs/companyRecruit_index";
	}

	@RequestMapping(value = "/companyRecruit/add_companyRecruit", method = RequestMethod.GET)
	public String addCompanyRecuit() {
		return "company/cmprs/add_companyRecruit";
	}

	// 添加招聘信息并默认信息状态为待审
	@RequestMapping(value = "/companyRecruit/add_companyRecruit", method = RequestMethod.POST)
	public ModelAndView addCompanyRecruit(CompanyRecruit companyRecruit, HttpSession session) {
		Company company = (Company) session.getAttribute("company");
		companyRecruit.setCmpRecStatus(1);
		companyRecruit.setCmpRecTime(new Timestamp(System.currentTimeMillis()));
		Integer companyId = ((Company) session.getAttribute("user")).getId();
		companyRecruit.setCompanyId(companyId);
		int result = companyRecruitService.addCompanyRecruit(companyRecruit);
		ModelAndView mv = new ModelAndView("company/cmprs/companyRecruit_info");
		if (result > 0) {
			mv.addObject("operatorInfo", "招聘信息添加成功");
			mv.addObject("toPage", "company/cmprs/companyRecruit/findAll");
			session.setAttribute("companyRecruit", companyRecruit);
		} else {
			mv.addObject("operatorInfo", "招聘信息添加失败");
			mv.setViewName("company/cmprs/add_companyRecruit");
		}
		return mv;
	}

	// 查询所有招聘信息
	@RequestMapping(value = "/companyRecruit/findAll")
	public ModelAndView findAll(Integer page, HttpSession session) {
		Integer companyId = ((Company) session.getAttribute("user")).getId();
		Integer resumeCount = companyRecruitService.findCount(companyId);
		List<CompanyRecruit> companyRecruits = companyRecruitService.findAll(page, companyId);
		int maxPage = companyRecruitService.findMaxPage();
		ModelAndView mv = new ModelAndView("company/cmprs/companyRecruit_index");
		mv.addObject("companyRecruits", companyRecruits);
		mv.addObject("page", page);
		mv.addObject("maxPage", maxPage);
		mv.addObject("resumeCount", resumeCount);
		return mv;
	}

	@RequestMapping(value = "/companyRecruit/companyRecruit_index", method = RequestMethod.GET)
	public String addUser() {
		return "company/cmprs/companyRecruit_index";
	}

	// 首页查询所有招聘信息
	@RequestMapping(value = "/companyRecruit/findAllDetil/{page}")
	public ModelAndView findAllDetil(@PathVariable Integer page, HttpSession session) {
		Integer companyId = ((Company) session.getAttribute("company")).getId();
		List<CompanyRecruit> companyRecruits = companyRecruitService.findAll(page, companyId);
		int maxPage = companyRecruitService.findMaxPage();
		ModelAndView mv = new ModelAndView("company/artanddis/company_index");
		mv.addObject("companyRecruits", companyRecruits);
		mv.addObject("page", page);
		mv.addObject("maxPage", maxPage);
		return mv;
	}

	// 根据id查询所属招聘信息
	@RequestMapping(value = "/companyRecruit/findById")
	public ModelAndView findById(Integer id, String toPage) {
		CompanyRecruit companyRecruit = companyRecruitService.findById(id);
		ModelAndView mv = new ModelAndView();
		mv.addObject("cmpr", companyRecruit);
		mv.setViewName(toPage);
		return mv;
	}

	// 根据id隐藏招聘信息
	@RequestMapping("/companyRecruit/hidden")
	public ModelAndView hidden(Integer id) {
		int result = companyRecruitService.hidden(id);
		ModelAndView mv = new ModelAndView();
		if (result > 0) {
			mv.addObject("operatorInfo", "修改成功");
			mv.addObject("toPage", "company/cmprs/companyRecruit/findAll");
			mv.setViewName("company/cmprs/companyRecruit_info");
		} else {
			mv.addObject("operatorInfo", "修改失败");
			mv.addObject("toPage", "company/cmprs/companyRecruit/companyRecruit_index");
			mv.setViewName("company/cmprs/companyRecruit_info");
		}
		return mv;
	}

	@RequestMapping(value = "/companyRecruit/updateCmpRecruit", method = RequestMethod.POST)
	public ModelAndView updateCompanyRecruit(CompanyRecruit companyRecruit, HttpSession session) {
		int result = companyRecruitService.updateCompanyRecruit(companyRecruit);
		ModelAndView mv = new ModelAndView();
		if (result > 0) {
			mv.addObject("operatorInfo", "修改成功");
			mv.addObject("toPage", "company/cmprs/companyRecruit/findAll");
			mv.setViewName("company/cmprs/companyRecruit_info");
		} else {
			mv.addObject("operatorInfo", "修改失败");
			mv.addObject("toPage", "company/cmprs/companyRecruit/companyRecruit_edit");
			mv.setViewName("company/cmprs/companyRecruit_info");
		}
		return mv;
	}
}
