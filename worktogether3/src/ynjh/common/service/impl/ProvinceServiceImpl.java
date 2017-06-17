package ynjh.common.service.impl;

import java.util.List;
import java.util.stream.Collectors;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import ynjh.common.dao.ProvinceMapper;
import ynjh.common.entity.Province;
import ynjh.common.service.ProvinceService;
/**
 * 省份的控制器
 * @author 牟勇
 *
 */
@Service
public class ProvinceServiceImpl implements ProvinceService {
	@Resource
	private ProvinceMapper provinceMapper;
	
	@Override
	public List<String> findAllProvinceName() {
		List<Province> provinces=provinceMapper.findAll();
		//将省份的实体类集合转换为省份的字符串集合
		List<String> strProvinceName=provinces.stream().map(p->p.getName()).collect(Collectors.toList());
		return strProvinceName;
	}

}
