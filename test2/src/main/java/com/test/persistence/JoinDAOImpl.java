package com.test.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.test.domain.JoinOne;
import com.test.domain.JoinThree;
import com.test.domain.JoinTwo;

@Repository
public class JoinDAOImpl implements JoinDAO{
	
	@Inject
	private SqlSession sqlSession;
	
	

	
	private static final String namespace = "com.klaiverjoin.mappers.JoinMapper";
	
	
	@Override
	public void insertOne(JoinOne jo) throws Exception {
		System.out.println("-------------"+jo.getEmail());
		sqlSession.insert(namespace+".k_joinone",jo);
		
	}

	@Override
	public void insertTwo(JoinTwo jt) throws Exception {
		System.out.println("11111111111"+jt.getIndustry());
		sqlSession.insert(namespace+".k_jointwo",jt);
		
	}

	@Override
	public void insertThree(JoinThree jit) throws Exception {
		System.out.println("aaaaaaaaaaaaa"+jit.getcountry());
		sqlSession.insert(namespace+".k_jointhree",jit);
		
	}

	@Override
	public List<JoinOne> getid(String id) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("dao"+id);
		return sqlSession.selectList(namespace+".getid",id);
	}


	
	
}
