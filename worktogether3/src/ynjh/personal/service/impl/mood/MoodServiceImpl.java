package ynjh.personal.service.impl.mood;
/**
 * @author 胡林飞
 * 心情业务类
 */
import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import ynjh.personal.dao.mood.MoodMapper;
import ynjh.personal.entity.Mood;
import ynjh.personal.service.MoodService;
@Service
public class MoodServiceImpl implements MoodService {
	@Resource
	private MoodMapper moodMapper;
	/**
	 * 写心情
	 * @return Integer
	 * @param mood 心情对象
	 */
	@Override
	public Integer addMood(Mood mood) {
		return moodMapper.addMood(mood);
	}
	
	@Override
	public Mood findLastestMoodByUserId(Integer userId) {
		return moodMapper.findLastestMoodByUserId(userId);
	}

}
