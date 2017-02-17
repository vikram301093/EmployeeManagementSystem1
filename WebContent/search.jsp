<%@page import="java.lang.ProcessBuilder.Redirect"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dto.Employee"%>
<%@page import="dao.EmployeeDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<% 
String firstname = request.getParameter("firstName");
String lastname = request.getParameter("lastName");

 EmployeeDao dao = new EmployeeDao();
 
 
	 Employee emp=dao.searchEmployee(firstname, lastname);
	 if(emp.getFirstName()!=null && emp.getLastName()!=null){
			
		 
	 }
	 else{
		 out.println("<script type=\"text/javascript\">");
		 out.println("alert('Enter correct firstname and lastname');");
		 out.println("location='HomePage.jsp';");
		 out.println("</script>");
	 } 
 
%> 
    

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="mystyle.css">
<link rel="stylesheet" type="text/css" href="mySearch.css">
<style>
table {
    font-family: arial, sans-serif;
    border-collapse: collapse;
    width: 100%;
}

td, th {
    border: 1px solid #dddddd;
    text-align: left;
    padding: 8px;
}

tr:nth-child(even) {
    background-color: #dddddd;
}
</style>
<script type="text/javascript">
window.onbeforeunload = function (event) {
	  var message = 'Sure you want to leave?';
	  if (typeof event == 'undefined') {
	    event = window.event;
	  }
	  if (event) {
	    event.returnValue = message;
	  }
	  return message;
	}
function validateForm() {
	var firstname = document.forms["EmploymentApplication"]["firstName"].value;
	var lastname=document.forms["EmploymentApplication"]["lastName"].value;
	var contactno = document.forms["EmploymentApplication"]["contactNo"].value;
	var empid = document.forms["EmploymentApplication"]["empId"].value;
	var percentage = document.forms["EmploymentApplication"]["percentage"].value;
	var regexp = /^[a-zA-Z]+$/; 
	var regexp1 =/^[0-9]+$/;
	var regexp2 =/^[a-zA-Z0-9]+$/;
	if(!firstname.match(regexp))
	{
		alert('Please Enter alphabets only.'); 
	return false; 
	}
	else if(!lastname.match(regexp))
	{
		alert('Please Enter alphabets only.'); 
	return false; 
	}
	else if(!contactno.match(regexp1))
	{
		alert('Please Enter numbers only.'); 
	return false; 
	}
	else if(!percentage.match(regexp1))
	{
		alert('Please Enter percentage only.'); 
	return false; 
	}
	else
		{
		return true;
		}
	
	
}
</script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<div style="width:100%;">
<center><h1>Employee Management System</h1></center>
<div class="container" style="float:left; width:50%; margin-left:150px;">  
 <form id="EmploymentApplication" action="update.jsp" method="post" onsubmit="return validateForm()">
    <h3>EMPLOYEE FORM</h3>
  
    <fieldset>
      <input placeholder="First Name" name="firstName" type="text" value="<%=emp.getFirstName()%>" tabindex="1" required autofocus>
    </fieldset>
    <fieldset>
      <input placeholder="Last Name" name="lastName" type="text" value = "<%=emp.getLastName()%>" tabindex="2" required>
    </fieldset>
     <fieldset>
      <input placeholder="Employee ID" name="empId" type="text" value="<%=emp.getEmpId()%>" readonly="true" tabindex="3" required>
    </fieldset>
    <fieldset>
      <input placeholder="Date of Birth" name="DOB" type="date" value="<%=emp.getDOB()%>" tabindex="4" required>
    </fieldset>
    <fieldset>
      <input placeholder="Mobile No" name="contactNo" type="tel" value="<%=emp.getContactNo()%>" tabindex="5" maxlength="10" required>
    </fieldset>
    <fieldset>
      <input placeholder="Position you are applying for" name="position" type="text" value="<%=emp.getPosition() %>" tabindex="6" required>
    </fieldset>
     <fieldset>
      <input placeholder="Highest Certificate Name" name="certificateName" type="text" value="<%=emp.getCertificateName() %>" tabindex="7" required>
    </fieldset>
    <fieldset>
      <input placeholder="Percentage " name="percentage" type="text"  maxlength="2" value="<%=emp.getPercentage() %>" tabindex="8" required>
    </fieldset>
    <fieldset>
      <textarea placeholder="Address" name="address" tabindex="9" required><%=emp.getAddress()%></textarea>
    </fieldset>
    <fieldset>
  
      <button name="submit" type="submit" id="contact-submit" data-submit="...Sending">Update</button>
    </fieldset>
  </form>
</div>

<div class="container" style="float:right; width:50%; margin-right:600px;">
<div style="float:right; margin-right:150px;">
<form id="EmploymentApplication" action="search.jsp" method="get" onsubmit="return validateForm()">
<input class="tftextinput" maxlength="120" name="firstName" size="21" type="text" placeholder="FirstName"/>
<input class="tftextinput" maxlength="120" name="lastName" size="21" type="text" placeholder="LastName"/>
<button class="submit" type="submit" name="submit" id="contact-submit" data-submit="...Sending">Search</button>
</div>

<div style="float:right; width:100%; margin-right:150px;">
<table>

<tr><th>FirstName</th><th>LastName</th><th>Employee Id</th><th>DOB</th><th>Position you are applying for</th><th>Highest Certificate Name</th><th>Percentage of the highest certification</th><th>Contact No</th><th>Address of the Employee</th></tr>
<tbody>


     <tr align="center" >
      <td><%=emp.getFirstName()%></td>
      <td><%=emp.getLastName()%></td>
      <td><%=emp.getEmpId()%></td>
      <td><%=emp.getDOB()%></td>
      <td><%=emp.getPosition()%></td>
      <td><%=emp.getCertificateName()%></td>
      <td> <%=emp.getPercentage()%></td>
      <td> <%=emp.getContactNo()%></td>
      <td> <%=emp.getAddress()%></td>
     </tr>
    
</tbody>
</table>
</div>
</div>
</div>

</body>
</html> 