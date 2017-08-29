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
	public List<Discuss> findAll(Integer discussBySendId) {
		
		return cDiscussMapper.findAll(discussBySendId);
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
	public List<Discuss> findDiscussByCompanyId(Integer companyId) {
		
		return cDiscussMapper.findDiscussByCompanyId(companyId);
	}

}
