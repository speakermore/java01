package ynjh.company.dao.company;

import org.apache.ibatis.annotations.Param;

public interface CompanyChargeMapper {
	public Integer updateCompanyrMoney(@Param("userMoney")Integer companyMoney,@Param("companyId")Integer companyId);

}
