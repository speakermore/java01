package ynjh.common.dao;

import java.util.List;

import ynjh.common.entity.Province;
/**
 * 处理省份的Dao接口
 * @author 牟勇
 *
 */
public interface ProvinceMapper {
	public List<Province> findAll();
}
