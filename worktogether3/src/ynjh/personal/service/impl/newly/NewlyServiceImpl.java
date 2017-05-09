package ynjh.personal.service.impl.newly;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import ynjh.company.entity.Offer;
import ynjh.personal.dao.newly.NewlyMapper;
import ynjh.personal.service.NewlyService;
/**
 * 最新消息
 * @author 刘志浩
 *
 */
@Service
public class NewlyServiceImpl implements NewlyService {
	@Resource
	private NewlyMapper newsMapper;
	
	/**
	 * 查看最新发布面试消息 
	 */
	@Override
	public Offer findNewsFaceByUserId(Integer userId) {
		return newsMapper.findNewsFaceByUserId(userId);
	}

}
