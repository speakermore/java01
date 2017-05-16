package ynjh.personal.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import ynjh.personal.entity.Follow;

/**
 * @author 胡林飞
 * 
 */
public interface FollowService {
	// 添加关注
	public Integer addUserFollow(Follow follow);

	// 删除关注
	public Integer deleteUserFollow(Integer id);

	// 查看关注
	public List<Follow> selectUserFollow(Integer id);

	// 查看关注者人数
	public Integer selectUserFollowCount(Integer followId);

	// 查看被关注者人数
	public Integer selectUserByFollowCount(Integer byFollowId);
	/**
	 *  判断是否关注 
	 */
	public Follow findIsFollowByFollowIdAndFollowId(Integer followId,Integer byFollowId);
}
