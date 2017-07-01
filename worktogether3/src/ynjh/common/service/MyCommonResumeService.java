package ynjh.common.service;

import java.util.List;

import com.sun.javafx.collections.MappingChange.Map;

/**
 * 首页显示用的Service类
 * @author 牟勇
 * 
 */
public interface MyCommonResumeService {
	/**
	 * 根据简历的标题或目前职位进行岗位的模糊查询，只显示前5条
	 * 显示用户昵称，学历，目前岗位，工作时间
	 * 简历必须通过审核的简历
	 * @param ResumeTitle 岗位名称的模糊查询条件
	 * @param startRecord 开始的记录下标，小于0表示不分页
	 * @param pageSize 一次查询返回的记录总条数，小于等于0表示不分页
	 * @return
	 */
	public List<Map<String, Object>> findByResumeTitle5(String resumeTitle);
	/**
	 * 统计符合岗位条件的人数
	 * @param resumeTitle 岗位名称的模糊查询
	 * @return 符合岗位条件的总人数
	 */
	public Integer countByResumeTitle(String resumeTitle);
	
	/**
	 * 根据企业招聘岗位进行模糊查询，只显示头5条
	 * 显示工作城市，招聘岗位，需求人数
	 * 招聘信息必须是通过审核的
	 * @param cmpRecTitle 带正则表达式的招聘岗位名称
	 * @return 符合岗位条件的招聘信息
	 */
	public List<Map<String, Object>> findBycmpRecTitle5(String cmpRecTitle);
	/**
	 * 统计符合岗位名称的招聘信息条数
	 * @param cmpRecTitle 岗位名称的条件，可以是正则表达式
	 * @return 符合岗位名称的招聘信息条数
	 */
	public Integer countBycmpRecTitle(String cmpRecTitle);
	/**
	 * 查询公司发布的众筹项目前5名
	 * @return 按时间排序的前5名公司发布的众筹项目
	 */
	public List<Map<String, Object>> findByCrowdfundCompany5();
	/**
	 * 查询个人发布的众筹项目前5名
	 * @return 按时间排序的前5名个人发布的众筹项目
	 */
	public List<Map<String, Object>> findByCrowdfundPerson5();
	/**
	 * 统计公司发布的众筹项目数量
	 * @return 公司发布的众筹项目数量
	 */
	public Integer countCrowdfundCompany();
	/**
	 * 统计个人发布的众筹项目数量
	 * @return 个人发布的众筹项目数量
	 */
	public Integer countCrowdfundPersonal();
	/**
	 * 查询企业文章前5名，按点赞数第一位排序，点击数第二位排序
	 * 文章必须通过审核
	 * @return 符合条件的前5篇企业文章
	 */
	public List<Map<String, Object>> findByCompanyArticle5();
	/**
	 * 统计企业文章的数量，文章必须是通过审核的
	 * @return 通过审核的企业文章总数
	 */
	public Integer countCompanyArticle();
	/**
	 * 查询个人文章前5，按点赞数第一位排序，点击数第二位排序
	 * 文章必须通过审核
	 * @return 符合条件的前5篇个人文章
	 */
	public List<Map<String, Object>> findByPersonalArticle5();
	/**
	 * 查询个人文章的总数量
	 * @return 个人文章的篇数
	 */
	public Integer countPersonalArticle();
}
