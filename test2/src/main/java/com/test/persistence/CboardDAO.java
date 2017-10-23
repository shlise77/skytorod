package com.test.persistence;

import java.util.List;
import java.util.Map;

import com.test.domain.CompanyVO;
import com.test.domain.IndividualVO;
import com.test.domain.K_aboutVO;
import com.test.domain.K_contactVO;
import com.test.domain.K_homeVO;
import com.test.domain.K_productVO;
import com.test.domain.SearchCriteria;

public interface CboardDAO {
	////// 회사정보 insert
	public void create_home(K_homeVO hvo) throws Exception;

	public void create_about(K_aboutVO avo) throws Exception;

	public void create_product(K_productVO pvo) throws Exception;

	public void create_contact(K_contactVO cvo) throws Exception;

	///////// 회사 개인페이지 select
	public K_homeVO getid(String userid) throws Exception;
	public K_homeVO readPage_home(String code) throws Exception;
	public K_aboutVO readPage_about(String code) throws Exception;
	public List<K_productVO> readPage_product(String code) throws Exception;
	public K_contactVO readPage_contact(String code) throws Exception;

	public K_homeVO updateread_home(int hid) throws Exception;
	public void update_home(K_homeVO hvo) throws Exception;
	public K_aboutVO updateread_about(int aid) throws Exception;
	public void update_about(K_aboutVO avo) throws Exception;
	public K_productVO updateread_product(int pid) throws Exception;
	public void update_product(K_productVO pvo) throws Exception;
	public K_contactVO updateread_contact(int cid) throws Exception;
	public void update_contact(K_contactVO cvo) throws Exception;

	public void delpimage(String userid)throws Exception;

	public void delcompanyimg(String userid)throws Exception;

	public void insert_comcode(Map<String, String> map)throws Exception;

	public IndividualVO getcodeid(String id) throws Exception;

	public void insert_companyuser(Map<String, String> map) throws Exception;

	public List<CompanyVO> getcompanylist(String id)throws Exception;

	public List<CompanyVO> checkcompany(Map<String, String> map) throws Exception;

	public void first_product(Map<String, String> map) throws Exception;

	public List<CompanyVO> searchcode(String id)  throws Exception;

	public List<CompanyVO> selectcompany() throws Exception;

	public List<CompanyVO> getaddress(String companyCode) throws Exception;

	public void remove(int pid) throws Exception;

	public List<CompanyVO> selectgroup(String code) throws Exception;

	public void update_company_about(Map<String, String> map)  throws Exception;

	public void update_company_contact(Map<String, String> map)  throws Exception;

	public void company_indi(Map<String, String> map) throws Exception;

	public List<K_productVO> searchproduct(SearchCriteria cri) throws Exception;

	public List<CompanyVO> selectKeywordcompany(SearchCriteria cri) throws Exception;

	public int selectcompanycount() throws Exception;

	public int selectKeywordcompanycount(SearchCriteria cri) throws Exception;

	
	
}
