package ynjh.personal.dao.discuss;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import ynjh.personal.entity.Discuss;

public interface DiscussMapper {
	//写评论 addUserCommentFirm
	public Integer addUserCommentFirm(Discuss discuss);
	//删评论
	public Integer deleteUserCommentFirm(Integer id);
	//查看评论
	public List<Discuss> selectUserCommentFirm(@Param("id")Integer id,@Param("discussUsersId")Integer discussUsersId );
}
