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
	 * 牟勇：根据关注者和被关注者，删除关注
	 * @param byFollowId 被关注者id
	 * @param followId 关注者id
	 * @return 大于0表示成功，否则表示失败
	 */
	public Integer deleteFollow(@Param("byFollowId")Integer byFollowId,@Param("followId")Integer followId);
	
	/**
	 * 查看关注(个人用户)
	 * @author 刘志浩
	 */
	public List<Follow> findUserFollow(Integer followId);
	/**
	 * 查看关注(企业)
	 * @author 刘志浩
	 */
	public List<Follow> findCompanyFollow(Integer followId);
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
	public Integer countFollow(Integer followId);
	/**
	 * 查看被关注者人数
	 * @param byFollowId
	 * @return
	 * @author 刘志浩
	 * Integer
	 */
	public Integer countByFollow(Integer byFollowId);
	/**
	 *  判断是否关注 
	 *  @author 刘志浩
	 */
	public Follow findIsFollowByFollowIdAndFollowId(@Param("followId")Integer followId,@Param("byFollowId")Integer byFollowId);
}
