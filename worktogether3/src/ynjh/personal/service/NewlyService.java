package ynjh.personal.service;

import ynjh.company.entity.Offer;

/**
 * 
 * @author 刘志浩
 *
 */
public interface NewlyService {

	// 查看最新发布面试消息
	public Offer findNewsFaceByUserId(Integer userId);
}
