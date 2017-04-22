package ynjh.personal.service.impl.discuss;

import java.util.List;
/**
 * @author 胡林飞
 *操作企业评论
 */

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import ynjh.personal.dao.discuss.DiscussMapper;
import ynjh.personal.entity.Discuss;
import ynjh.personal.service.DiscussService;
@Service
public class DiscussServiceImpl implements DiscussService {
	@Resource
	private DiscussMapper discussMapper;
	/**
	 * 删除评论
	 * @return Integer 成功1 失败2
	 * @param id 评论企业ID
	 */
	@Override
	public Integer deleteUserDiscuss(Integer id) {
		return discussMapper.deleteUserCommentFirm(id);
	}
	/**
	 * 查看企业评论
	 * @return List<Discuss> 评论列表
	 * @param id 评论企业ID
	 * @param discussUsersId 评论用户的ID
	 */
	@Override
	public List<Discuss> selectUserDiscuss(Integer id, Integer discussUsersId) {
		return discussMapper.selectUserCommentFirm(id, discussUsersId);
	}
	/**
	 * 添加评论
	 * @return Integer 成功1 失败2
	 * @param discuss 评论企业对象
	 */
	@Override
	public Integer addDiscuss(Discuss discuss) {
		return discussMapper.addUserCommentFirm(discuss);
	}

}
