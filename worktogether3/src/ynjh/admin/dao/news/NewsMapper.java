package ynjh.admin.dao.news;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import ynjh.admin.entity.News;

/**
 * 新闻资讯的Dao接口
 * @author 牟勇
 *
 */
public interface NewsMapper {
	/**
	 * 添加新闻资讯，创建时间为当前服务器系统时间，状态默认为1.正常，点击次和点赞数默认为0
	 * @param news 新闻资讯实体类
	 * @return 大于0表示成功，否则表示失败
	 */
	public int addNews(News news);
	/**
	 * 修改新闻资讯，允许修改新闻标题，内容，时间自动更新为修改的时间
	 * 状态为9.正常，2.禁用，10.置顶
	 * （10为置顶是为了方便将来可以添加更多状态，但不影响以排序方式来把置顶文章放最前）
	 * @param news 新闻资讯实体类
	 * @return 大于0表示成功，否则表示失败
	 */
	public int updateNews(News news);
	/**
	 * 真删除新闻资讯（目前考虑是否真需要进行这样的操作）
	 * @param id 新闻资讯的主键
	 * @return 大于0表示成功，否则表示失败
	 */
	public int deleteNews(Integer id);
	/**
	 * 查询所有新闻资讯，以状态降序排序，创建时间降序排序，即置顶最新发表的新闻资讯排在最前面。
	 * 状态9.正常，2.禁用，10.置顶
	 * （10为置顶是为了方便将来可以添加更多状态，但不影响以排序方式来把置顶文章放最前）
	 * 因为会修改时会自动更新创建时间，所以如果一篇资讯新闻在被修改之后，会排到最前面
	 * @return
	 */
	public List<News> findAll();
	/**
	 * 查询前10篇新闻资讯，以状态降序排序，创建时间降序排序，即置顶最新发表的新闻资讯排在最前面。
	 * 状态9.正常，2.禁用，10.置顶
	 * （10为置顶是为了方便将来可以添加更多状态，但不影响以排序方式来把置顶文章放最前）
	 * 因为会修改时会自动更新创建时间，所以如果一篇资讯新闻在被修改之后，会排到最前面
	 * @return
	 */
	public List<News> findTop10ByCreateDate();
	/**
	 * 根据主键查询一篇新闻资讯
	 * @param id 主键
	 * @return 查询到的新闻资讯
	 */
	public News findById(Integer id);
	
	/**
	 * 根据新闻资讯主键添加点击数，每次加1
	 * @param id 新闻资讯主键
	 * @return 大于0表示成功，否则表示失败
	 */
	public int addClick(Integer id);
	
	/**
	 * 根据新闻资讯主键添加点赞数，每次加1
	 * @param id 新闻资讯主键
	 * @return 大于0表示成功，否则表示失败
	 */
	public int addLike(Integer id);
	/**
	 * 将指定的新闻资讯状态进行修改
	 * @param id 指定的新闻资讯主键
	 * @return 大于0表示成功，否则表示失败
	 */
	public int updateStatus(@Param("id")Integer id,@Param("status")Integer status);
}
