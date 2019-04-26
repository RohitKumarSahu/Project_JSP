package p1;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Admin_Login
 */
@WebServlet("/Admin_Login")
public class Admin_Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		
		String us=request.getParameter("user");
		String pass=request.getParameter("password");
		
		
		AdminLogin a1=new AdminLogin(us,pass);
		AdminLogin a2=AdminLoginDao.save(a1);
		PrintWriter out=response.getWriter();
		
		if(a2.getUser().equals(us) && a2.getPassword().equals(pass))
		{
			out.println("<script src='https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.11.4/sweetalert2.all.js'></script>");
			out.println("<script src='https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>");
			out.println("<script>");
			out.println("$(document).ready(function(){");
			out.println("swal ( 'WELCOME' ,  'Login successfull !' ,  'success' );");
			out.println("});");
			out.println("</script>");
			
			RequestDispatcher rd = request.getRequestDispatcher("Admin_Dashboard.jsp");
			rd.include(request, response);
		}
		else
		{
			out.println("<script src='Sweet_JS/sweetalert2.js'></script>");
			out.println("<script src='https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>");
			out.println("<script>");
			out.println("$(document).ready(function(){");
			out.println("swal ( 'Error Login' ,  'incorrect id or password !' ,  'error' );");
			out.println("});");
			out.println("</script>");
			RequestDispatcher rd = request.getRequestDispatcher("Admin_Login.html");
			rd.include(request, response);
		}
		
		
		
		
	}

}
