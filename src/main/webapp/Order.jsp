<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Order</title>
</head>
<body>
<%
String a = request.getParameter("m1");
try
{
	Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ecom","root","Maharajan45");
	Statement st = con.createStatement();
	ResultSet rs = st.executeQuery("select * from cart where product_name = '"+a+"' ");
	while(rs.next())
	{%>
		<form action="OrderPage.jsp" method="post">
		Product Name<input type="text" name="pname" value="<%=rs.getString(2) %>" readonly><br>
		Quantity<input type="number" name="quantity" value="<%=rs.getInt(3) %>" ><br>
		<input type="submit">
		</form>
	<%}
	
}
catch(Exception e)
{
	out.println(e);
}
%>
</body>
</html>