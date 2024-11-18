<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import = "java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add to Cart</title>
</head>
<body>
<% 
String a = request.getParameter("Product Name");

		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ecom","root","Maharajan45");
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery("select * from products where product_name = '"+a+"' ");
			while(rs.next())
			{%>
			<form action = "Cart" method = "post">
			Product Name <input type = "text" value = "<%=rs.getString(1) %>" name = "productname"><br>
			Quantity <input type = "number" value = "1" max="<%=rs.getInt(2) %>" min="1" name = "quantity"><br>
			Prize <input type = "number" value = "<%=rs.getInt(3)%>" name = "prize" readonly><br>
			<img src = "<%= rs.getString(4) %>">
			<input type="submit" value="Add to Cart">
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