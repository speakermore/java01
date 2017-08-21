package ynjh.company.controller.companyResume;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import ynjh.company.entity.Company;
import ynjh.company.entity.CompanyResume;
import ynjh.company.service.CompanyResumeService;
import ynjh.personal.entity.Education;
import ynjh.personal.entity.Follow;
import ynjh.personal.entity.Project;
import ynjh.personal.entity.Work;
import ynjh.personal.service.FollowService;

@Controller
@RequestMapping("/company/cmprs")
public class CompanyResumeController {
	@Resource
	private CompanyResumeService companyResumeService;
	@Resource
	private FollowService followService;
	@RequestMapping(value={"/companyResume","/"}, method=RequestMethod.GET)
	public String index(){
		return "company/cmprs/companyResume";
	}
	/**
	 * 牟勇：查找针对某个岗位的应聘者基本信息列表<br />
	 * 应聘者基本信息放到了session对象中，名叫applyList
	 * 检查每一个应聘者是否被企业关注了，放到了isFollowed中，0表示未关注，1表示关注<br />
	 * @param cmpRecId 招聘信息主键
	 * @param session
	 * @return 跳转招聘信息列表company/cmprs/apply_index
	 */
	@RequestMapping(value="/find_apply_list/{cmpRecId}")
	public ModelAndView findApplyList(@PathVariable Integer cmpRecId,HttpSession session){
		//查询应聘者列表
		List<Map<String, Object>> applyList=companyResumeService.findApplyList(cmpRecId);
		ModelAndView mv=new ModelAndView("company/cmprs/apply_index");
		Company user=(Company)session.getAttribute("user");
		//查询每一个应聘者是否被企业关注
		for(Map<String, Object>apply:applyList){
			Follow follow=followService.findIsFollowByFollowIdAndFollowId(user.getId(), (Integer)apply.get("userId"));
			if(follow==null){
				apply.put("isFollowed", 0);//未关注
			}else{
				apply.put("isFollowed", 1);//已关注
			}
		}
		session.setAttribute("cmpRecId", cmpRecId);
		session.setAttribute("applyList", applyList);
		return mv;
	}
	@RequestMapping(value="/companyResume/findById")
	public ModelAndView findById(Integer id,String toPage,HttpSession session){
		companyResumeService.updateCmpResumeStatus(id, 4);
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
}
