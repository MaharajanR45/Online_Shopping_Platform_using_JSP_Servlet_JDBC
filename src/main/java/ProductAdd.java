

import jakarta.servlet.ServletException;
import java.sql.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * Servlet implementation class ProductAdd
 */
@WebServlet("/ProductAdd")
public class ProductAdd extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String a = request.getParameter("m1");
		int b = Integer.parseInt(request.getParameter("m2"));
		int c = Integer.parseInt(request.getParameter("m3"));
		String d = request.getParameter("m4");
		PrintWriter pw = response.getWriter();
		
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ecom","root","Maharajan45");
			Statement st = con.createStatement();
			st.executeUpdate("insert into Products values ('"+a+"',"+b+","+c+",'"+d+"')");
			response.sendRedirect("pselect.jsp");
		}
		catch(Exception e)
		{
			pw.println(e);
		}
		
		
	}
}
