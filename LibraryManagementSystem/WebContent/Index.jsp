<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Search Details</title>

<link href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script src="http://code.jquery.com/jquery-1.11.1.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

 <style>
        header{
            background-color: #696969;
            height: 2em;
            font-size: 3em;
            color: #fff;
            font-weight: 800
        }

        nav {
            background-color:	#778899;
            color: #fff;
            padding: 0%;
        }

        nav ul {
            padding: 0;
            list-style: none;
        }

        nav li {
            display: inline;
        }

        nav a {
            color: #fff;
            text-decoration: none;
            font-size: 18px;
            padding-right: 15px;
        }

        nav a:hover {
            color:#E3AE57;
            text-decoration: none;
        }
    </style>
  


</head>
<body>

<div class="container">
        <header><center>Library Management System</center></header>
        <nav>
            <ul>
             
                <li>
                    <a href="UserController?process=create">Create</a>
                </li>
                <li>
                    <a href="UserController?process=modify">Modify</a>
                </li>
                <li>
                    <a href="UserController?process=delete">delete</a>
                </li>
                   <li>
                    <a href="UserController?process=view">View</a>
                </li>
            </ul>
        </nav>
 </div>
 
 	<div class="col-sm-9 main backgroundImage">
				<c:if test="${ operation == 'insert_operation'}">
					<%@ include file="SearchMember.jsp"%>
				</c:if>				
				<c:if test="${ operation == 'delete_operation'}">
					<%@ include file="SearchMember.jsp"%>
				</c:if>
				<c:if test="${ operation == 'modify_operation'}">
					<%@ include file="SearchMember.jsp"%>
				</c:if>
				<c:if test="${ operation == 'view_operation'}">
					<%@ include file="SearchMember.jsp"%>
				</c:if>
				<c:if test="${ operation == 'displaygrid'}">
					<%@ include file="SearchMember.jsp"%>
				</c:if>
				<c:if test="${ operation == 'update_operation'}">
					<%@ include file="SearchMember.jsp"%>
				</c:if>
				<c:if test="${ createresult == 'true'}">
					<h1>Member added Successfully <c:out value="${ 'uname' }" ></c:out></h1>
				</c:if>
				<c:if test="${ createresult == 'false'}">
					<h1>Member can't be added</h1>
				</c:if>
				<c:if test="${ updateresult == 'true'}"> 
					<h1>Member Details updated Successfully <c:out value="${ 'uname' }" ></c:out></h1>
				</c:if>
				<c:if test="${ updateresult == 'false'}">
					<h1>Member can't be updated</h1>
				</c:if>
					<c:if test="${ deleteresult == 'true'}">
					<h1>Member deleted Successfully <c:out value="${ 'uname' }" ></c:out></h1>
				</c:if>
				<c:if test="${ deleteresult == 'false'}">
					<h1>Member can't be deleted</h1>
				</c:if>
				
	</div>
</body>
</html>
