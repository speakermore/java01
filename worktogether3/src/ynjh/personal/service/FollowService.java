package ynjh.personal.service;

import java.util.List;

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
	//查看关注
	public List<Follow> selectUserFollow(Integer id);

}
