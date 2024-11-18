

import jakarta.servlet.ServletException;
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

/**
 * Servlet implementation class Cart
 */
@WebServlet("/Cart")
public class Cart extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession s=request.getSession();
		String a= s.getAttribute("user").toString();
		String b = request.getParameter("productname");
		int c = Integer.parseInt(request.getParameter("quantity"));
		int d = Integer.parseInt(request.getParameter("prize"));
		PrintWriter pw = response.getWriter();
		response.setContentType("text/html");
		
		d = d*c;
		
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ecom","root","Maharajan45");
			Statement st = con.createStatement();
			st.executeUpdate("insert into cart values('"+a+"', '"+b+"' , "+c+" , "+d+" ) ");
			response.sendRedirect("MyCart.jsp");
		}
		catch(Exception e)
		{
			pw.println(e);
		}
	
		
	}

}
