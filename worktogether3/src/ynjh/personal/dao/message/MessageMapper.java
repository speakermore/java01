package ynjh.personal.dao.message;

import java.util.List;

public interface MessageMapper {
	/**
	 * 查询消息（企业接口）
	 */
	public List<String>	selectUserMessage(Integer id);	
}
