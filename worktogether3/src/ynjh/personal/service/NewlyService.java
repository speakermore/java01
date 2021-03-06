package ynjh.personal.service;

import java.util.List;
import java.util.Map;

import ynjh.company.entity.Offer;
import ynjh.personal.entity.ArticleByFollow;

/**
 * 最新消息service
 * @author 刘志浩
 *
 */
public interface NewlyService {

	/**
	 * 牟勇：查看最新发布面试消息，这里指的最新发布就是offerAction=1的面试信息
	 * 面试必须是通过审核的
	 * 接收状态：offerAction
	 * 1.尚未阅读
	 * 2.接受邀请
	 * 3.拒绝邀请
	 * 4.尚未回复	
	 * @param userId 用户id
	 * @return 符合条件的Offer集合
	 */
	public List<Offer> findNewlyFaceByUserId(Integer userId);
	/**
	 * 牟勇：查看关注者最新发布文章消息
	 * 文章必须是通过审核的，时间为2周以内
	 * @param userId 用户id
	 * @return 符合条件的ArticleByFollow对象集合
	 */
	public List<ArticleByFollow> findNewlyArticleByFollow(Integer userId);
	// 查看被关注者发布文章消息的数量
	public Integer getByFollowIdCount(Integer userId);
	/**
	 * 牟勇：查看两周内对我的文章的评论,
	 * 只查询个人用户对我的文章的评论
	 * 按评论发表时间排序
	 * 评论必须审核通过
	 * 返回文章标题(articleTitle)，文章id(artid),评论者id（cid），评论者昵称（userName）
	 * @param userId 文章作者的id
	 * @return 符合条件的Map集合，如果查不到内容，返回null
	 */
	public List<Map<String, Object>>  findNewlyCommentArticleByUserId(Integer userId);
}
