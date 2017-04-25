package ynjh.personal.service.impl.message;

import java.util.List;
/**
 * @author 胡林飞
 *操作信息
 */

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import ynjh.personal.dao.message.MessageMapper;
import ynjh.personal.entity.Message;
import ynjh.personal.service.MessageService;
@Service
public class MessageServiceImpl implements MessageService {
	@Resource
	private MessageMapper messageMapper;
	/**
	 * 添加信息内容
	 * @return Integer 成功1 失败2
	 * @param message 信息对象
	 */
	@Override
	public Integer addMessage(Message message) {
		return messageMapper.addMessage(message);
	}
	/**
	 * 查看信息列表
	 * @return List<Message>信息列表
	 * @param userId 用户ID
	 * @param resendId 接收者ID
	 */
	@Override
	public List<Message> selectUserMessage(Integer userId, Integer resendId) {
		return messageMapper.selectUserMessage(userId, resendId);
	}

}
