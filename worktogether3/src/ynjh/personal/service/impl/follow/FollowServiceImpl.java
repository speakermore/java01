package ynjh.personal.service.impl.follow;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import ynjh.personal.dao.follow.FollowMapper;
import ynjh.personal.entity.Follow;
import ynjh.personal.service.FollowService;
@Service
public class FollowServiceImpl implements FollowService {
	@Resource
	private FollowMapper followMapper;
	@Override
	public Integer addUserFollow(Follow follow) {
		return followMapper.addUserFollow(follow);
	}

	@Override
	public Integer deleteUserFollow(Integer id) {
		return followMapper.deleteUserFollow(id);
	}

	@Override
	public List<Follow> selectUserFollow(Integer id) {
		return followMapper.selectUserFollow(id);
	}

}
