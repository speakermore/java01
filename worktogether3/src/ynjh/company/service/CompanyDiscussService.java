package ynjh.company.service;

import java.util.List;

import ynjh.personal.entity.Discuss;

public interface CompanyDiscussService {
	public int addDiscuss(Discuss discuss);
	public List<Discuss> findAll(Integer page,Integer discussUsersId);
	public Discuss findById(Integer id);
	public int updateStatus(Integer id,Integer discussStatus);
	public int getMax();
}
