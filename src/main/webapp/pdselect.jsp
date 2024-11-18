<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Product Description</title>
</head>
<body>

<%
String a = request.getParameter("m1");
try
{
	Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ecom","root","Maharajan45");
	Statement st = con.createStatement();
	ResultSet rs = st.executeQuery("select * from products where Product_Name = '"+a+"' ");
	while(rs.next())
	{%>
       <h1>Product Name : <%= rs.getString(1) %></h1>
       <h1>Quantity : <%= rs.getInt(2) %></h1>
       <h1>Prize : &#8377 <%= rs.getInt(3) %></h1>
       <img src= <%= rs.getString(4) %>>

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