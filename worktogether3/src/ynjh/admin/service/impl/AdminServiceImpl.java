package ynjh.admin.service.impl;

import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import ynjh.admin.dao.admin.AdminMapper;
import ynjh.admin.dao.adminlog.AdminLogMapper;
import ynjh.admin.entity.Admin;
import ynjh.admin.entity.AdminLog;
import ynjh.admin.service.AdminService;
import ynjh.company.entity.Company;
import ynjh.company.entity.CompanyRecruit;
import ynjh.personal.entity.Article;
import ynjh.personal.entity.CommentArticle;
import ynjh.personal.entity.Discuss;
import ynjh.personal.entity.Message;
import ynjh.personal.entity.Resume;
import ynjh.personal.entity.User;

@Service
public class AdminServiceImpl implements AdminService {
	@Resource
	private AdminMapper adminMapper;
	@Resource
	private AdminLogMapper adminLogMapper;

	@Override
	public Integer auditResume(Integer id, Integer status) {
		// TODO Auto-generated method stub
		return adminMapper.auditResume(id, status);
	}

	@Override
	public List<Resume> findAuditResume(Integer page) {
		// TODO Auto-generated method stub
		return adminMapper.findAuditResume(page);
	}

	@Override
	public Integer auditArticle(Integer articleId, Integer articleStatus) {
		// TODO Auto-generated method stub
		return adminMapper.auditArticle(articleId, articleStatus);
	}

	@Override
	public List<Article> findAuditArticle(Integer page) {
		// TODO Auto-generated method stub
		return adminMapper.findAuditArticle(page);
	}

	@Override
	public Integer auditCommentsArticle(Integer id, Integer commentsArticleStatus) {
		// TODO Auto-generated method stub
		return adminMapper.auditCommentsArticle(id, commentsArticleStatus);
	}

	@Override
	public List<CommentArticle> findAuditCommentsArticle(Integer page) {
		// TODO Auto-generated method stub
		return adminMapper.findAuditCommentsArticle(page);
	}

	@Override
	public Integer auditCompany(Integer companyId, Integer cmpIntegerStatus) {
		// TODO Auto-generated method stub
		return adminMapper.auditCompany(companyId, cmpIntegerStatus);
	}

	@Override
	public List<Company> findAuditCompany(Integer page) {
		// TODO Auto-generated method stub
		return adminMapper.findAuditCompany(page);
	}

	@Override
	public Integer auditCommentsCompanyAndPeople(Integer id, Integer discussStatus) {
		// TODO Auto-generated method stub
		return adminMapper.auditCommentsCompanyAndPeople(id, discussStatus);
	}

	@Override
	public List<Discuss> findAuditCommentsCompanyAndPeople(Integer page) {
		// TODO Auto-generated method stub
		return adminMapper.findAuditCommentsCompanyAndPeople(page);
	}

	@Override
	public Integer auditInfo(Integer InfoId, Integer cmpInfStatus) {
		// TODO Auto-generated method stub
		return adminMapper.auditInfo(InfoId, cmpInfStatus);
	}

	@Override
	public List<Article> findAuditInfo(Integer page) {
		// TODO Auto-generated method stub
		return adminMapper.findAuditInfo(page);
	}

	@Override
	public Integer auditOffer(Integer offerId, Integer offerStatus) {
		// TODO Auto-generated method stub
		return adminMapper.auditOffer(offerId, offerStatus);
	}

	@Override
	public List<Message> findAuditOffer(Integer page) {
		// TODO Auto-generated method stub
		return adminMapper.findAuditOffer(page);
	}

	@Override
	public Integer auditRecruitment(Integer recruitmentId, Integer cmpRecStatus) {
		// TODO Auto-generated method stub
		return adminMapper.auditRecruitment(recruitmentId, cmpRecStatus);
	}

	@Override
	public List<CompanyRecruit> findAuditRecruitment(Integer page) {
		// TODO Auto-generated method stub
		return adminMapper.findAuditRecruitment(page);
	}

	@Override
	public List<AdminLog> findAdminLogAll(Integer page) {
		// TODO Auto-generated method stub
		return adminLogMapper.findAdminLogAll(page);
	}

	@Override
	public List<AdminLog> findAdminLogByTime(String beginTime, String endTime,Integer page) {
		SimpleDateFormat sdf =new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date beginDate=null;
		try {
			beginDate = sdf.parse(beginTime);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		Date endDate=null;
		try {
			endDate = sdf.parse(endTime);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		// TODO Auto-generated method stub
		return adminLogMapper.findAdminLogByTime(beginDate, endDate,page);
	}

	@Override
	public List<AdminLog> findAdminLogByTimeAndId(Integer userLoginId, String beginTime, String endTime,Integer page) {
		
		SimpleDateFormat sdf =new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date beginDate=null;
		try {
			beginDate = sdf.parse(beginTime);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		Date endDate=null;
		try {
			endDate = sdf.parse(endTime);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		// TODO Auto-generated method stub
		return adminLogMapper.findAdminLogByTimeAndId(userLoginId, beginDate, endDate,page);
	}

	@Override
	public List<AdminLog> findAdminLogByIdAndDo(Integer userLoginId, Integer adminDo,Integer page) {
		// TODO Auto-generated method stub
		return adminLogMapper.findAdminLogByIdAndDo(userLoginId, adminDo,page);
	}

	@Override
	public List<AdminLog> findAdminLogByTimeAndDo(String beginTime, String endTime, Integer adminDo,Integer page) {
		// TODO Auto-generated method stub
		
		SimpleDateFormat sdf =new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date beginDate=null;
		try {
			beginDate = sdf.parse(beginTime);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		Date endDate=null;
		try {
			endDate = sdf.parse(endTime);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return adminLogMapper.findAdminLogByTimeAndDo(beginDate, endDate, adminDo,page);
	}

	@Override
	public List<AdminLog> findAdminLogByTimeAndDoAndId(Integer adminDo, Integer userLoginId, String beginTime,
			String endTime,Integer page) {
		// TODO Auto-generated method stub
		
		SimpleDateFormat sdf =new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date beginDate=null;
		try {
			beginDate = sdf.parse(beginTime);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		Date endDate=null;
		try {
			endDate = sdf.parse(endTime);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return adminLogMapper.findAdminLogByTimeAndDoAndId(adminDo, userLoginId, beginDate, endDate,page);
	}

	@Override
	public List<Company> findBestCompany() {
		// TODO Auto-generated method stub
		List<Integer> list=adminMapper.findCompanyId();
		List<Company> listCompany=null;
		for(int i=0;i<list.size();i++){
			Company company=adminMapper.findCompanyById(list.get(i));
			listCompany.add(company);
		}
		return listCompany;
	}

	@Override
	public List<Article> findBestArticle() {
		// TODO Auto-generated method stub
		return adminMapper.findBestArticle();
	}

	@Override
	public List<User> findUser(Integer page) {
		// TODO Auto-generated method stub
		return adminMapper.findUser(page);
	}

	@Override
	public List<Company> findCompany(Integer page) {
		// TODO Auto-generated method stub
		return adminMapper.findCompany(page);
	}

	@Override
	public Integer disableUser(Integer userId, Integer userStatus) {
		// TODO Auto-generated method stub
		return adminMapper.disableUser(userId, userStatus);
	}

	@Override
	public Integer disableCompany(Integer companyId, Integer companyStatus) {
		// TODO Auto-generated method stub
		return adminMapper.disableCompany(companyId, companyStatus);
	}

	@Override
	public Integer maIntegerainAdmin(Admin admin) {
		// TODO Auto-generated method stub
		return adminMapper.maIntegerainAdmin(admin);
	}

	@Override
	public List<Admin> findByAdminId(Integer id) {
		// TODO Auto-generated method stub
		return adminMapper.findByAdminId(id);
	}

	@Override
	public int findMaxPage() {
		// TODO Auto-generated method stub
		return adminMapper.findMaxPage();
	}

	@Override
	public Integer trafficStatisticalPersonal(Integer year, Integer month, Integer day, String userId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Integer trafficStatisticalCompany(Integer year, Integer month, Integer day, String companyId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Integer messagePushArticle(Integer userId, String articleContent, Timestamp messageSendTime,
			Integer messageStatus) {
		// TODO Auto-generated method stub
		return adminMapper.messagePushArticle(userId, articleContent, messageSendTime, messageStatus);
	}

	@Override
	public Admin findLogin(String adminLoginId, String adminPassword) {
		// TODO Auto-generated method stub
		return adminMapper.findLogin(adminLoginId, adminPassword);
	}

	
	


}
