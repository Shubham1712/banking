package com.zensar.lms.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.NamingException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import com.zensar.lms.entity.UserManagementEntity;
import com.zensar.lms.processor.UserProcessorimpl;


@WebServlet("/UserController")
public class UserController extends HttpServlet 
{
	private static final long serialVersionUID = 1L;
     public  static Logger logger = Logger.getLogger(UserController.class);
    
    public UserController() 
    {
        super();
        logger.debug("in user Controller");
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		logger.debug("in get method");
		String action= request.getParameter("process");
	
		RequestDispatcher rd=null;
		
		if(action.equalsIgnoreCase("create"))
		{
			logger.debug("checking action if create");
			
					request.setAttribute("operation", "insert_operation");
					request.setAttribute("process", "insert");
					rd= request.getRequestDispatcher("Index.jsp");
					rd.forward(request, response);
		}
			
		

		if(action.equalsIgnoreCase("modify"))
		{
			logger.debug("checking action if modify");	
			
					request.setAttribute("process", "search");
					request.setAttribute("operation", "modify_operation");
					rd= request.getRequestDispatcher("Index.jsp");
					rd.forward(request, response);
		}
		
		
		if(action.equalsIgnoreCase("view"))
		{
			logger.debug("checking action if view");
					
					request.setAttribute("operation", "view_operation");
					rd= request.getRequestDispatcher("Index.jsp");
					rd.forward(request, response);
					
		}
		
		if(action.equalsIgnoreCase("delete"))
		{
			logger.debug("checking action if delete");		
			
					request.setAttribute("process", "search");
					request.setAttribute("operation", "delete_operation");
					rd= request.getRequestDispatcher("Index.jsp");
					rd.forward(request, response);
		}
		
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		
		logger.debug("in do post method of controller");
		
		String action= request.getParameter("process");
	
		List<List<String>> memberData = new ArrayList<>();
		UserManagementEntity member= new UserManagementEntity();
		UserProcessorimpl processor= new UserProcessorimpl();
		boolean result=false;
		RequestDispatcher rd=null;

		if(action.equalsIgnoreCase("insert_operation"))
		{			
			logger.debug("checking action if insert_operation");					
					
					member.setFirst_name(request.getParameter("firstname"));
					member.setLast_name(request.getParameter("lastname"));
					member.setDob(request.getParameter("dob"));
					member.setAddress(request.getParameter("address"));
					member.setCity(Integer.parseInt(request.getParameter("city")));
					member.setState(Integer.parseInt(request.getParameter("state")));
					member.setZipcode(Integer.parseInt(request.getParameter("zipcode")));
					member.setPhone_number(Integer.parseInt(request.getParameter("phonenumber")));
					member.setEmail(request.getParameter("email"));		
					
					
					try {
						result= processor.createMember(member);
					} catch (Exception e) {
						logger.error("Exception :: ",e);
						e.printStackTrace();
					}
					
					if(result==true)
					{
						request.setAttribute("createresult", "true");	
						request.setAttribute("uname", member.getFirst_name());
					}
					else
					{
						request.setAttribute("createresult", "false");			
					}
					
					rd= request.getRequestDispatcher("Index.jsp");
					rd.forward(request, response);
		}
		
		
		if(action.equalsIgnoreCase("modify_operation") ||  action.equalsIgnoreCase("delete_operation"))
		{
			
			logger.debug("checking action if view_operation or modify_operation or delete_operation  ");					
			
			String membername= request.getParameter("membername");
						try 
						{
							memberData = processor.getMemberData(membername);
						} catch (Exception e) 
						{
							logger.error("Exception :: ",e);
							e.printStackTrace();
						}
						
						if(memberData.get(1).get(2) != null)
						{
							request.setAttribute("membername", membername);
							request.setAttribute("process", "search");
							request.setAttribute("operation", "displaygrid");
							request.setAttribute("oper", action);
							request.setAttribute("memberData", memberData);
							
						}
						else
						{
							request.setAttribute("listresult", "false");	
							request.setAttribute("process", "search");
						}
						
						rd = request.getRequestDispatcher("Index.jsp");
						rd.forward(request, response);
		}	
		
		if(action.equalsIgnoreCase("modifyDetail"))
		{
			logger.debug("checking action if show detail ");			
			
			int memberid = Integer.parseInt(request.getParameter("id"));
					try 
					{
						member = processor.getMemberObject(memberid);
					} catch (Exception e) 
					{
						logger.error("Exception :: ",e);
						e.printStackTrace();
					}
					if(!(member.getFirst_name()==null))
					{
						request.setAttribute("memberObject", member);
						request.setAttribute("operation", "update_operation");
								
					}
					rd = request.getRequestDispatcher("Index.jsp");
					rd.forward(request, response);
		}
		
		if(action.equalsIgnoreCase("update"))
		{
			logger.debug("checking action update ");		
			
					member.setMemberid(Integer.parseInt(request.getParameter("memberid")));
					member.setFirst_name(request.getParameter("firstname"));
					member.setLast_name(request.getParameter("lastname"));
					member.setDob(request.getParameter("dob"));
					member.setAddress(request.getParameter("address"));
					member.setCity(Integer.parseInt(request.getParameter("city")));
					member.setState(Integer.parseInt(request.getParameter("state")));
					member.setZipcode(Integer.parseInt(request.getParameter("zipcode")));
					member.setPhone_number(Integer.parseInt(request.getParameter("phonenumber")));
					member.setEmail(request.getParameter("email"));	
					
					
					try {
						result= processor.updateMember(member);
					} catch (Exception e) 
					{
						logger.error("Exception :: ",e);
						e.printStackTrace();
					}
					
					if(result==true)
					{
						request.setAttribute("updateresult", "true");	
						request.setAttribute("uname", member.getFirst_name());
					}
					else
					{
						request.setAttribute("updateresult", "false");			
					}
					
					rd= request.getRequestDispatcher("Index.jsp");
					rd.forward(request, response);

		}
		
		if(action.equalsIgnoreCase("deleteDetail"))
		{
			logger.debug("checking action if deletedetail ");				
			
			int memberid = Integer.parseInt(request.getParameter("id"));
					boolean n= false;
					try {
						n= processor.deleteMember(memberid);
					} catch (Exception e) 
					{
						logger.error("Exception :: ",e);
						e.printStackTrace();
					}
					if(n)
					{
						request.setAttribute("deleteresult", "true");

					}
					else
					{
						request.setAttribute("deleteresult", "false");

					}
					rd= request.getRequestDispatcher("Index.jsp");
					rd.forward(request, response);
		}			
		
	}

}
