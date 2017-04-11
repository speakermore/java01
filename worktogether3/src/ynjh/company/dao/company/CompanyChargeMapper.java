package ynjh.company.dao.company;

import java.sql.Timestamp;

import org.apache.ibatis.annotations.Param;

public interface CompanyChargeMapper {
	public Integer updateCompanyrMoney(@Param("CmpChargeMoney")Integer cmpChargeMoney,@Param("id")Integer id,Timestamp cmpChargeConsume);
	
}
