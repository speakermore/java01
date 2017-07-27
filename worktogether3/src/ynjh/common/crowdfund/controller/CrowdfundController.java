package ynjh.common.crowdfund.controller;

import java.sql.Timestamp;
import java.util.List;


import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.alibaba.fastjson.JSON;

import ynjh.common.crowdfund.entity.Crowdfund;
import ynjh.common.crowdfund.entity.CrowdfundDemand;
import ynjh.common.crowdfund.entity.CrowdfundUser;
import ynjh.common.crowdfund.entity.Job;
import ynjh.common.crowdfund.service.CrowdfundDemandService;
import ynjh.common.crowdfund.service.CrowdfundService;
import ynjh.common.crowdfund.service.CrowdfundUserService;
import ynjh.common.crowdfund.service.JobService;
import ynjh.common.util.NoSameList;
import ynjh.company.entity.Company;
import ynjh.company.service.CompanyService;
import ynjh.personal.entity.Resume;
import ynjh.personal.entity.User;
import ynjh.personal.service.ResumeService;
import ynjh.personal.service.UserService;

/**
 * 项目众筹模块控制层
 * @author 何爽
 *data:2017-5-10
 */
@Controller
@RequestMapping("/crowdfund")
public class CrowdfundController {
	@Resource
	private CrowdfundService cfService;
	@Resource
	private ResumeService rService;
	@Resource
	private CrowdfundDemandService cfDemandService;
	@Resource
	private CompanyService companyService;
	@Resource
	private UserService userService;
	@Resource
	private JobService jobService;
	@Resource
	private CrowdfundUserService cfUserService;
	//所有众筹相关连接(测试使用)
	@RequestMapping("/mycrowdfund")
	public String mycrowdfund(HttpSession session){
		//添加测试用户信息
		User user = new User();
		user.setId(1234567896);
		user.setUserName("何爽");
		session.setAttribute("user", user);
		return "crowdfund/myCrowdfund";
	}
	//跳转众筹推荐列表界面
	@RequestMapping(value="/crowdfundLikeList")
	public String CrowdfundList(Model model,HttpSession session){
		//判断用户存在与否
		User user=null;
		try{
		user = (User)session.getAttribute("user");
		}catch(Exception e){
			e.printStackTrace();
			user=null;
		}
		//众筹推荐集合
		List<Crowdfund> cfListTop = null;
		//合并众筹推荐表
		//Set<Crowdfund> onlyCf = new TreeSet<Crowdfund>();
		if(user!=null){
			//根据用户ID获取用户简历
			Resume resume = rService.findNewlyResumeByUserId(user.getId());
			//获取简历中岗位意向（数组）,按逗号拆分
			String interestings = resume.getResumeJor();
			String[] interesting = interestings.split(",");
			for(int i=0;i<interesting.length;i++){
				cfListTop = cfService.getCrowdfundJob(interesting[i]);
			}
			cfListTop = NoSameList.removeSameList(cfListTop);
			//判断匹配度，为空则按方案一显示
			if(cfListTop==null){
				cfListTop =  cfService.findCrowdfundAll(2);
			}else{
				model.addAttribute("crowdfundTopList",cfListTop);
			}
		}else{
			cfListTop =  cfService.findCrowdfundAll(2);
			model.addAttribute("crowdfundTopList",cfListTop);
		}
		
		return "crowdfund/crowdfundList";
	}
	
	//获取所有众筹信息
	@RequestMapping(value="/crowdfundAllList")
	public String cflistAll(@RequestParam Integer page,Model model){
		//分页
		int pageSize=6;
		//获取总数量
		int cfPageCount = cfService.crowdfundCount();
		//总页数
		int pageNums=0;
		//计算页数
		if(cfPageCount%pageSize==0){
			pageNums=cfPageCount/pageSize;
		}else if(cfPageCount%pageSize>0){
			pageNums=cfPageCount/pageSize+1;
		}
		//开始记录页
		int nextPage = (page-1)*pageSize;
		List<Crowdfund> list = cfService.findCrowdfundAll(nextPage);
		model.addAttribute("pageNums", pageNums);
		model.addAttribute("page", page);
		model.addAttribute("crowdfundAllList", list); 
		return "crowdfund/crowdfundList";
	}
	//搜索众筹信息
	@RequestMapping(value="/crowdfundSou",method=RequestMethod.POST)
	public String cflistSou(@RequestParam String interesting,Model model){
		if(interesting!=null){
			String newinfo = interesting.toLowerCase();
			List<Crowdfund> list = cfService.wantFindCrowdfundAll(newinfo.trim());
			model.addAttribute("wantList", list);
		}
		return "crowdfund/crowdfundList";
	}
	//单个众筹信息查看
	@RequestMapping(value="/crowdfundOnlyInfo")
	public String crowdfundOnlyInfo(@RequestParam int id,Model model){
		//根据id获取当前众筹信息
		Crowdfund crowdfund = cfService.findCrowdfundOnly(id);
		//获取众筹项目的岗位需求信息
		List<CrowdfundDemand> crowdfundDemandList = cfDemandService.listCrowdfundDemand(id);
		model.addAttribute("crowdfundDemandList", crowdfundDemandList);
		model.addAttribute("crowdfund", crowdfund);
		//获取发布者信息（姓名、单位、联系人）
		//企业信息
		if(crowdfund.getPublisherId()<1234567891){
			Company company = companyService.findCompany(crowdfund.getPublisherId());
			model.addAttribute("userorcom", company.getCompanyName());
		}else if(crowdfund.getPublisherId()>1234567890){
			//个人信息
			User user = userService.selectUserById(crowdfund.getPublisherId());
			model.addAttribute("userorcom", user.getUserName());
		}
		return "crowdfund/crowdfundOnlyInfo";
	}
	//添加众筹信息(企业或个人)
	@RequestMapping(value="toAddcrowdfund")
	public String toAddcrowdfund(Model model){
		List<Job> listJob = jobService.findJob1();
		model.addAttribute("listJob1", listJob);
		return "crowdfund/addCrowdfund";
	}
	//添加众筹信息处理
	@RequestMapping(value="addCrowdfund",method=RequestMethod.POST)
	public String addCrowdfund(@RequestParam String crowdfundProjectName,@RequestParam String crowdfundProjectMoney,@RequestParam String crowdfundProjectCycle,
			@RequestParam String crowdfundProjectEndDate,@RequestParam String crowdfundProjectSummary,@RequestParam String crowdfundProjectMethod,
			@RequestParam Integer[] job1,@RequestParam Integer[] job2,@RequestParam Integer[] demandPeopleCount,@RequestParam String[] demandSummary,
			HttpSession session,RedirectAttributes red,Model model){
		String info="";
		//众筹信息添加
		Crowdfund addCf = new Crowdfund();
		//项目名称
		addCf.setCrowdfundProjectName(crowdfundProjectName);
		//项目金额
		addCf.setCrowdfundProjectMoney(crowdfundProjectMoney.trim());
		//项目周期
		addCf.setCrowdfundProjectCycle(crowdfundProjectCycle);
		//开始时间
		addCf.setCrowdfundProjectStartDate(new Timestamp(System.currentTimeMillis()));
		//结束时间
		addCf.setCrowdfundProjectEndDate(Timestamp.valueOf(crowdfundProjectEndDate));
		//项目简介
		addCf.setCrowdfundProjectSummary(crowdfundProjectSummary);
		//众筹方法
		addCf.setCrowdfundProjectMethod(crowdfundProjectMethod);
		//获取发布者ID
		Integer publisherId=null;
		User user=null;
		Company company=null;
		
		try{
			user = (User)session.getAttribute("user");
			publisherId = user.getId();
		}catch (Exception e) {
			e.printStackTrace();
			user=null;
		}
		if(user==null){
			try{
				company = (Company)session.getAttribute("user");
				publisherId = company.getId();
			}catch (Exception e) {
				e.printStackTrace();
				company =null;
			}
		}
		if(publisherId==null){
			info="noUser";
			model.addAttribute("info", info);
			return "crowdfund/addCrowdfund";
		}
		addCf.setPublisher(publisherId);
		int result = cfService.addCrowdfund(addCf);
		
		//岗位添加
		if(result>0){
			//添加岗位前，先获取所发布众筹项目的ID
			int cfId = cfService.findPublisherId(addCf);
			for(int i=0;i<job1.length;i++){
				CrowdfundDemand cfd=new CrowdfundDemand();
				cfd.setCrowdfundId(cfId);
				Integer jobId;
				if(job2[i]!=-1){
					jobId=job2[i];
				}else{
					jobId=job1[i];
				}
				cfd.setDemandJobId(jobId);
				cfd.setDemandPeopleCount(demandPeopleCount[i]);
				cfd.setDemandSummary(demandSummary[i]);
				int demandStatus = cfDemandService.addCrowdfundDemand(cfd);
				if(demandStatus<0){
					//删除已添加岗位
					cfDemandService.deleteCrowdfundDemand(cfd);
					//删除众筹项目
					cfService.deleteCrowdfund(cfId);
					//跳转发布界面提示
					info ="noJob";
					model.addAttribute("info", info);
					return "crowdfund/addcrowdfund";
				}
			}
		}else{
			info="nocf";
			model.addAttribute("info", info);
			return "crowdfund/addcrowdfund";
		}
		info="yesJob";
		red.addFlashAttribute("info", info);
		return "redirect:toAddcrowdfund";
	}
	
	//ajax异步调用二级标题
	@RequestMapping("job1")
	@ResponseBody
	public Object job1(@RequestParam String jobParentId){
		List<Job> listjob2=null;
		if(jobParentId!=null||"".equals(jobParentId)){
			listjob2 = jobService.findJob2(Integer.parseInt(jobParentId.trim()));
		}
		if(listjob2.size()<=0||"".equals(listjob2)){
			return JSON.toJSONString(0);
		}
			return JSON.toJSONString(listjob2);
		
		}
	//我参与的众筹()
	
	//我发布的众筹(查看，管理修改)
	@RequestMapping("mySendCrowdfund")
	public String mySendCrowdfund(Model model,HttpSession session){
		//根据个人ID查询发布信息
		Integer publisherId=null;
		User user=null;
		Company company=null;
		List<Crowdfund> listCf = null;
		try{
			user = (User)session.getAttribute("user");
			publisherId = user.getId();
		}catch (Exception e) {
			e.printStackTrace();
			user=null;
		}
		if(user==null){
			try{
				company = (Company)session.getAttribute("user");
				publisherId = company.getId();
			}catch (Exception e) {
				e.printStackTrace();
				company =null;
			}
		}
		if(publisherId!=null){
			listCf = cfService.findMyCrowdfundOnly(publisherId);
		}
		model.addAttribute("mylist", listCf);
		return "crowdfund/mySendCrowdfund";
	}
	//修改众筹信息
	@RequestMapping("/updateCrowdfund")
	public String updateCrowdfund(@RequestParam Integer id,Model model){
		//根据项目ID查项目详细信息
		Crowdfund  cf= cfService.findCrowdfundOnly(id);
		List<CrowdfundDemand> listCfd = cfDemandService.listCrowdfundDemand(id);
		//根据项目ID遍历岗位
		model.addAttribute("cf", cf);
		model.addAttribute("listCfd", listCfd);
		List<Job> listJob = jobService.findJob1();
		model.addAttribute("listJob1", listJob);
		return "crowdfund/updateCrowdfund";
	}
	//确定修改
	@RequestMapping(value="/updateCrowdfundOK",method=RequestMethod.POST)
	public String updateCrowdfundOK(@RequestParam Integer cfId,@RequestParam String crowdfundProjectName,@RequestParam String crowdfundProjectMoney,@RequestParam String crowdfundProjectCycle,
			@RequestParam String crowdfundProjectEndDate,@RequestParam String crowdfundProjectSummary,@RequestParam String crowdfundProjectMethod,
			@RequestParam Integer[] job1,@RequestParam Integer[] job2,@RequestParam String[] demandPeopleCount,@RequestParam String[] demandSummary,@RequestParam Integer[] jobIds,
			HttpSession session,RedirectAttributes red,Model model){
		String info="";
		//众筹信息添加
		Crowdfund addCf = new Crowdfund();
		addCf.setId(cfId);
		//项目名称
		addCf.setCrowdfundProjectName(crowdfundProjectName);
		//项目金额
		addCf.setCrowdfundProjectMoney(crowdfundProjectMoney.trim());
		//项目周期
		addCf.setCrowdfundProjectCycle(crowdfundProjectCycle);
		//开始时间
		//addCf.setCrowdfundProjectStartDate(new Timestamp(new Date().getTime()));
		//结束时间
		addCf.setCrowdfundProjectEndDate(Timestamp.valueOf(crowdfundProjectEndDate));
		//项目简介
		addCf.setCrowdfundProjectSummary(crowdfundProjectSummary);
		//众筹方法
		addCf.setCrowdfundProjectMethod(crowdfundProjectMethod);
		//获取发布者ID
		
		int result = cfService.updateCrowdfund(addCf);
		
		//岗位更改
		if(result>0){
			/**当有岗位新增加时，你是没办法获取到该修改岗位ID的。
			*这时你就要判断有几个岗位需要修改，有几个岗位是新增的，有没有多余删除的岗位，阿西吧！
			*思路，先判断不存在删除和添加的情况，这无疑是最好的。**/
			
			if(job1.length>=jobIds.length){
				for(int i=0;i<jobIds.length;i++){
					CrowdfundDemand cfd=new CrowdfundDemand();
					int demandStatus=-1;//岗位修改状态
					cfd.setId(jobIds[i]);
					Integer jobId;
					if(job2[i]!=null&&job2[i]>0){
						jobId=job2[i];
					}else{
						jobId=job1[i];
					}
					cfd.setDemandJobId(jobId);
					cfd.setDemandPeopleCount(Integer.parseInt(demandPeopleCount[i]));
					cfd.setDemandSummary(demandSummary[i]);
					demandStatus = cfDemandService.updateCrowdfundDemand(cfd);
					
					if(demandStatus<0){
						//删除已添加岗位
						cfDemandService.deleteCrowdfundDemand(cfd);
						//删除众筹项目
						cfService.deleteCrowdfund(cfId);
						//跳转发布界面提示
						info ="noJob";
						model.addAttribute("info", info);
						return "crowdfund/updateCrowdfund";
					}else{
						info="yesJob";
						
					}
				}
				if(job1.length>jobIds.length){
					for(int j=jobIds.length;j<job1.length;j++){
						CrowdfundDemand cfd=new CrowdfundDemand();
						cfd.setCrowdfundId(cfId);
						Integer jobId;
						if(job2[j]!=null&&job2[j]>0){
							jobId=job2[j];
						}else{
							jobId=job1[j];
						}
						cfd.setDemandJobId(jobId);
						cfd.setDemandPeopleCount(Integer.parseInt(demandPeopleCount[j]));
						cfd.setDemandSummary(demandSummary[j]);
						cfDemandService.addCrowdfundDemand(cfd);
					}
				}
				
			}
			
		}else{
			info="nocf";
			model.addAttribute("info", info);
			return "";
		}
		red.addFlashAttribute("info", info);
		return "redirect:mySendCrowdfund";
		
	}
	//删除岗位
	@RequestMapping("deleteJob")
	@ResponseBody
	public Object deleteJob(@RequestParam String jobId){
		CrowdfundDemand cfd = new CrowdfundDemand();
		cfd.setId(Integer.parseInt(jobId));
		cfDemandService.deleteCrowdfundDemand(cfd);
		return JSON.toJSONString("ok");
	}
	
	//删除撤回众筹信息(不做真删除)
	@RequestMapping("deleteCrowdfund")
	public String deleteCf(@RequestParam Integer id,RedirectAttributes red){
		//删除众筹信息前先判断有没有岗位需求
		String info ="N";
		Boolean flag = false;
		//CrowdfundDemand cfd = new CrowdfundDemand();
		//查询岗位存不存在
		//List<CrowdfundDemand> cfdlist = cfDemandService.listCrowdfundDemand(id);
		//有则先删除岗位表信息，再删众筹信息
		//if(cfdlist!=null&&cfdlist.size()>0){
			//cfd.setCrowdfundId(id);
			//int s = cfDemandService.deleteCrowdfundDemand(cfd);
			//if(s>0){
				int cf = cfService.deleteCrowdfund(id);
				if(cf>0){
					flag=true;
				}
		//	}
		//}else{
		//	int cf = cfService.deleteCrowdfund(id);
		//	if(cf>0){
		//		flag=true;
		//	}
		//}
		if(flag){
			info="Y";
		}
		red.addFlashAttribute("info", info);
		return "redirect:/crowdfund/mySendCrowdfund";
	}
	//众筹审核(管理员)
	@RequestMapping("toCheckCrowdfund")
	public String checkCrowdfund(Model model){
		//获取待审核众筹项目信息
		List<Crowdfund> checkList = cfService.checkCrowdfund();
		model.addAttribute("checkList", checkList);
		return "crowdfund/checkCrowdfund";
	}
	//审核操作（管理员）
	@RequestMapping("checkCrowdfund")
	public String updateCrowdfund(@RequestParam Integer order,@RequestParam Integer id,RedirectAttributes red){
		Crowdfund cf = new Crowdfund();
		String info="N";
		cf.setCrowdfundProjectCheckState(order);
		cf.setId(id);
		int result = cfService.updateCrowdfund(cf);
		if(result>0){
			info="Y";
		}
		red.addFlashAttribute("info", info);
		return "redirect:/crowdfund/toCheckCrowdfund";
	}
	//我参与的众筹
	@RequestMapping("myJoinCrowdfund")
	public String myJoinCrowdfund(Model model,HttpSession session){
		//获取我的Id
		Integer userId=null;
		User user=null;
		Company company=null;
		List<CrowdfundUser> cfUserList = null;
		try{
			user = (User)session.getAttribute("user");
			userId = user.getId();
		}catch (Exception e) {
			e.printStackTrace();
			user=null;
		}
		if(user==null){
			try{
				company = (Company)session.getAttribute("user");
				userId = company.getId();
			}catch (Exception e) {
				e.printStackTrace();
				company =null;
			}
		}
		if(userId!=null){
			cfUserList = cfUserService.listcfUser(userId);
			
		}
		model.addAttribute("cfUserList", cfUserList);
		return "crowdfund/myJoinCrowdfund";
	}
	
}
