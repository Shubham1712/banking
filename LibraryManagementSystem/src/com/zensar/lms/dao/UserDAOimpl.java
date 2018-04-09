package com.zensar.lms.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;


import org.apache.log4j.Logger;

import com.zensar.lms.entity.UserManagementEntity;

public class UserDAOimpl implements iUserDAO
{
	public static Logger logger = Logger.getLogger(UserDAOimpl.class);

	public int insertInDatabase(UserManagementEntity member) throws Exception 
	{
		logger.debug("insert in database method of dao");

		int output = 0;
		ConnectionDao dao= new ConnectionDao();
		try (Connection con = dao.getConnection();) {
			PreparedStatement pst = con.prepareStatement("insert into library_member"
					+ "(member_id,first_name,last_name,date_of_birth,address,city_id,state_id,zip_code,phone_number,email) "
					+ "values(seq_id.nextval,?,?,to_date(?,'YYYY-MM-DD'),?,?,?,?,?,?)");
			pst.setString(1, member.getFirst_name());
			pst.setString(2, member.getLast_name());
			pst.setString(3, member.getDob());
			pst.setString(4, member.getAddress());
			pst.setInt(5, member.getCity());
			pst.setInt(6, member.getState());
			pst.setInt(7, member.getZipcode());
			pst.setInt(8, member.getPhone_number());
			pst.setString(9, member.getEmail());
			try
			{
				output = pst.executeUpdate();
			} catch (Exception e) 
			{
				logger.error("Exception ::" , e);
				logger.debug(" exception in insertion of data");
				e.printStackTrace();
			}
		}

		return output;
	}

	public int deleteMember(int memberid) throws Exception 
	{
		logger.debug("deleteMember method in database of DAO");

		int n = 0;
		ConnectionDao dao= new ConnectionDao();
		try (Connection con = dao.getConnection();) 
		{
			PreparedStatement pst = con.prepareStatement("delete from library_member where member_id=?");
			pst.setInt(1, memberid);
			n= pst.executeUpdate();
			
			
		}
		return n;
	
	}

	public List<List<String>> getMemberData(String membername) throws Exception 
	{
		logger.debug("getMemberData method from database of DAO");

		List<List<String>> data = new ArrayList<>();
		ConnectionDao dao= new ConnectionDao();
		try (Connection con = dao.getConnection();) 
		{
			PreparedStatement pst = con.prepareStatement("select member_id,first_name,last_name,date_of_birth,address,zip_code,"
					+ "phone_number,email from library_member where first_name=? ");
			pst.setString(1, membername);
			ResultSet rs = pst.executeQuery();
			List<String> row = new ArrayList<>();

			for (int i = 1; i <= rs.getMetaData().getColumnCount(); i++)
			{
				row.add(rs.getMetaData().getColumnName(i));
			}
			data.add(row);
			
				while (rs.next()) 
				{
					row = new ArrayList<>();
					for (int i = 1; i <= rs.getMetaData().getColumnCount(); i++) 
					{
						row.add(rs.getString(i));
					}
					data.add(row);
				}
			
			
			
		}
		return data;

	}

	public UserManagementEntity getMemberObject(int memberid) throws Exception
	{
		logger.debug("getMemberObject method from database of DAO");
		ConnectionDao dao= new ConnectionDao();

		try (Connection con = dao.getConnection();) 
		{
			UserManagementEntity member = new UserManagementEntity();

			PreparedStatement pst = con.prepareStatement("select * from library_member where member_id=? ");
			pst.setInt(1, memberid);
			ResultSet rs = pst.executeQuery();

			while (rs.next()) 
			{
				member.setMemberid(Integer.parseInt(rs.getString(1)));
				member.setFirst_name(rs.getString(2));
				member.setLast_name(rs.getString(3));
				member.setDob(rs.getString(4));
				member.setAddress(rs.getString(5));
				member.setCity(rs.getInt(6));
				member.setState(rs.getInt(7));
				member.setZipcode(rs.getInt(8));
				member.setPhone_number(rs.getInt(9));
				member.setEmail(rs.getString(10));
				member.setIsbookissued(rs.getInt(11));
			}
			return member;
		}
	}

	public int updateInDatabase(UserManagementEntity member) throws Exception 
	{
		logger.debug("update in database method of dao");
		ConnectionDao dao= new ConnectionDao();

		int output = 0;
		try (Connection con = dao.getConnection();) 
		{
			PreparedStatement pst = con.prepareStatement("update  library_member set first_name=? ,"
					+ "last_name=?,date_of_birth=to_date(?,'YYYY-MM-DD'),address=?,city_id=?,state_id=?,"
					+ "zip_code=?,phone_number=?,email=? where member_id=?");
			pst.setString(1, member.getFirst_name());
			pst.setString(2, member.getLast_name());
			pst.setString(3, member.getDob());
			pst.setString(4, member.getAddress());
			pst.setInt(5, member.getCity());
			pst.setInt(6, member.getState());
			pst.setInt(7, member.getZipcode());
			pst.setInt(8, member.getPhone_number());
			pst.setString(9, member.getEmail());
			pst.setInt(10, member.getMemberid());

			output = pst.executeUpdate();

		}

		return output;

	}

	
	
}
