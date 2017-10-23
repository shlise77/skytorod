package com.test.persistence;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.test.domain.CompanyVO;
import com.test.domain.IndividualVO;
import com.test.domain.K_aboutVO;
import com.test.domain.K_contactVO;
import com.test.domain.K_homeVO;
import com.test.domain.K_productVO;
import com.test.domain.SearchCriteria;

@Repository
public class CboardDAOImpl implements CboardDAO {
	@Inject
	private SqlSession sqlSession;

	private static final String namespace = "com.test.mapper.CboardMapper";
//////회사정보 insert
	@Override
	public void create_home(K_homeVO hvo) throws Exception {
		sqlSession.insert(namespace +".create_home", hvo);
	}
	@Override
	public void create_about(K_aboutVO avo) throws Exception {
		sqlSession.insert(namespace +".create_about", avo);
	}
	@Override
	public void create_product(K_productVO pvo) throws Exception {
		sqlSession.insert(namespace +".create_product", pvo);
	}
	@Override
	public void create_contact(K_contactVO cvo) throws Exception {
		sqlSession.insert(namespace +".create_contact", cvo);
	}
//////회사정보 select
	@Override
	public K_homeVO readPage_home(String code) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace +".readPage_home",code );
	}
	@Override
	public K_aboutVO readPage_about(String code) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace +".readPage_about",code );
	}
	@Override
	public List<K_productVO> readPage_product(String code) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace +".readPage_product",code );
	}
	@Override
	public K_contactVO readPage_contact(String code) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace +".readPage_contact",code );
	}
	
	@Override
	public K_homeVO updateread_home(int hid) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace +".updateread_home",hid );
	}
	@Override
	public void update_home(K_homeVO hvo) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.update(namespace +".update_home", hvo);
		
	}	
	@Override
	public K_aboutVO updateread_about(int aid) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace +".updateread_about",aid );
	}
	@Override
	public void update_about(K_aboutVO avo) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.update(namespace +".update_about", avo);
	}
	@Override
	public K_productVO updateread_product(int pid) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace +".updateread_product",pid );
	}
	@Override
	public void update_product(K_productVO pvo) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.update(namespace +".update_product", pvo);
	}
	@Override
	public K_contactVO updateread_contact(int cid) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace +".updateread_contact",cid );
	}
	@Override
	public void update_contact(K_contactVO cvo) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.update(namespace +".update_contact", cvo);
	}
	@Override
	public K_homeVO getid(String userid) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace +".getid", userid);
	}
	@Override
	public void delpimage(String userid) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.update(namespace +".delpimage", userid);
	}
	@Override
	public void delcompanyimg(String userid) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.update(namespace +".delcompanyimg", userid);
	}
	@Override
	public void insert_comcode(Map<String, String> map) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.update(namespace +".insert_comcode", map);
	}
	@Override
	public IndividualVO getcodeid(String id) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace +".getcodeid", id);
	}
	@Override
	public void insert_companyuser(Map<String, String> map) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.insert(namespace +".insert_companyuser", map);
	}
	@Override
	public List<CompanyVO> getcompanylist(String id) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace +".getcompanylist", id);
	}
	@Override
	public List<CompanyVO> checkcompany(Map<String, String> map) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace +".checkcompany", map);
	}
	@Override
	public void first_product(Map<String, String> map) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.insert(namespace +".first_product", map);
	}
	@Override
	public List<CompanyVO> searchcode(String id) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace +".searchcode", id);
	}
	@Override
	public List<CompanyVO> selectcompany() throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace +".selectcompany");
	}
	@Override
	public List<CompanyVO> getaddress(String companyCode) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace +".getaddress", companyCode);
	}
	@Override
	public void remove(int pid) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.delete(namespace +".remove", pid);
		
	}
	@Override
	public List<CompanyVO> selectgroup(String code) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace +".selectgroup",code);
	}
	@Override
	public void update_company_about(Map<String, String> map) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.update(namespace +".update_company_about", map);
	}
	@Override
	public void update_company_contact(Map<String, String> map) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.update(namespace +".update_company_contact", map);
	}
	@Override
	public void company_indi(Map<String, String> map) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.update(namespace +".company_indi", map);
	}
	@Override
	public List<K_productVO> searchproduct(SearchCriteria cri) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace +".searchproduct", cri);
	}
	@Override
	public List<CompanyVO> selectKeywordcompany(SearchCriteria cri) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace +".selectKeywordcompany", cri);
	}
	@Override
	public int selectcompanycount() throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace +".selectcompanycount");
	}
	@Override
	public int selectKeywordcompanycount(SearchCriteria cri) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace +".selectKeywordcompanycount",cri);
	}
}
