package com.zensar.lms.processor;

import java.sql.SQLException;
import java.util.List;

import javax.naming.NamingException;

import org.apache.catalina.User;
import org.apache.log4j.Logger;

import com.zensar.lms.controller.UserController;
import com.zensar.lms.dao.UserDAOimpl;
import com.zensar.lms.entity.UserManagementEntity;

public class UserProcessorimpl implements iUserProcessor
{
    public  static Logger logger = Logger.getLogger(UserProcessorimpl.class);


	public boolean createMember(UserManagementEntity member) throws Exception 
	{
		logger.debug("create Member method of Processor");
		int n=0;
		UserDAOimpl dao = new UserDAOimpl();
		n = dao.insertInDatabase(member);
		if(n>0)
			return true;
		else
			return false;
	}

	public boolean deleteMember(int memberid) throws Exception
	{
		logger.debug("delete Member method of Processor");

		int n=0;
		UserDAOimpl dao = new UserDAOimpl();
		n = dao.deleteMember(memberid);
		if(n>0)
			return true;
		else
			return false;
	}



	public List<List<String>> getMemberData(String membername) throws Exception 
	{
		logger.debug("In getMemberData method of Processor");
		
		UserDAOimpl dao = new UserDAOimpl();
		return (dao.getMemberData(membername));
	}

	public UserManagementEntity getMemberObject(int memberid) throws Exception 
	{
		logger.debug(" In getMemberObject method of Processor");
		
		UserDAOimpl dao = new UserDAOimpl();
		return(dao.getMemberObject(memberid));
	}

	public boolean updateMember(UserManagementEntity member) throws Exception 
	{
		
		logger.debug(" updateMember method of Processor");
		int n=0;
		UserDAOimpl dao = new UserDAOimpl();
		n = dao.updateInDatabase(member);
		if(n>0)
			return true;
		else
			return false;
		
		
		
	}

	

}
