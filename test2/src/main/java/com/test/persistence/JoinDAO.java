package com.test.persistence;

import java.util.List;

import com.test.domain.JoinOne;
import com.test.domain.JoinThree;
import com.test.domain.JoinTwo;

public interface JoinDAO {
	public void insertOne(JoinOne jo) throws Exception;
	public void insertTwo(JoinTwo jt) throws Exception;
	public void insertThree(JoinThree jit) throws Exception;
	public List<JoinOne> getid(String id) throws Exception;;
	
	
}
