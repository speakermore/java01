package ynjh.company.controller.companyrecruit;

import java.sql.Timestamp;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import ynjh.common.crowdfund.entity.Job;
import ynjh.common.entity.MyUser;
import ynjh.company.entity.Company;
import ynjh.company.entity.CompanyRecruit;
import ynjh.company.service.CompanyRecruitService;


@Controller
@RequestMapping("/company/cmprs")
public class CompanyRecruitController {
	@Resource
	private CompanyRecruitService companyRecruitService;
	@RequestMapping(value={"/companyRecruit","/"}, method=RequestMethod.GET)
	public String index(){
		return "company/cmprs/recruit_index";
	}
	@RequestMapping(value="/recruit_add", method=RequestMethod.GET)
	public String addCompanyRecuit(HttpSession session){
		List<Job> jobs1=companyRecruitService.findJobs1();
		session.setAttribute("jobs1", jobs1);
		return "company/cmprs/recruit_add";
	}
	/**
	 * 添加招聘信息并默认信息状态为待审
	 * @param companyRecruit 包含招聘信息的实体类（招聘岗位，城市，人数，月薪，岗位描述）
	 * @param session
	 * @return 显示成功或失败的信息，并跳转到企业首页company/company/findById
	 */
	@RequestMapping(value="/recruit_add", method=RequestMethod.POST)
	public ModelAndView addCompanyRecruit(CompanyRecruit companyRecruit,HttpSession session){
		companyRecruit.setCmpRecStatus(1);
		companyRecruit.setCmpRecTime(new Timestamp(System.currentTimeMillis()));
		Integer companyId=((Company)session.getAttribute("user")).getId();
		companyRecruit.setCompanyId(companyId);
		int result=companyRecruitService.addCompanyRecruit(companyRecruit);
		ModelAndView mv=new ModelAndView("common/info");
		if(result>0){
			mv.addObject("operatorInfo","招聘信息添加成功");
			mv.addObject("toPage","company/company/findById/"+companyId);
		}else{
			mv.addObject("operatorInfo", "招聘信息添加失败，请稍后再试或联系管理员");
			mv.addObject("toPage","company/company/findById/"+companyId);
		}
		return mv;
	}
	//查询所有招聘信息
	 @RequestMapping(value="/find_all/{page}")
	 public ModelAndView findAll(@PathVariable Integer page,HttpSession session){
		 MyUser user=(MyUser)session.getAttribute("user");
		 List<Map<String, Object>> companyRecruits=companyRecruitService.findRecruitBaseInfo(page,user.getId());
		 int maxPage=companyRecruitService.findMaxPage();
		 ModelAndView mv=new ModelAndView("company/cmprs/recruit_index");
		 session.setAttribute("companyRecruits", companyRecruits);
		 mv.addObject("page", page);
		 mv.addObject("maxPage", maxPage);
		 return mv;	
	 }
		@RequestMapping(value="/recruit_index",method=RequestMethod.GET)
		public String addUser(){
			return "company/cmprs/recruit_index";
		}
		//首页查询所有招聘信息
		 @RequestMapping(value="/companyRecruit/findAllDetil/{page}")
		 public ModelAndView findAllDetil(@PathVariable Integer page,HttpSession session){
			 Integer companyId=((Company)session.getAttribute("user")).getId();
			 List<Map<String, Object>> companyRecruits=companyRecruitService.findRecruitBaseInfo(page,companyId);
			 int maxPage=companyRecruitService.findMaxPage();
			 ModelAndView mv=new ModelAndView("company/artanddis/company_index");
			 mv.addObject("companyRecruits", companyRecruits);
			 mv.addObject("page", page);
			 mv.addObject("maxPage", maxPage);
			 return mv;
		 }
	 /**
	  * 根据招聘信息主键id查询所属招聘信息，然后再按照不同的请求，跳转不同的显示页面<br />
	  * company/cmprs/recruit_detail:招聘信息详情页面
	  * company/cmprs/recruit_edit：招聘信息修改页面
	  * @param id 招聘信息的id
	  * @param toPage 跳转显示页面的路径数组下标
	  * @return 目前跳转招聘信息显示页面和招聘信息修改页面
	  */
	 @RequestMapping(value="/find_recruit_detail/{id}/{toPage}")
	 public ModelAndView findById(@PathVariable Integer id,@PathVariable Integer toPage){
	 	//跳转显示页面的路径数组
		 String[] urls={"company/cmprs/recruit_detail","company/cmprs/recruit_edit"};
		CompanyRecruit companyRecruit=companyRecruitService.findById(id);
		ModelAndView mv=new ModelAndView();
		mv.addObject("cmpr", companyRecruit);
		mv.setViewName(urls[toPage]);
		return mv;
	 }
	
	 /**
	  * 停止招聘<br />
	  * 用于响应招聘信息列表页的停止招聘链接，<br />
	  * 修改招聘信息表的状态为5（停止招聘）<br />
	  * 记录用户行为，并进行扣费(service方法中实现) <br />
	  * 扣费之后，判断企业的招聘是不是全停了，如果是全停了，更改企业的招聘状态，并更改session中的用户状态(service方法中实现)<br />
	  * @param recruitId 招聘信息的主键
	  * @return company/cmpr/find_all/1，重新刷新招聘信息列表页面
	  */
	 @RequestMapping("/stop_recruit/{recruitId}")
	 public ModelAndView stopRecruit(@PathVariable Integer recruitId,HttpSession session){
		Company user=(Company)session.getAttribute("user");
		companyRecruitService.stopRecruit(recruitId,user);
		ModelAndView mv=new ModelAndView();
		mv.setViewName("redirect:/company/cmprs/find_all/1");
		return mv;
	 }
	 /**
	  * 开始招聘<br />
	  * 点击页面上开始招聘链接时响应的控制器方法<br />
	  * 暂时没有接收service方法返回的用户行为对象UserRecord<br />
	  * @param id 要开始进行招聘的招聘信息主键
	  * @return 跳转招聘信息的列表页面
	  */
	 @RequestMapping("/start_recruit/{recruitId}")
	 public ModelAndView startRecruit(@PathVariable Integer recruitId,HttpSession session){
		 Company user=(Company)session.getAttribute("user");
		 companyRecruitService.startRecruit(recruitId,user);
		 ModelAndView mv=new ModelAndView("redirect:/company/cmprs/find_all/1");
		 return mv;
	 }
	 @RequestMapping(value="/update",method=RequestMethod.POST)
	 public ModelAndView updateCompanyRecruit(CompanyRecruit companyRecruit,HttpSession session){
		 int result=companyRecruitService.updateRecruit(companyRecruit);
		 MyUser user=(MyUser)session.getAttribute("user");
		 ModelAndView mv=new ModelAndView();
		 if(result>0){
			 mv.addObject("operatorInfo","修改成功");
			 mv.addObject("toPage","company/company/findById/"+user.getId());
			 mv.setViewName("common/info");
		 }else{
			 mv.addObject("operatorInfo","修改失败,稍后再试或联系管理员");
			 mv.addObject("toPage","company/company/findById/"+user.getId());
			 mv.setViewName("common/info");
		 }
		 return mv;
	 }
	 @RequestMapping("/recruit_detail")
	 public String companyRecruitDetail(Integer id){
		 return "company/cmpr/recruit_detail";
	 }
}

