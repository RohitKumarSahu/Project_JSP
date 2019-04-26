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
 * Servlet implementation class Feedback
 */
@WebServlet("/Feedback")
public class Feedback extends HttpServlet {
	private static final long serialVersionUID = 1L;
public static int d=0;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException 
	{
		//LoginDao1 ld=new LoginDao1();
		//String notify1=ld.feedbackAll();
		
		//request.setAttribute(notify1, notify1);
		//RequestDispatcher dispatcher = request.getRequestDispatcher("Admin_Dashboard.jsp");
		/*if(dispatcher!=null)
		{
			dispatcher.forward(request, response);
		}*/
		
		d=1;
		PrintWriter out=response.getWriter();
		out.println("<script src='https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.11.4/sweetalert2.all.js'></script>");
		out.println("<script src='https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>");
		out.println("<script>");
		out.println("$(document).ready(function(){");
		out.println("swal ( 'Feedback' ,  'Feedback sent successfully!!!' ,  'success' );");
		out.println("});");
		out.println("</script>");
		RequestDispatcher rd = request.getRequestDispatcher("Admin_Dashboard.jsp");
		rd.include(request, response);
		
		
	}

}
