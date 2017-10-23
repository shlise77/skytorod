package com.test.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.test.domain.JoinOne;
import com.test.domain.JoinThree;
import com.test.domain.JoinTwo;
import com.test.persistence.JoinDAO;

@Service
public class JoinServiceImpl implements JoinService{

	@Inject
	private JoinDAO joinDAO;
	
	@Override
	public void insertOne(JoinOne jo) throws Exception {
		joinDAO.insertOne(jo);
		
	}

	@Override
	public void insertTwo(JoinTwo jt) throws Exception {
		joinDAO.insertTwo(jt);		
	}

	@Override
	public void insertThree(JoinThree jit) throws Exception {
		joinDAO.insertThree(jit);
	}

	@Override
	public List<JoinOne> getid(String id) throws Exception {
		// TODO Auto-generated method stub
		return joinDAO.getid(id);
	}

	

}
