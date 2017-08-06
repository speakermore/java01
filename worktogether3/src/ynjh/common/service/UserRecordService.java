package ynjh.common.service;

import java.util.List;
import java.util.Map;

import ynjh.common.entity.UserRecord;

/**
 * 用户扣费业务接口
 * @author 牟勇
 *
 */
public interface UserRecordService {
	/**
	 * 扣费业务方法<br />
	 * 如果是开始应聘，开始发布众筹，开始发布合伙（value的值为1）则要判断余额是否大于0<br />
	 * 如果是结束状态（value值为0），则进行余额扣减计算<br />
	 * 应该另写方法进行扣减试算，如果一旦余额为负，则进行实际扣费，并停止所有开始的扣费业务<br />
	 * 本方法同时也完成了用户的余额数据库更新，用户的三个状态值（userIsRecruit/userIsCrowdfund/userIsPartner）的更新(0:结束/1：开始)
	 * 并在数据库中保存了用户的操作提示信息
	 * <h5>返回值Map属性解释</h5>
	 * <ul>
	 * <li>info：页面alert框显示的提示用户的操作信息</li>
	 * <li>status:按钮上的显示文字</li>
	 * <li>emStatus:按钮前面的状态文字</li>
	 * <li>success:布尔值，扣费操作是否成功</li>
	 * <li>btnRemoveClass:按钮要移除的样式名称</li>
	 * <li>btnAddClass:按钮要添加的样式名称</li>
	 * </ul>
	 * @param column 要修改的字段名，userIsRecruit(是否应聘)/userIsCrowdfund（是否发布众筹）/userIsPartner（是否发布创业合伙）中的一个
	 * @param value 要修改成为的值，0表示结束，1表示开始
	 * @param userRecord 要记录下来的相关信息,作为参数，传递了用户的主键id
	 * @param user 已登录的用户对象，目的是为了在用户刷新页面时又把状态刷新回去，所以手工修改了登录用户的状态值
	 * @return 需要送到页面上显示的信息，页面上需要更改的特效
	 */
	public Map<String, String> charging(String column,Integer value,UserRecord userRecord,Object user);
	/**
	 * 根据用户的id，查询用户的历史消费记录，目前是查询所有的历史消费记录，未做时间限制
	 * @param userId 用户id，可以是个人用户或企业用户
	 * @return 指定用户的历史消费记录，UserRecord实体集合
	 */
	public List<UserRecord> findUserRecordById(Integer userId);
}
