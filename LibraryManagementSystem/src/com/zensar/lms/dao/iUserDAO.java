package com.zensar.lms.dao;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;


import com.zensar.lms.entity.UserManagementEntity;

public interface iUserDAO 
{
	public int insertInDatabase(UserManagementEntity member) throws Exception ;
	public int deleteMember(int memberid) throws Exception;
	public List<List<String>> getMemberData(String membername) throws Exception;
	public UserManagementEntity getMemberObject(int memberid) throws Exception;
	public int updateInDatabase(UserManagementEntity member) throws Exception; 

	



}
