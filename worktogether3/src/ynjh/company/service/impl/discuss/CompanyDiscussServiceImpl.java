package ynjh.company.service.impl.discuss;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import ynjh.company.dao.discuss.CompanyDiscussMapper;
import ynjh.company.service.CompanyDiscussService;

import ynjh.personal.entity.Discuss;

@Service
public class CompanyDiscussServiceImpl implements CompanyDiscussService{

	@Resource
	private CompanyDiscussMapper cDiscussMapper;
	@Override
	public int addDiscuss(Discuss discuss) {
		
		return cDiscussMapper.addDiscuss(discuss);
	}

	@Override
	public List<Discuss> findAll(Integer page,Integer discussUsersId) {
		if (page==null) {
			page=1;
		}
		if (page!=null&&page<1) {
			page=1;
		}
		int maxpage=cDiscussMapper.getMaxRecordCount();
		if (page!=null&&page>maxpage) {
			page=maxpage;
		}
		return cDiscussMapper.findAll((page-1)*5,discussUsersId);
	}

	@Override
	public Discuss findById(Integer id) {
		
		return cDiscussMapper.findById(id);
	}

	@Override
	public int updateStatus(Integer id,Integer discussStatus) {
		
		return cDiscussMapper.updateDiscussStatus(id, discussStatus);
	}

	@Override
	public int getMax() {
		
		return (cDiscussMapper.getMaxRecordCount()+(5-1))/5;
	}

}
