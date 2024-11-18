

import jakarta.servlet.ServletException;
import java.sql.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;

/**
 * Servlet implementation class Register
 */
@WebServlet("/Register")
public class Register extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String a = request.getParameter("m1");
		String b = request.getParameter("m2");
		String c = request.getParameter("m3");
		
		PrintWriter pw = response.getWriter() ; 
		try
		{
			//mentioning the database
			Class.forName("com.mysql.jdbc.Driver");
			//Servlet and Mysql connection
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ecom","root","Maharajan45");
			//insertion query
			Statement st = con.createStatement();
			st.executeUpdate("insert into login values ('"+a+"','"+b+"','"+c+"')");
			pw.println("Registered Successfully");
		}
		catch(Exception e)
		{
			pw.println(e);
		}
		
	}

}
