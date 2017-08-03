package ynjh.personal.service;

import java.util.List;

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
	 * 牟勇：取消关注
	 * @param byFollowId 被关注者id
	 * @param followId 关注者id
	 * @return 大于0表示成功，否则表示失败
	 */
	public Integer cancelFollow(Integer byFollowId,Integer followId);

	/**
	 * 查看我关注的用户
	 * @param id 关注者的用户主键
	 * @return 符合条件的Follow实体集合
	 */
	public List<Follow> findUserFollow(Integer followId);
	/**
	 * 查看我关注的企业
	 * @author 刘志浩
	 */
	public List<Follow> findCompanyFollow(Integer followId);

	/**
	 *  查看关注者人数
	 * @param followId
	 * @return
	 * @author 刘志浩
	 * Integer
	 */
	public Integer countFollow(Integer followId);

	/**
	 *  查看被关注者人数
	 * @param byFollowId
	 * @return
	 * @author 刘志浩
	 * Integer
	 */
	public Integer countByFollow(Integer byFollowId);
	
	/**
	 * 刘志浩：判断是否关注
	 * @param followId 关注者id
	 * @param byFollowId 被关注者id
	 * @return 如果为null表示没有关注，否则为已关注
	 */
	public Follow findIsFollowByFollowIdAndFollowId(Integer followId,Integer byFollowId);
}
