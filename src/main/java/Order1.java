

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
import java.sql.ResultSet;
import java.sql.Statement;

/**
 * Servlet implementation class Order1
 */
@WebServlet("/Order1")
public class Order1 extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String a = request.getParameter("pname");
		int b = Integer.parseInt(request.getParameter("quantity"));
		int c = Integer.parseInt(request.getParameter("prize"));
		HttpSession s=request.getSession();
		String f= s.getAttribute("user").toString();
		PrintWriter pw=response.getWriter();
		int d = 0;
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=
			DriverManager.getConnection("jdbc:mysql://localhost:3306/ecom","root","Maharajan45");
			Statement st=con.createStatement();
			ResultSet rs=st.executeQuery("select * from products where product_name='"+a+"'");
            while(rs.next())
            {
            	 d=rs.getInt(2);
            	
            }
            if(d>b)
            {
            	int e1=d-b;
            	st.executeUpdate("update products set product_quantity='"+e1+"' where product_name='"+a+"'");
            	st.executeUpdate("insert into orders values ('"+f+"','"+a+"',"+b+","+c+")");
            	st.executeUpdate("delete from cart where product_name='"+a+"'");
            	pw.println("Order Successful");
            }
		}			
		catch(Exception e)
		{
			pw.println(e);
		}

	}

}
