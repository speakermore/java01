package ynjh.common.service;

import java.util.List;

/**
 * 民族的业务接口
 * @author 牟勇
 *
 */
public interface NationService {
	/**
	 * 根据数据库返回的集合，整理为String类型的民族名称集合，方便JSP在下拉列表中使用
	 * @return 集合，民族的名称以字符串形式保存
	 */
	public List<String> findAllNationName();
}
