package ynjh.common.dao;

import java.sql.Timestamp;

import org.apache.ibatis.annotations.Param;

import ynjh.common.entity.UserRecord;
/**
 * 为完成扣费记录，特对用户对状态的修改进行记录
 * @author 牟勇
 *
 */
public interface UserRecordMapper {
	/**
	 * 添加用户扣费记录说明
	 * @param uRecord 包含用户扣费记录的实体类
	 * @return 大于0表示成功，否则表示失败
	 */
	public Integer addUserRecord(UserRecord uRecord);
	/**
	 * 根据用户id和操作，查找用户开始（扣费金额为0）的最大时间<br />
	 * 操作包括：开始应聘，开始招聘，结束应聘，结束招聘，开始发布众筹，结束发布众筹，开始发布合伙，结束发布合伙，开始参与众筹，结束参与众筹，开始参与合伙，结束参与众筹<br />
	 * <strong>开始的扣费均为0</strong>
	 * @param userId 用户id
	 * @param UserrOperator 操作
	 * @return 符合条件的时间
	 */
	public Timestamp findUserrTimeByUserIdAndUserrOperator(@Param("userId")Integer userId,@Param("userrOperator")String userrOperator);
}
