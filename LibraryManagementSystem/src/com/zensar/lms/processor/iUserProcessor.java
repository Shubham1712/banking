package com.zensar.lms.processor;

import java.util.List;


import com.zensar.lms.entity.UserManagementEntity;

public interface iUserProcessor 
{
	public boolean createMember(UserManagementEntity enitity) throws Exception ;
	public boolean deleteMember(int memberid) throws Exception;
	public List<List<String>> getMemberData(String membername) throws Exception;
	public UserManagementEntity getMemberObject(int memberid) throws Exception;
	public boolean updateMember(UserManagementEntity member) throws Exception; 


}
