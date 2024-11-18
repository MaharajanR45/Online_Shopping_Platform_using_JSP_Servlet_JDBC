<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import = "java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Confirm Order</title>
</head>
<body>
<% 
String a = request.getParameter("pname");
int b = Integer.parseInt(request.getParameter("quantity"));
try
{
	Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ecom","root","Maharajan45");
	Statement st = con.createStatement();
	ResultSet rs = st.executeQuery("select * from products where product_name = '"+a+"' ");
	while(rs.next())
	{%>
    <form action = "Order1" method="post">
	Product Name<input type="text" name="pname" value="<%=rs.getString(1) %>" readonly><br>
	<input type="hidden" name="quantity" value="<%=b %>" >
	<% int c = b* rs.getInt(3); %>
	Prize<input type = "number" name = "prize" value = "<%=c %>"><br>
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