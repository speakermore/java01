package ynjh.common.dao;

import java.util.List;

import ynjh.common.entity.Nation;
/**
 * 民族的Dao接口
 * @author 牟勇
 *
 */
public interface NationMapper {
	/**
	 * 查询所有的民族信息，用于JSP页面表单民族下拉列表的显示
	 * @return 57个民族名称
	 */
	public List<Nation> findAll();
}
