package ynjh.personal.service.impl.follow;

import java.util.List;
/**
 * @author 胡林飞
 *操作关注
 */

import javax.annotation.Resource;


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
	 * @author 胡林飞
	 */
	@Override
	public Integer addUserFollow(Follow follow) {
		return followMapper.addUserFollow(follow);
	}
	
	@Override
	public Integer cancelFollow(Integer byFollowId,Integer followId) {
		return followMapper.deleteFollow(byFollowId,followId);
	}
	/**
	 * 查看关注(用户)
	 * @return List<Follow> 关注 列表
	 * @param id 关注者ID
	 * @author 刘志浩
	 */
	@Override
	public List<Follow> findUserFollow(Integer followId) {
		return followMapper.findUserFollow(followId);
	}
	/**
	 * 查看关注者人数
	 * @author 刘志浩
	 */
	@Override
	public Integer countFollow(Integer followId) {
		return followMapper.countFollow(followId);
	}
	/**
	 * 查看被关注者人数
	 * @author 刘志浩
	 */
	@Override
	public Integer countByFollow(Integer byFollowId) {
		return followMapper.countByFollow(byFollowId);
	}
	/**
	 *  判断是否关注 
	 *  @author 刘志浩
	 */
	@Override
	public Follow findIsFollowByFollowIdAndFollowId(Integer followId, Integer byFollowId) {
		return followMapper.findIsFollowByFollowIdAndFollowId(followId, byFollowId);
	}
	/**
	 * 查看关注(企业)
	 * @author 刘志浩
	 */
	@Override
	public List<Follow> findCompanyFollow(Integer followId) {
		return followMapper.findCompanyFollow(followId);
	}
}
