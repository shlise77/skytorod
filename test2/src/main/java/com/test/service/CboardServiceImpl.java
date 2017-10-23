package com.test.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.test.domain.CompanyVO;
import com.test.domain.IndividualVO;
import com.test.domain.K_aboutVO;
import com.test.domain.K_contactVO;
import com.test.domain.K_homeVO;
import com.test.domain.K_productVO;
import com.test.domain.SearchCriteria;
import com.test.persistence.CboardDAO;

@Service
public class CboardServiceImpl implements CboardService {
	@Inject
	private CboardDAO dao;
//////회사정보 insert
	@Transactional
	@Override
	public void insert_home(K_homeVO hvo)throws Exception {
		dao.create_home(hvo);
	}
	@Transactional
	@Override
	public void insert_about(K_aboutVO avo)throws Exception {
		dao.create_about(avo);

	}
	@Transactional
	@Override
	public void insert_product(K_productVO pvo)throws Exception {
		dao.create_product(pvo);

	}
	@Transactional
	@Override
	public void insert_contact(K_contactVO cvo)throws Exception {
		dao.create_contact(cvo);

	}
//////회사정보 select
	@Override
	public K_homeVO readPage_home(String code) throws Exception {
		// TODO Auto-generated method stub
		return dao.readPage_home(code);
	}
	@Override
	public K_aboutVO readPage_about(String code) throws Exception {
		// TODO Auto-generated method stub
		return dao.readPage_about(code);
	}
	@Override
	public List<K_productVO> readPage_product(String code) throws Exception {
		// TODO Auto-generated method stub
		return dao.readPage_product(code);
	}
	@Override
	public K_contactVO readPage_contact(String code) throws Exception {
		// TODO Auto-generated method stub
		return dao.readPage_contact(code);
	}
	
	@Override
	public K_homeVO updateread_home(int hid) throws Exception {
		// TODO Auto-generated method stub
		return dao.updateread_home(hid);
	}
	@Override
	public void update_home(K_homeVO hvo) throws Exception {
		// TODO Auto-generated method stub
		dao.update_home(hvo);
	}
	@Override
	public K_aboutVO updateread_about(int aid) throws Exception {
		// TODO Auto-generated method stub
		return dao.updateread_about(aid);
	}
	@Override
	public void update_about(K_aboutVO avo) throws Exception {
		// TODO Auto-generated method stub
		dao.update_about(avo);
	}
	@Override
	public K_productVO updateread_product(int pid) throws Exception {
		// TODO Auto-generated method stub
		return dao.updateread_product(pid);
	}
	@Override
	public void update_product(K_productVO pvo) throws Exception {
		// TODO Auto-generated method stub
		dao.update_product(pvo);
	}
	@Override
	public K_contactVO updateread_contact(int cid) throws Exception {
		// TODO Auto-generated method stub
		return dao.updateread_contact(cid);
	}
	@Override
	public void update_contact(K_contactVO cvo) throws Exception {
		// TODO Auto-generated method stub
		dao.update_contact(cvo);
	}
	@Override
	public K_homeVO getid(String userid) throws Exception {
		// TODO Auto-generated method stub
		return dao.getid(userid);
	}
	@Override
	public void delpimage(String userid) throws Exception {
		// TODO Auto-generated method stub
		dao.delpimage(userid);
	}
	@Override
	public void delcompanyimg(String userid) throws Exception {
		// TODO Auto-generated method stub
		dao.delcompanyimg(userid);
	}
	@Override
	public void insert_comcode(Map<String, String> map) throws Exception {
		// TODO Auto-generated method stub
		dao.insert_comcode(map);
	}
	@Override
	public IndividualVO getcodeid(String id) throws Exception {
		// TODO Auto-generated method stub
		return dao.getcodeid(id);
	}
	@Override
	public void insert_companyuser(Map<String, String> map) throws Exception {
		// TODO Auto-generated method stub
		dao.insert_companyuser(map);
	}
	@Override
	public List<CompanyVO> getcompanylist(String id) throws Exception {
		// TODO Auto-generated method stub
		return dao.getcompanylist(id);
	}
	@Override
	public List<CompanyVO> checkcompany(Map<String, String> map) throws Exception {
		// TODO Auto-generated method stub
		return dao.checkcompany(map);
	}
	@Override
	public void first_product(Map<String, String> map) throws Exception {
		// TODO Auto-generated method stub
		dao.first_product(map);
	}
	@Override
	public List<CompanyVO> searchcode(String id) throws Exception {
		// TODO Auto-generated method stub
		return dao.searchcode(id);
	}
	@Override
	public List<CompanyVO> selectcompany() throws Exception {
		// TODO Auto-generated method stub
		return dao.selectcompany();
	}
	@Override
	public List<CompanyVO> getaddress(String companyCode) throws Exception {
		// TODO Auto-generated method stub
		return dao.getaddress(companyCode);
	}
	@Override
	public void remove(int pid) throws Exception {
		// TODO Auto-generated method stub
		dao.remove(pid);
	}
	@Override
	public List<CompanyVO> selectgroup(String code) throws Exception {
		// TODO Auto-generated method stub
		return dao.selectgroup(code);
	}
	@Override
	public void update_company_about(Map<String, String> map) throws Exception {
		// TODO Auto-generated method stub
		dao.update_company_about(map);
	}
	@Override
	public void update_company_contact(Map<String, String> map) throws Exception {
		// TODO Auto-generated method stub
		dao.update_company_contact(map);
	}
	@Override
	public void company_indi(Map<String, String> map) throws Exception {
		// TODO Auto-generated method stub
		dao.company_indi(map);
	}
	@Override
	public List<K_productVO> searchproduct(SearchCriteria cri) throws Exception {
		// TODO Auto-generated method stub
		return dao.searchproduct(cri);
	}
	@Override
	public List<CompanyVO> selectKeywordcompany(SearchCriteria cri) throws Exception {
		// TODO Auto-generated method stub
		return dao.selectKeywordcompany(cri);
	}
	@Override
	public int selectcompanycount() throws Exception {
		// TODO Auto-generated method stub
		return dao.selectcompanycount();
	}
	@Override
	public int selectKeywordcompanycount(SearchCriteria cri) throws Exception {
		// TODO Auto-generated method stub
		return dao.selectKeywordcompanycount(cri);
	}

}
