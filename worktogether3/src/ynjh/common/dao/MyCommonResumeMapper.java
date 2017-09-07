package ynjh.common.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;


/**
 * 首页显示用的Dao类
 * 完成首页的各种分类查询
 * @author 牟勇
 *
 */
public interface MyCommonResumeMapper {
	/**
	 * 根据简历的标题或目前职位进行多个岗位的模糊查询，可用于分页或限制查询结果的条数
	 * 显示用户主键,用户昵称，学历，目前岗位，工作时间，求职意向岗位
	 * 简历必须通过审核的简历
	 * @param ResumeTitle 岗位名称的模糊查询条件，多个职位条件以数组方式传入，每个值均应该带有模糊匹配的字符（%或_之类）
	 * @param startRecord 开始的记录下标，小于0表示不分页
	 * @param pageSize 一次查询返回的记录总条数，小于等于0表示不分页
	 * @return
	 */
	public List<Map<String, Object>> findByResumeTitle(@Param("resumeTitle")String[] resumeTitle,@Param("startRecord")Integer startRecord,@Param("pageSize")Integer pageSize);
	/**
	 * 统计符合岗位条件的人数
	 * @param resumeTitle 岗位名称的模糊查询,多个职位条件以数组方式传入，每个值均应该带有模糊匹配的字符（%或_之类）
	 * @return 符合岗位条件的总人数
	 */
	public Integer countByResumeTitle(@Param("resumeTitle")String[] resumeTitle);
	
	/**
	 * 根据企业招聘岗位进行模糊查询，可用于分页或限制查询结果的条数
	 * 显示工作城市，招聘岗位，需求人数
	 * 招聘信息必须是通过审核的
	 * @param cmpRecTitle 带正则表达式的招聘岗位名称
	 * @param startRecord 开始的记录下标，小于0表示不分页
	 * @param pageSize 一次查询可以获得的记录条数，小于等于0表示不分页
	 * @return 符合岗位条件的招聘信息
	 */
	public List<Map<String, Object>> findBycmpRecTitle(@Param("cmpRecTitle")String cmpRecTitle,@Param("startRecord")Integer startRecord,@Param("pageSize")Integer pageSize);
	/**
	 * 统计符合岗位名称的招聘信息条数
	 * @param cmpRecTitle 岗位名称的条件，可以是正则表达式
	 * @return 符合岗位名称的招聘信息条数
	 */
	public Integer countBycmpRecTitle(String cmpRecTitle);
	/**
	 * 根据发布者Id的类型（大于等于1234567890为个人，否则为企业）查询众筹的信息，可进行分页
	 * 查询条件中并不包含发布者id的限制条件，仅仅按发布者id进行一个类型判断，然后查出多条不同发布者的信息
	 * 众筹必须是通过审核的，即crowdfundProjectCheckState为2，
	 * 查询时的时间必须小于众筹结束时间，即当前时间应该是小于crowdfundProjectEndDate
	 * 查询结果按众筹开始时间进行降序排序
	 * @param publisherId 发布者的Id
	 * @param startRecord 开始的记录下标，如果小于0，则不分页
	 * @param pageSize 每页的记录条数，如果小于等于0，则不分页
	 * @return 符合条件的众筹信息的集合，输出信息包括众筹名称，众筹项目价值，发布者
	 */
	public List<Map<String, Object>> findByPublisherIdType(@Param("publisherId")Integer publisherId,@Param("startRecord")Integer startRecord,@Param("pageSize")Integer pageSize);
	/**
	 * 根据发布者Id类型（大于等于1234567890为个人，否则为企业）统计众筹信息的条数
	 * 查询条件中并不包含发布者id的限制条件，仅仅按发布者id进行一个类型判断，然后统计多条不同发布者的总数
	 * 众筹名称，众筹项目价值，发布者
	 * 众筹必须是通过审核的，即crowdfundProjectCheckState为2，
	 * 查询时的时间必须小于众筹结束时间，即当前时间应该是小于crowdfundProjectEndDate
	 * @param publisherId 发布者Id
	 * @return 统计众筹信息的总数
	 */
	public Integer countByPublisherIdType(@Param("publisherId")Integer publisherId);
	/**
	 * 按用户类型查询文章，可分页
	 * 文章信息显示：企业文章：企业名称，文章名称，点击数，点赞数
	 * 个人文章：昵称，文章名称，点击数，点赞数
	 * 按点赞数，点击数降序排序
	 * 用户id类型小于1234567890，是企业发的文章，大于等于1234567890，是个人用户发的文章
	 * 用户文章必须是通过审核的（状态为2）
	 * @param userIdType 用户id类型，仅用于判断用户是企业用户还是个人用户
	 * @param startRecord 开始的记录下标，如果小于0，则不分页
	 * @param pageSize 每页的记录条数，如果小于等于0，则不分页
	 * @return 符合条件的用户文章
	 */
	public List<Map<String, Object>> findByArticleType(@Param("userIdType")Integer userIdType,@Param("startRecord")Integer startRecord,@Param("pageSize")Integer pageSize);
	/**
	 * 根据用户ID类型统计文章的数量
	 * 用户id类型小于1234567890，是企业发的文章，大于等于1234567890，是个人用户发的文章
	 * 用户文章必须是通过审核的（状态为2）
	 * @param userIdType 用户Id类型，仅用于判断用户是企业用户还是个人用户
	 * @return 符合条件的文章数量
	 */
	public Integer countByArticleType(@Param("userIdType")Integer userIdType);
	
}
