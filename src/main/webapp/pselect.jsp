<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import= "java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Products Detail</title>
</head>
<body>
<h1>Products</h1>
<table border="1">
<tr>
<th>Product Name</th>
<th>Product Quantity</th>
<th>Product Prize</th>
<th>Product Select</th>
<th>Product Update</th>
<th>Product Delete</th>
</tr>
<%
try
{
	Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ecom","root","Maharajan45");
	Statement st = con.createStatement();
	ResultSet rs = st.executeQuery("select * from products");
	while(rs.next())
	{%>
<tr>
<td><%= rs.getString(1) %></td>
<td><%= rs.getInt(2) %></td>
<td><%= rs.getInt(3) %></td>
<td><a href="pdselect.jsp?m1=<%=rs.getString(1) %>">Select</a></td>
<td><a href="pupdate.jsp?m1=<%=rs.getString(1) %>">Update</a></td>
<td><a href="pdelete.jsp?m1=<%=rs.getString(1) %>">Delete</a></td>
</tr>
		
	<%}
}
catch(Exception e)
{
	out.println(e);
}
%>
</table>

</body>
</html>