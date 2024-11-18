<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import = "java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="Style.css">
<title>My Cart</title>
</head>
<body>
<%
HttpSession s=request.getSession();
String a= s.getAttribute("user").toString();
%>
<h2><a href="UserHome.jsp" style="font-size:22px;text-decoration:none;float:right">Back to Home</a></h2>
<h2 class="username"><% out.println(a); %></h2><h2 class="greeting">, Here is Your Cart Details</h2>
<table border="1">
<tr>
<th>Product Name</th>
<th>Quantity</th>
<th>Amount</th>
<th>Order</th>
<th>Product Delete</th>
</tr>
<%
try
{
	Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ecom","root","Maharajan45");
	Statement st = con.createStatement();
	ResultSet rs = st.executeQuery("select * from cart where UserName = '"+a+"' ");
	while(rs.next())
	{%>
	<tr>
	<td><%=rs.getString(2) %> </td>
	<td><%=rs.getInt(3) %></td>
	<td><%=rs.getInt(4) %></td>
	<td><a href = "Order.jsp?m1=<%=rs.getString(2) %>">Order</a></td>
	<td><a href="CartDelete.jsp?m1=<%=rs.getString(2) %>">Delete</a></td>
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