<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Member Details</title>

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

 <div class="col-sm-9 "  style="padding-left: 20%;">		
			<c:if test="${ process == 'create' }">

 <h1 class="well">Registration Form</h1>
        <div class="col-sm-12 well">
            <div class="row">
                <form name="registration" action="UserController" method="post">
        
                <input type="hidden" id="thisField" name="process" value="insert_operation">
			
                    <div class="col-sm-12">
                        <div class="row">
                           
                           
                             <div class="col-sm-6 form-group">
                                <label>Member Id</label>
                                <input type="text" id="memberid" name="member"  class="form-control" readonly>
                            </div>
                            <div class="col-sm-6 form-group">
                                <label>Book Issued</label>
                                <input type="text" id="lastnameid" name="bookissued"  class="form-control" readonly>
                                
                            </div>
                            
                            <div class="col-sm-6 form-group">
                                <label>First Name</label>
                                <input type="text" id="firstnameid" name="firstname" placeholder="Enter First Name" class="form-control" required>
                            </div>
                            <div class="col-sm-6 form-group">
                                <label>Last Name</label>
                                <input type="text" id="lastnameid" name="lastname" placeholder="Enter Last Name" class="form-control" required>
                                
                            </div>
                        
                      
                        <div class="col-sm-6 form-group">
                                <label>DOB</label>
                                <input type="date" id="dateid" name="dob" placeholder="Date Of Birth" class="form-control" required>
                            </div>
                       
                   
                           
                          <div class="col-sm-6 form-group">  
                                <label>Zip</label>
                                <input type="number" id="zipid" name="zipcode" placeholder="Enter Zip Code" class="form-control" required >
                             </div>
                   
                   
                   
                     <div class="form-group">
                         <label>Address</label>
                            <textarea placeholder="Enter Address" name="address" id="addressid" rows="3" class="form-control" required></textarea>
                        </div>
                        
                     
                       <div class="col-sm-6 form-group">  
                             <label>City</label>
                <select id="city"class="col-sm-3form-group" name="city" class="dropdown-menu" required  >
       
                    <option value=0>select City</option>  
                    <option value=1>INDORE</option>
                    <option value=2>PUNE</option>
                    <option value=3>MUMBAI</option>
                 </select>
                  </div> 
                        
                        
                        
                        
                         <div class="col-sm-6 form-group">  
                             <label>State</label>
                <select id="state"class="col-sm-3form-group" name="state"  class="dropdown-menu" required  >
       
                    <option value=0>select State</option> <br>   
                    <option value=1>Madhya Pradesh</option><br>
                        <option value=2>Maharashtra</option><br>
                        <option value=3>Rajasthan</option><br>
                      </select>
                  </div>
                       
                           
         
                        <div class="form-group">
                            <label>Phone Number</label>
                            <input type="number" id="phoneid" name="phonenumber" placeholder="Enter Phone Number" class="form-control">
                        </div>
                        
                        <div class="form-group">
                            <label>Email Address</label>
                            <input type="email" id="emailid" name="email" placeholder="Enter Email Address" class="form-control">
                            <br><br>
     
               
          <input   type="submit" value="Submit"  / >
          
             <input type="reset" value="reset"/ >
                      
                      
                        </div>
                         <input type="hidden" name="submitAction" value="submitted" /> <br /><br>
						</div>            
                    </div>
                </form>
            </div>
        </div>
  

 </c:if>
 
  <c:if test="${ createresult == 'true' }">
 <center><h2>Member Added Successfully
 <c:out value="${uname}"/></h2></center>
 </c:if>

  <c:if test="${ createresult == 'false' }">
 <center><h2> Member can't be added </h2>
 </center>
 </c:if>
 
 <c:if test="${ deleteresult == 'true' }">
 <center><h2>Member disabled Successfully </h2>
</center>
 </c:if>
 
 <c:if test="${ deleteresult == 'false' }">
 <center><h2> Member can't be disabled </h2> 
</center>
 </c:if>
 
  <c:if test="${ updateresult == 'true' }">
 <center><h2>Member updated Successfully </h2>
</center>
 </c:if>
 
 <c:if test="${ updateresult == 'false' }">
 <center><h2> Member can't be updated </h2>
</center>
 </c:if>

</body>
</html>
