package ynjh.personal.service;

import ynjh.personal.entity.Mood;
/**
 * @author 胡林飞
 * 
 */
public interface MoodService {
	// 写心情
	public Integer addMood(Mood mood);
	//查看心情
	public Mood  selectMoodById(Integer id);
}
