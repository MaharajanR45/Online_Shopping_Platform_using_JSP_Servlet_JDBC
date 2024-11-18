<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Product Delete</title>
</head>
<body>
<%
String a = request.getParameter("m1");

try
{
	Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ecom","root","Maharajan45");
	Statement st = con.createStatement();
	st.executeUpdate("delete from products where Product_Name = '"+a+"'");
	response.sendRedirect("pselect.jsp");
}
catch(Exception e)
{
	out.println(e);
}
%>
</body>
</html>