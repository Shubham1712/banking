package com.zensar.lms.dao;

import java.sql.Connection;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import org.apache.log4j.Logger;

public class ConnectionDao 
{
	
	public static Logger logger = Logger.getLogger(ConnectionDao.class);

	public Connection getConnection() throws Exception 
	{
		logger.debug("connection created");
		
		Context ctx = null;
		ctx = (Context) new InitialContext();
		DataSource ds = (DataSource) ((InitialContext) ctx).lookup("java:/comp/env/jdbc/oracle");
		return ds.getConnection();
	}


}
