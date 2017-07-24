package ynjh.personal.dao.mood;

import ynjh.personal.entity.Mood;

public interface MoodMapper {
	/**
	 * 写心情
	 */
	public Integer addMood(Mood mood);
	/**
	 * 牟勇：根据个人用户名查询心情
	 * 按时间降序排序，返回时间上最新的一条心情
	 * @param userId 个人用户主键id
	 * @return 符合要求的一个Mood对象
	 */
	public Mood selectMoodById(Integer userId);
	
	
}
