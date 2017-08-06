package ynjh.common.service.impl;

import java.lang.reflect.InvocationTargetException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.beanutils.BeanUtils;
import org.springframework.stereotype.Service;

import ynjh.common.dao.UserRecordMapper;
import ynjh.common.entity.UserRecord;
import ynjh.common.service.UserRecordService;
import ynjh.common.util.CommonStatus;
import ynjh.common.util.LiuZhiHaoDateTimeUtil;
import ynjh.company.dao.company.CompanyMapper;
import ynjh.personal.dao.user.UserMapper;

@Service
public class UserRecordServiceImpl implements UserRecordService {
	
	@Resource
	private UserRecordMapper userRecordMapper;
	@Resource
	private UserMapper userMapper;
	@Resource
	private CompanyMapper companyMapper;
	
	
	@Override
	public Map<String, String> charging(String column, Integer value, UserRecord userRecord,Object user) {
		//组装一个到页面上去显示的json
		Map<String, String> status=new HashMap<String,String>();
		//获得余额
		Integer balance=0;
		//根据用户的id分辨个人还是企业
		//id>=1234567890的为个人用户，小于的为企业用户
		//根据id的不同，进行不同的查询
		if(userRecord.getUserId()>=1234567890){
			balance=userMapper.findUserMoneyById(userRecord.getUserId());
		}else{
			balance=companyMapper.findCompanyMoneyById(userRecord.getUserId());
		}
		//将要扣除的费用,case 2//结束中赋值
		long balanceResult=0;
		switch(value){
		//开始时首先要检查余额够不够，如果余额不够，则不能开始。
		case 1://开始
			if(balance<CommonStatus.EXPENSES_CALC_BASE_MONEY.get(column)){
				status.put("info", "余额不足，超过"+CommonStatus.EXPENSES_CALC_BASE_MONEY.get(column)+"才能"+CommonStatus.USER_START_STATUS_DISCRIPTION.get(column)+"，\n先进行充值或参与活动，获得余额吧");
				status.put("success", "false");
			}else{
				userRecord.setUserrMem("用户"+userRecord.getUserId()+"于"+new SimpleDateFormat("yyyy-MM-dd HH时mm分ss").format(System.currentTimeMillis())+CommonStatus.USER_START_STATUS_DISCRIPTION.get(column));
				userRecord.setUserrOperator(CommonStatus.USER_START_STATUS_DISCRIPTION.get(column));
				userRecord.setUserrMoney(0);//开始把余额设置为0
				userRecord.setUserrOpType(CommonStatus.USER_OP_TYPE.get(column));
				//设置开始时间
				userRecord.setUserrTime(new Timestamp(System.currentTimeMillis()));
			}
			break;
		case 0://结束
			//结束时进行扣费，扣除user表中的余额。
			Timestamp startTime=userRecordMapper.findUserrTimeByUserIdAndUserrOperator(userRecord.getUserId(), CommonStatus.USER_START_STATUS_DISCRIPTION.get(column));
			Timestamp endTime=new Timestamp(System.currentTimeMillis());
			//- 我要应聘计算公式：(开始时间-结束时间)*1余额/天，默认扣除一天
			//- 我要招聘计算公式：(开始时间-结束时间)*10余额/天，默认扣除一天
			//- 我要众筹计算公式：(开始时间-结束时间)*10余额/天，默认扣除一天
		    //- 我要创业计算公式：(开始时间-结束时间)*10余额/天，默认扣除一天
			balanceResult=(LiuZhiHaoDateTimeUtil.getDays(startTime, endTime)+1)*CommonStatus.EXPENSES_CALC_BASE_MONEY.get(column);
		    if(balance-balanceResult<0){
		    		balance=0;
		    }else{
		    		balance=balance-(int)balanceResult;
		    }
		    //设置用户记录信息
		    userRecord.setUserrMem("用户"+userRecord.getUserId()+"于"+new SimpleDateFormat("yyyy-MM-dd HH时mm分ss秒").format(System.currentTimeMillis())+CommonStatus.USER_END_STATUS_DISCRIPTION.get(column));
			userRecord.setUserrOperator(CommonStatus.USER_END_STATUS_DISCRIPTION.get(column));
			userRecord.setUserrMoney((int)balanceResult);//结束设置扣除了多少余额
			userRecord.setUserrOpType(CommonStatus.USER_OP_TYPE.get(column));
			//设置结束时间
			userRecord.setUserrTime(endTime);
			break;
		}
		//如果info没有值，表示有余额，可以进行扣费操作
		if(status.get("info")==null){
			//添加记录
			userRecordMapper.addUserRecord(userRecord);
			//修改余额修改状态
			if(userRecord.getUserId()>=1234567890){
				userMapper.updateMoney((double)balance, userRecord.getUserId());
				userMapper.updateUserProperty(column, ""+value, userRecord.getUserId());
			}else{
				companyMapper.updateCompanyProperty("companyMoney", ""+balance, userRecord.getUserId());
				companyMapper.updateCompanyProperty(column, ""+value, userRecord.getUserId());
			}
			
			
			//如果代码能正常执行到这里，则表明扣费操作成功
			status.put("success", "true");
			//value为1表示扣费记录开始
			if(value==1){
				status.put("info", CommonStatus.USER_START_STATUS_DISCRIPTION.get(column)+CommonStatus.USER_START_STATUS_SAY.get(column));
				status.put("status", CommonStatus.USER_END_STATUS_DISCRIPTION.get(column).replace("发布", ""));
				status.put("emStatus", CommonStatus.USER_STATUS_DISCRIPTION.get(column)+"中");
				status.put("btnRemoveClass", "btn-success");
				status.put("btnAddClass", "btn-charging");
			}else if(value==0){//0表示扣费记录结束
				status.put("info", "结账成功！本次扣费"+balanceResult+"额度，余额"+balance+CommonStatus.USER_END_STATUS_SAY.get(column));
				status.put("status", CommonStatus.USER_START_STATUS_DISCRIPTION.get(column).replace("发布", ""));
				status.put("emStatus", "未"+CommonStatus.USER_STATUS_DISCRIPTION.get(column));
				status.put("btnRemoveClass", "btn-charging");
				status.put("btnAddClass", "btn-success");
			}
			try {
				//修改登录user对象的值，以便在刷新页面时可以看到页面上的用户状态效果
				BeanUtils.setProperty(user, column, value);
			} catch (IllegalAccessException e) {
				e.printStackTrace();
			} catch (InvocationTargetException e) {
				e.printStackTrace();
			}
		}
		
		return status;
	}
	@Override
	public List<UserRecord> findUserRecordById(Integer userId) {
		return userRecordMapper.findUserRecordById(userId);
	}
}
