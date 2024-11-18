

import jakarta.servlet.ServletException;
import java.sql.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/pupdate")
public class pupdate extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String a = request.getParameter("pname");
		int b = Integer.parseInt(request.getParameter("quantity"));
		int c = Integer.parseInt(request.getParameter("prize"));
		String d = request.getParameter("img");
		PrintWriter pw = response.getWriter();
		response.setContentType("text/html");
		
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ecom","root","Maharajan45");
			Statement st = con.createStatement();
			st.executeUpdate("update products set product_quantity = "+b+" , product_prize = "+c+" , img = '"+d+"' where product_name = '"+a+"' " );
			response.sendRedirect("pselect.jsp");
		}
		catch(Exception e)
		{
			pw.println(e);
		}
	
	
	}

}
