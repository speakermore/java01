package ynjh.company.service.impl.companyrecruit;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import ynjh.common.crowdfund.dao.job.JobMapper;
import ynjh.common.crowdfund.entity.Job;
import ynjh.common.dao.UserRecordMapper;
import ynjh.common.entity.UserRecord;
import ynjh.common.util.CommonStatus;
import ynjh.common.util.LiuZhiHaoDateTimeUtil;
import ynjh.company.dao.company.CompanyMapper;
import ynjh.company.dao.companyrecruit.CompanyRecruitMapper;
import ynjh.company.entity.Company;
import ynjh.company.entity.CompanyRecruit;
import ynjh.company.service.CompanyRecruitService;
import ynjh.personal.dao.resume.ResumeMapper;
import ynjh.personal.entity.Resume;
import ynjh.personal.service.ResumeService;
@Service
public class CompanyRecruitServiceImpl implements CompanyRecruitService {
	private Logger logger=Logger.getLogger(this.getClass());
	@Resource
	private CompanyRecruitMapper companyRecruitMapper;
	@Resource
	private ResumeService resumeService;
	@Resource
	private ResumeMapper resumeMapper;
	@Resource
	private JobMapper jobMapper;
	@Resource
	private UserRecordMapper userRecordMapper;
	@Resource
	private CompanyMapper companyMapper;
	@Override
	public int addCompanyRecruit(CompanyRecruit companyRecruit) {
		int result=-1;
		try {
			return companyRecruitMapper.addCompanyRecruit(companyRecruit);
		} catch (Exception e) {
			e.printStackTrace();
			logger.warn("数据库添加文章失败");
		}
		return result;
	}

	@Override
	public List<Map<String, Object>> findRecruitBaseInfo(Integer page,Integer companyId) {
		if(page!=null){
			if(page<1){
				page=1;
			}
			int maxPage=findMaxPage();
			if(page>maxPage){
				page=maxPage;
			}
			page=(page-1)*20;
		}
		return companyRecruitMapper.findRecruitInfoByCompanyId(page,companyId);
	}

	@Override
	public CompanyRecruit findById(Integer id) {
		return companyRecruitMapper.findById(id);
	}
	@Override
	public Integer stopRecruit(Integer recruitId,Company user) {
		//更改招聘信息状态为
		Integer result=companyRecruitMapper.updateCmpRecStatus(5,recruitId);
		//扣费计算
		Timestamp startRecruitTime=userRecordMapper.findUserrTimeByUserIdAndUserrOperatorAndRecruitId(user.getId(), CommonStatus.USER_START_STATUS_DISCRIPTION.get("companyIsRecruit"),recruitId);
		//扣费计算公式，（今天-开始日期+1）*每日额度（目前是10）
		Integer userMoney=(int)(LiuZhiHaoDateTimeUtil.getDays(startRecruitTime, new Date())+1)*CommonStatus.EXPENSES_CALC_BASE_MONEY.get("companyIsRecruit");
		Integer balance=companyMapper.findCompanyMoneyById(user.getId());
		if(balance-userMoney<0){
			balance=0;
		}else{
			balance-=userMoney;
		}
		//更新数据库，扣费
		companyMapper.updateCompanyProperty("companyMoney", ""+balance, user.getId());
		//记录用户行为
		//查询招聘信息，以便用户行为处添加结束的是哪个岗位的招聘
		CompanyRecruit companyRecruit=companyRecruitMapper.findById(recruitId);
		UserRecord userRecord=new UserRecord(user.getId(),CommonStatus.USER_END_STATUS_DISCRIPTION.get("companyIsRecruit"),recruitId,new Timestamp(System.currentTimeMillis()),0,userMoney,"");
		userRecord.setUserrMem("用户"+user.getId()+"于"+userRecord.getTextedUserrTime()+userRecord.getUserrOperator()+companyRecruit.getCmpRecTitle()+"。扣除费用："+userMoney+",余额："+balance);
		//记录写入数据库
		userRecordMapper.addUserRecord(userRecord);
		//更新session对象的用户余额，以便界面上的余额即时更新
		user.setCompanyMoney(balance.doubleValue());
		//查询企业是否还有招聘，如果没有，则把企业的招聘状态修改为未招聘
		Integer countRecruit=companyRecruitMapper.countRecruitByCompanyId(user.getId());
		if(countRecruit==0){
			companyMapper.updateCompanyProperty("companyIsRecruit", "0", user.getId());
			user.setCompanyIsRecruit(0);
		}
		return result;
	}

	@Override
	public int findMaxPage() {
		return (companyRecruitMapper.getMaxRecordCount()+20-1)/20;
	}

	@Override
	public int updateRecruit(CompanyRecruit companyRecruit) {
	
		return companyRecruitMapper.updateRecruit(companyRecruit);
	}

	@Override
	public int updateCmpRecStatus(Integer id, Integer cmprAction) {
		return companyRecruitMapper.updateCmpRecStatus(id, cmprAction);
	}
	@Override
	public int findCount(Integer companyRecruitId){	
		return companyRecruitMapper.getResumeCount(companyRecruitId);
	}
	@Override
	public Integer findCompanyRecruitId(){
		return companyRecruitMapper.findCompanyRecruitId();
	}
	@Override
	public UserRecord startRecruit(Integer recruitId,Company user){
		 // 修改companyrecruit表的状态值为2<br />
		companyRecruitMapper.updateCmpRecStatus(2, recruitId);
		CompanyRecruit companyRecruit=companyRecruitMapper.findById(recruitId);
		 // 修改company表的companyIsRecruit状态为1<br />
		companyMapper.updateCompanyProperty("companyIsRecruit", "1", user.getId());
		//更新session中的用户对象状态为开始招聘
		user.setCompanyIsRecruit(1);
		 // 记录用户信息
		UserRecord userRecord=new UserRecord(user.getId(),CommonStatus.USER_START_STATUS_DISCRIPTION.get("companyIsRecruit"),recruitId,new Timestamp(System.currentTimeMillis()),0,0,"");
		userRecord.setUserrMem("用户"+user.getId()+"于"+userRecord.getTextedUserrTime()+userRecord.getUserrOperator()+companyRecruit.getCmpRecTitle()+"。");
		userRecordMapper.addUserRecord(userRecord);
		return userRecord;
	}
	@Override
	public List<Job> findJobs1(){
		return jobMapper.findJob1();
	}
	//
	/**
	 * 模糊查找我感兴趣的招聘信息，用于个人用户首页的显示
	 */
	@Override
	public List<CompanyRecruit> findMyIntrestRecruit(Integer userId) {
		//查找用户拥有的全部简历集合
		List<Resume> resumes=resumeMapper.findResumeByUserId(userId);
		//提取出简历的岗位名称
		List<String> resumeTitles=resumes.stream().map(r->Arrays.stream(r.getResumeTitle().split(",")).map(title->"%"+title+"%").collect(Collectors.toList())).flatMap(childList->childList.stream()).collect(Collectors.toList());
		
		List<List<CompanyRecruit>> originCompanyRecruits=new ArrayList<List<CompanyRecruit>>();
		//循环所有岗位名称，查出所有符合条件的集合
		for(String resume:resumeTitles){
			originCompanyRecruits.add(companyRecruitMapper.findByCmpRecTitle(resume));
			
		}
		//扁平化处理，把多个集合中的招聘信息实体类合并到同一个集合中
		List<CompanyRecruit> companyRecruits=originCompanyRecruits.stream().flatMap(childList->childList.stream()).distinct().collect(Collectors.toList());
		return companyRecruits;
	}

	@Override
	public List<Map<String, Object>> findMatchResumes(Integer companyId) {
		//获得企业已通过审核的招聘岗位
		List<Map<String, Object>> cmpResTitles=companyRecruitMapper.findcmpRecTitleByCompanyId(companyId);
		List<List<Map<String, Object>>> resumeInfos=new ArrayList<List<Map<String, Object>>>();
		//遍历所有的岗位，把对应简历查出来
		for(Map<String, Object> cmpResTitle:cmpResTitles){
			List<Map<String, Object>> resumes=resumeMapper.findResumeInfoByResumeTitle("%"+cmpResTitle.get("cmpRecTitle")+"%");
			if(resumes!=null&resumes.size()>0){
				resumes.stream().forEach(r->r.put("resumeTitle", cmpResTitle.get("cmpRecTitle")));
				resumeInfos.add(resumes);
			}
			
		}
		//扁平化简历
		List<Map<String, Object>> finalInfos=resumeInfos.stream().flatMap(child->child.stream()).collect(Collectors.toList());
		return finalInfos;
	}
}
