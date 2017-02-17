
<%@page import="java.sql.Date"%>
<%@page import="dao.EmployeeDao"%>
<jsp:useBean id="e" class="dto.Employee"></jsp:useBean>
<jsp:setProperty name="e" property="*"></jsp:setProperty>
<%
 EmployeeDao dao = new EmployeeDao();
 dao.insert(e);
 response.sendRedirect("HomePage.jsp");  
%>
