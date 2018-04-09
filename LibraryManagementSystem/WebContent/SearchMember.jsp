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

</head>
<body>

<div class="container">
	       
	<div class="col-sm-9 ">	
		<c:if test="${ process == 'search' }">
			<form action="UserController" method="post">
			 <div class="col-sm-12 well">
					<div class="row">
							<div class="col-md-4 col-md-offset-4">
							<label>Enter member name:</label>
							<input type="text" name="membername" value="${membername }" placeholder="Enter member name" class="form-control" required ><br>
							</div>
					</div>
					<div class="row">	
							<div class="col-md-4 col-md-offset-4">
									<input type="Submit" value="Submit">
									<input type="reset" value="Reset">
							</div>
					</div>
			                <input type="hidden" id="thisField" name="process" value="${operation}">
			    </div>
				<br><br>
			</form>
		</c:if>


<c:if test="${ process == 'insert' }">
 <div class="col-sm-9 "  style="padding-left: 20%;">		

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
  </div>

 </c:if>




	<c:if test="${ operation == 'displaygrid' }">
  		
  		<script type="text/javascript">
	
			function submitForm(id){
			alert("form will be submitted !!!! "+id);
			document.displayDetailForm.method = "POST";
		
			<%if(request.getAttribute("oper").equals("delete_operation")){%>
				document.displayDetailForm.action="UserController?process=deleteDetail&id="+id;

			<%}%>
			<%if(request.getAttribute("oper").equals("modify_operation")){%>
			document.displayDetailForm.action="UserController?process=modifyDetail&id="+id;

			<%}%>
			document.displayDetailForm.submit();
			alert("Done !!! ");
			}
	
		</script>
  
   		<div class="col-sm-6">
		  	<form name="displayDetailForm">
			<center>
			<table border="1">
			
					<c:forEach items="${memberData}" var="row">
						<tr>
							<c:forEach items="${row}" var="colData"  varStatus="loop">
								<td>
								<c:choose>
								   <c:when test="${loop.index == '0'}">
								   		<a href="javascript:submitForm(${colData})" ><c:out value="${colData}" /></a>
								   </c:when> 
								   <c:otherwise>
								   	<c:out value="${colData}" />
								   </c:otherwise>
								</c:choose>
								</td>
							</c:forEach>
						</tr>
					</c:forEach>
				</table>
				
				</center>
			</form>
		 </div>
	  	
 	</c:if>

		<c:if test="${ operation == 'displaygrid1' }">
				
   
		  <form name="displayDetailForm">
			<center>
				<table border="1">
					<c:forEach items="${memberData}" var="row">
						<tr>
							<c:forEach items="${row}" var="colData"  varStatus="loop">
								<td>
								   	<c:out value="${colData}" />
								</td>
							</c:forEach>
						</tr>
					</c:forEach>
				</table>
			</center>
			</form>			
		
		</c:if>
	
 	</div>

 <div class="col-sm-9 ">
 
	 	 <c:if test="${ operation == 'update_operation' }">	 	 
			 	  
		 	<h1 class="well">Updation Form</h1>
		        <div class="col-lg-12 well">
		            <div class="row">
		                <form name="registration" action="UserController" method="post">
		                
		                	 <input type="hidden" id="thisField" name="process" value="update">
					
		                    <div class="col-sm-12">
		                        <div class="row">
		                           
		                            
		                             <div class="col-sm-6 form-group">
		                                <label>Member Id</label>
		                                <input type="text" id="memberid" name="memberid" value="${ not empty memberObject.memberid ? memberObject.memberid: '' }"  class="form-control" readonly>
		                            </div>
		                            <div class="col-sm-6 form-group">
		                                <label>Book Issued</label>
		                                <input type="text" id="lastnameid" name="bookissued"  value="${ not empty memberObject.isbookissued ? memberObject.isbookissued: '' }" class="form-control" readonly>
		                                
		                            </div>
		                            
		                            <div class="col-sm-6 form-group">
		                                <label>First Name</label>
		                                <input type="text" id="firstnameid" name="firstname" value="${ not empty memberObject.first_name ? memberObject.first_name: '' }" placeholder="Enter First Name" class="form-control" required>
		                            </div>
		                            <div class="col-sm-6 form-group">
		                                <label>Last Name</label>
		                                <input type="text" id="lastnameid" name="lastname" value="${ not empty memberObject.last_name ? memberObject.last_name: '' }" placeholder="Enter Last Name" class="form-control" required>
		                                
		                            </div>
		                        
		                      
		                        <div class="col-sm-6 form-group">
		                                <label>DOB</label>
		                                <input type="date" id="dateid" name="dob" value="${ not empty memberObject.dob ? memberObject.dob: '' }" placeholder="Date Of Birth" class="form-control" required>
		                            </div>
		                       
		                   
		                           
		                          <div class="col-sm-6 form-group">  
		                                <label>Zip</label>
		                                <input type="number" id="zipid" name="zipcode" value="${ not empty memberObject.zipcode ? memberObject.zipcode: '' }" placeholder="Enter Zip Code" class="form-control" >
		                             </div>
		                   
		                   
		                   
		                     <div class="form-group">
		                         <label>Address</label>
		                            <textarea placeholder="Enter Address" name="address" value="${ not empty memberObject.address ? memberObject.address: '' }" id="addressid" rows="3" class="form-control" required></textarea>
		                        </div>
		                       
		                           
		                         
		                         <div class="col-sm-6 form-group">  
		                             <label>City</label>
		                <select id="city"class="col-sm-3form-group" name="city" value="${ not empty memberObject.city ? memberObject.city: '' }" class="dropdown-menu"   >
		       
		                    <option value=0>select City</option> <br>   
		                    <option value=1>INDORE</option><br>
		                        <option value=2>PUNE</option><br>
		                        <option value=3>MUMBAI</option><br>
		                      </select>
		                  </div>
		                           
		                           
		                          <div class="col-sm-6 form-group">  
		                             <label>State</label>
		                <select id="state"class="col-sm-3form-group" name="state" value="${ not empty memberObject.state ? memberObject.state: '' }"  class="dropdown-menu"   >
		       
		                    <option value=0>select State</option> <br>   
		                    <option value=1>Madhya Pradesh</option><br>
		                        <option value=2>Maharashtra</option><br>
		                        <option value=3>Rajasthan</option><br>
		                      </select><br><br>
		                  </div>
		   
		                       
		                        <div class="form-group">
		                            <label>Phone Number</label>
		                            <input type="number" id="phoneid" name="phonenumber" value="${ not empty memberObject.phone_number ? memberObject.phone_number: '' }" placeholder="Enter Phone Number" class="form-control">
		                        </div>
		                        
		                        <div class="form-group">
		                            <label>Email Address</label>
		                            <input type="email" id="emailid" name="email" value="${ not empty memberObject.email ? memberObject.email: '' }" placeholder="Enter Email Address" class="form-control">
		                            <br><br>
		     
		               
		          				<input   type="submit" value="Update"  / >
		          
		             			<input type="reset" value="reset"/ >
		                      
		                        </div>
		</div>
		</div>
		</form>
		</div>
		</div>
		</c:if>
		</div>
		</div>

		            
 <c:if test="${ listresult == 'false' }">
 <center><h2>No record Found </h2>
</center>
 </c:if>
 

</body>
</html>