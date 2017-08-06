package ynjh.common.dao;

import java.sql.Timestamp;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import ynjh.common.entity.UserRecord;
/**
 * 为完成消费记录，特对用户对状态的修改进行记录
 * @author 牟勇
 *
 */
public interface UserRecordMapper {
	/**
	 * 添加用户扣费历史记录<br />
	 * userId必须是企业和个人用户的id号<br />
	 * 目前是查询所有的历史消费记录，未做时间限制<br />
	 * @param uRecord 包含用户扣费记录的实体类
	 * @return 大于0表示成功，否则表示失败
	 */
	public Integer addUserRecord(UserRecord uRecord);
	/**
	 * 根据用户id和操作，查找用户开始计费（扣费金额为0）的最大时间<br />
	 * 操作包括：管理员充值，开始应聘，开始招聘，结束应聘，结束招聘，开始发布众筹，结束发布众筹，开始发布合伙，结束发布合伙，开始参与众筹，结束参与众筹，开始参与合伙，结束参与众筹<br />
	 * <strong>扣费操作开始的扣费金额均为0</strong>
	 * @param userId 用户id
	 * @param UserrOperator 操作
	 * @return 符合条件的时间
	 */
	public Timestamp findUserrTimeByUserIdAndUserrOperator(@Param("userId")Integer userId,@Param("userrOperator")String userrOperator);
	/**
	 * 根据用户id查询用户所做的各种操作历史记录<br />
	 * 用户id可以是管理员的，也可以是个人用户或企业用户的主键<br />
	 * @param id 用户id可以是管理员的，也可以是个人用户或企业用户的主键
	 * @return
	 */
	public List<UserRecord> findUserRecordById(Integer id);
}
