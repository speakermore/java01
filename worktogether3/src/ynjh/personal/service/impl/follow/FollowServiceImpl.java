package ynjh.personal.service.impl.follow;

import java.util.List;
/**
 * @author 胡林飞
 *操作关注
 */

import javax.annotation.Resource;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;

import ynjh.personal.dao.follow.FollowMapper;
import ynjh.personal.entity.Follow;
import ynjh.personal.service.FollowService;
@Service
public class FollowServiceImpl implements FollowService {
	@Resource
	private FollowMapper followMapper;
	/**
	 * 添加关注
	 * @return Integer 成功1 失败2
	 * @param follow 关注对象
	 */
	@Override
	public Integer addUserFollow(Follow follow) {
		return followMapper.addUserFollow(follow);
	}
	/**
	 * 取消关注
	 * @return Integer 成功1 失败2
	 * @param id 关注ID
	 */
	@Override
	public Integer deleteUserFollow(Integer id) {
		return followMapper.deleteUserFollow(id);
	}
	/**
	 * 查看关注
	 * @return List<Follow> 关注 列表
	 * @param id 关注者ID
	 */
	@Override
	public List<Follow> selectUserFollow(Integer id) {
		return followMapper.selectUserFollow(id);
	}
	/**
	 * 查看关注者人数
	 */
	@Override
	public Integer selectUserFollowCount(Integer followId) {
		return followMapper.selectUserFollowCount(followId);
	}
	/**
	 * 查看被关注者人数
	 */
	@Override
	public Integer selectUserByFollowCount(Integer byFollowId) {
		return followMapper.selectUserByFollowCount(byFollowId);
	}
	/**
	 *  判断是否关注 
	 */
	@Override
	public Follow findIsFollowByFollowIdAndFollowId(Integer followId, Integer byFollowId) {
		return followMapper.findIsFollowByFollowIdAndFollowId(followId, byFollowId);
	}

	

	

}
