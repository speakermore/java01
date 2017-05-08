package ynjh.personal.dao.mood;

import ynjh.personal.entity.Mood;

public interface MoodMapper {
	/**
	 * 写心情
	 */
	public Integer addMood(Mood mood);
	/**
	 * 查看心情
	 */
	public Mood selectMoodByid(Integer id);
	
}
