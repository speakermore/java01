package ynjh.company.service.impl.company;

import java.sql.Timestamp;
import java.util.List;

import javax.annotation.Resource;
import org.springframework.stereotype.Service;

import ynjh.common.dao.UserRecordMapper;
import ynjh.common.entity.UserRecord;
import ynjh.common.util.CommonStatus;
import ynjh.company.dao.company.CompanyMapper;
import ynjh.company.entity.Company;
import ynjh.company.entity.CompanyConnection;
import ynjh.company.entity.CompanyDetailImg;
import ynjh.company.service.CompanyService;

@Service
public class CompanyServiceImpl implements CompanyService{
	@Resource
	private CompanyMapper companyMapper;
	@Resource
	private UserRecordMapper userRecordMapper;
	
	@Override
	public Integer addCompany(Company company) {
		return companyMapper.addCompany(company);
	}

	@Override
	public Integer updateCompany(Company company) {
		return companyMapper.updateCompanyById(company);
	}

	@Override
	public Company login(String companyLoginId, String companyPassword) {
		return companyMapper.findByloginIdAndPassword(companyLoginId, companyPassword);
	}

	@Override
	public Company findCompanyById(Integer id) {
		return companyMapper.findById(id);
	}

	@Override
	public Integer addCompanyDetailImg(Integer companyId, String companyDetailImg,Integer index,Integer id) {
		//查询环境图片存在不存在，如果返回0，则表示不存在。
		int result=companyMapper.findByEnvirmentImgId(id);
		if(result>0){
			companyMapper.updateImg(id, companyDetailImg);
		}else{
			companyMapper.addCompanyDetailImg(companyId, companyDetailImg,CompanyService.COMPANY_POSITION[index]);
		}
		return 1;
	}

	@Override
	public List<CompanyDetailImg> findDetailImg(Integer companyId) {
		return companyMapper.findDetailImg(companyId);
	}

	@Override
	public Integer updatePassword(Integer id, String newPassword) {
		
		return companyMapper.updatePassword(id, newPassword);
	}

	@Override
	public Integer updateImg(Integer id, String companyDetailImg) {
		return companyMapper.updateImg(id, companyDetailImg);
	}

	
	@Override
	public List<CompanyConnection> findCompanyConnection(Integer companyId) {
		return companyMapper.findCompanyConnection(companyId);
	}

	@Override
	public Integer addCompanyConnection(Integer id, String cmpConnectionName, String cmpConnection) {
		return companyMapper.addCompanyConnection(id, cmpConnectionName, cmpConnection);
	}

	@Override
	public Integer deleteCompanyConnection(Integer id) {
		return companyMapper.deleteCompanyConnection(id);
	}

	@Override
	public Integer updateCompanyConnection(Integer id, Integer companyId, String cmpConnectionName,
			String cmpConnection) {
		return companyMapper.updateCompanyConnection(id, companyId, cmpConnectionName, cmpConnection);
	}

	@Override
	public Company verificationCompanyLoginId(String companyLoginId) {
		return companyMapper.verificationCompanyLoginId(companyLoginId);
	}

	@Override
	public List<Company> findAllCompany() {
		return companyMapper.findCompanyForCharge();
	}

	@Override
	public Integer findCompanyMoneyById(Integer companyId) {
		return companyMapper.findCompanyMoneyById(companyId);
	}

	@Override
	public Integer updateAdminCharging(Integer money, Integer companyId,Integer adminId) {
		//牟勇：查出余额
		Integer balance=companyMapper.findCompanyMoneyById(companyId);
		//牟勇：进行累加计算
		Integer result=companyMapper.updateCompanyProperty("companyMoney", ""+(balance+money), companyId);
		if(result>0){
			//牟勇：用户操作信息记录
			UserRecord userRecord=new UserRecord(companyId, "管理员充值",null, new Timestamp(System.currentTimeMillis()), CommonStatus.USER_OP_TYPE.get("管理员充值"),money,"");
			userRecord.setUserrMem("管理员"+adminId+"于"+userRecord.getTextedUserrTime()+"对企业用户"+companyId+"进行充值"+money+"额度，"+"充值后余额为"+(balance+money)+"额度");
			userRecordMapper.addUserRecord(userRecord);
		}
		return result;
	}
}
