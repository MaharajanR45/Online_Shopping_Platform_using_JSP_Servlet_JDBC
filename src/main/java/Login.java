

import jakarta.servlet.ServletException;

import java.sql.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;


@WebServlet("/Login")
public class Login extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String a = request.getParameter("m1");
		String b = request.getParameter("m2");
		
		PrintWriter pw = response.getWriter() ;
		
		if(a.equals("admin@gmail.com") && b.equals("password"))
		{
			response.sendRedirect("AdminHome.jsp");
		}
		else
		{
			try
			{
				//mentioning the database
				Class.forName("com.mysql.jdbc.Driver");
				//Servlet and Mysql connection
				Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ecom","root","Maharajan45");
				//select query
				Statement st = con.createStatement();
				//to fetch data we use resultset
				ResultSet rs = st.executeQuery("select * from login where Email = '"+a+"' and Password = '"+b+"' ");
				while(rs.next())
				{
					//Moves the parameter to every page we use session
					HttpSession h = request.getSession();
					h.setAttribute("user", rs.getString(1));
					
					response.sendRedirect("UserHome.jsp");
				}
				
				
			}
			catch(Exception e)
			{
				pw.println(e);
			}
		}
	}

}
