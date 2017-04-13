package ynjh.personal.service.impl.message;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import ynjh.personal.dao.message.MessageMapper;
import ynjh.personal.entity.Message;
import ynjh.personal.service.MessageService;
@Service
public class MessageServiceImpl implements MessageService {
	@Resource
	private MessageMapper messageMapper;
	@Override
	public Integer addMessage(Message message) {
		return messageMapper.addMessage(message);
	}

	@Override
	public List<Message> selectUserMessage(Integer userId, Integer resendId) {
		return messageMapper.selectUserMessage(userId, resendId);
	}

}
