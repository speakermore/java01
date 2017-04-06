package ynjh.personal.dao.commentcompany;

import java.util.List;

import ynjh.personal.entity.Discuss;

public interface DiscussMapper {

	/**
	 * 写企业评论
	 */
	public Integer addUserCommentFirm(Discuss commentFirm); 
	/**
	 * 删除评价
	 */
	public Integer deleteUserCommentFirm(Integer id);		
	/**
	 *	查看评价
	 */
	public List<Discuss>	selectUserCommentFirm(Integer id);		
	
}
