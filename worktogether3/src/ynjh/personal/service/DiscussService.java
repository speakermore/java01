package ynjh.personal.service;

import java.util.List;
import ynjh.personal.entity.Discuss;
/**
 * @author 胡林飞
 * 
 */
public interface DiscussService {
		//写评论 addUserCommentFirm
		public Integer addDiscuss(Discuss discuss);
		//删评论
		public Integer deleteUserDiscuss(Integer id);
		//查看评论
		public List<Discuss> selectUserDiscuss(Integer id,Integer discussUsersId );
}
