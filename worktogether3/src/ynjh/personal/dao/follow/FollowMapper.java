package ynjh.personal.dao.follow;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import ynjh.personal.entity.Follow;
/**
 * 
 * 关注mapper
 *
 */
public interface FollowMapper {
	/**
	 * 添加关注
	 * @author 胡林飞
	 */
	public Integer addUserFollow(Follow follow);

	/**
	 * 删除关注
	 * @author 胡林飞
	 */
	public Integer deleteUserFollow(Integer id);
	
	/**
	 * 查看关注(用户)
	 * @author 刘志浩
	 */
	public List<Follow> selectUserFollow(Integer followId);
	/**
	 * 查看关注(企业)
	 * @author 刘志浩
	 */
	public List<Follow> selectCompanyFollow(Integer followId);
	/**
	 * 
	 * @param followId
	 * @return
	 * @author  刘志浩
	 * Integer
	 */
	/**
	 * 查看我关注的人有多少
	 * @param followId 关注者
	 * @return 我关注的人数统计
	 * @author  刘志浩
	 */
	public Integer selectUserFollowCount(Integer followId);
	/**
	 * 查看被关注者人数
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
	public Follow findIsFollowByFollowIdAndFollowId(@Param("followId")Integer followId,@Param("byFollowId")Integer byFollowId);
}
