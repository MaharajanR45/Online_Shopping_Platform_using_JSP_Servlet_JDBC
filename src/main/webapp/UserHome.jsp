<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User HomePage</title>
<style>
.greeting{
display: inline;
}
.username{
display:inline;
color:red;
}
a{
font-size:22px;
text-decoration:none;
float:right;
margin:10px;
}
.parent{
margin:30px;
display:grid;
grid-template-columns: repeat(3,1fr);
gap:40px;
}
img{
padding-top:10px;
}
.child{
		display:flex;
		flex-direction:column;
		border:1px solid black;
		width:100%;
		height:auto;
		text-align:center;
		align-items:center;
}
.child:hover{
transform:scale(1.1);
}
.Add{
width:100px;
padding:8px 12px;
background-color:red;
color:white;
margin:20px;
border-radius:30px;
border:1px solid red;
transition:0.3s;
}
.Add:hover
{
transform:scale(1.5);
}
</style>
</head>
<body>
<h1 class= "greeting">Welcome </h1>
<h1 class="username"><% String a = session.getAttribute("user").toString(); out.println(a); %>!
<a href="MyCart.jsp">My Cart</a></h1>
<div class="parent">
<%
try
{
	Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ecom","root","Maharajan45");
	Statement st = con.createStatement();
	ResultSet rs = st.executeQuery("Select * from products");
	while(rs.next())
	{%>
	<div class="child">
	<form action="Cart.jsp" method="post">
	<input type = "text" name = "Product Name" value = "<%=rs.getString(1) %>" style="display: none;" ><br>
		<h1><%=rs.getString(1) %></h1>
		<h2>&#8377 <%=rs.getInt(3) %></h2>
		<img src=<%=rs.getString(4) %> width="100px" height="300px"><br>
		<input type="submit" value="Add to Cart" class="Add" class="Add" name = "cart">
	</form>
	</div>
	<%}
}
catch(Exception e)
{
	out.println(e);
}
%>
</div>
</body>
</html>