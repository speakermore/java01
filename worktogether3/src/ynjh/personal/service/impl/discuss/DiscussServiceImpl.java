package ynjh.personal.service.impl.discuss;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import ynjh.personal.dao.discuss.DiscussMapper;
import ynjh.personal.entity.Discuss;
import ynjh.personal.service.DiscussService;
@Service
public class DiscussServiceImpl implements DiscussService {
	@Resource
	private DiscussMapper discussMapper;

	@Override
	public Integer deleteUserDiscuss(Integer id) {
		return discussMapper.deleteUserCommentFirm(id);
	}

	@Override
	public List<Discuss> selectUserDiscuss(Integer id, Integer discussUsersId) {
		return discussMapper.selectUserCommentFirm(id, discussUsersId);
	}

	@Override
	public Integer addDiscuss(Discuss discuss) {
		return discussMapper.addUserCommentFirm(discuss);
	}

}
