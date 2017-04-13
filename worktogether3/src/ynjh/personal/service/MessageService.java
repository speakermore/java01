package ynjh.personal.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import ynjh.personal.entity.Message;

public interface MessageService {
	/**
	 * 添加消息
	 */
	public Integer addMessage(Message message);
	/**
	 * 查询消息
	 */
	public List<Message> selectUserMessage(@Param("userId")Integer userId,@Param("resendId")Integer resendId);	
}
