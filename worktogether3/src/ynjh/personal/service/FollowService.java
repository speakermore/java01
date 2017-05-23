package ynjh.personal.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import ynjh.personal.entity.Follow;

/**
 * 关注service
 * 
 */
public interface FollowService {
	/**
	 *  添加关注
	 * @param follow
	 * @return
	 * @author 胡林飞
	 * Integer
	 */
	public Integer addUserFollow(Follow follow);

	/**
	 *  删除关注
	 * @param id
	 * @return
	 * @author 胡林飞
	 * Integer
	 */
	public Integer deleteUserFollow(Integer id);

	/**
	 *  查看关注
	 * @param id
	 * @return
	 * @author 刘志浩
	 * List<Follow>
	 */
	public List<Follow> selectUserFollow(Integer id);
	/**
	 * 查看关注(企业)
	 * @author 刘志浩
	 */
	public List<Follow> selectCompanyFollow(Integer followId);

	/**
	 *  查看关注者人数
	 * @param followId
	 * @return
	 * @author 刘志浩
	 * Integer
	 */
	public Integer selectUserFollowCount(Integer followId);

	/**
	 *  查看被关注者人数
	 * @param byFollowId
	 * @return
	 * @author 刘志浩
	 * Integer
	 */
	public Integer selectUserByFollowCount(Integer byFollowId);
	/**
	 *  判断是否关注 
	 *  @author 刘志浩
	 */
	public Follow findIsFollowByFollowIdAndFollowId(Integer followId,Integer byFollowId);
}
