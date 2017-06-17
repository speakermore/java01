package ynjh.common.service.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import ynjh.common.dao.NationMapper;
import ynjh.common.entity.Nation;
import ynjh.common.service.NationService;

/**
 * 民族业务类的实现类
 * @author 牟勇
 *
 */
@Service
public class NationServiceImpl implements NationService {
	@Resource
	NationMapper nationMapper;
	@Override
	/**
	 * 牟勇：根据数据库返回的集合，整理为String类型的民族名称集合，方便JSP在下拉列表中使用
	 */
	public List<String> findAllNationName() {
		List<Nation> nations=nationMapper.findAll();
		
		//牟勇：使用流技术，将实体类中的民族名称转换为一个字符串集合，方便页面操作
		//第一步：获得Stream对象，这里是调用集合提供的stream()方法来完成
		//第二步：调用中继方法，这里是调用map方法，指定调用getNationName()方法来获得所有的民族名称
		//第三步：调用执行方法，这里是调用collect()方法，真正开始执行所有的操作，完成字符串集合的获得
		List<String> strNation=nations.stream().map(n->n.getNationName()).collect(Collectors.toList());
		return strNation;
	}
}
