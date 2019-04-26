package p1;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class Start_Session
 */
@WebServlet("/Start_Session")
public class Start_Session extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@SuppressWarnings("unused")
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		String tim=request.getParameter("minhost");
		//System.out.println(tim);
		HttpSession session=request.getSession();  
		session.setMaxInactiveInterval(Integer.parseInt(tim));
		//String a="";
        session.setAttribute("min",123); 
        //String b=(String) session.getAttribute("minhost");
		Object b=session.getAttribute("min");
        //System.out.println(b);
        if(b!=null)
        {
        	out.println("<script src='https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.11.4/sweetalert2.all.js'></script>");
			out.println("<script src='https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>");
			out.println("<script>");
			out.println("$(document).ready(function(){");
			out.println("swal ( 'Session' ,  'Session Hosted!!' ,  'success' );");
			out.println("});");
			out.println("</script>");
        	RequestDispatcher rd = request.getRequestDispatcher("Admin_Dashboard.jsp");
        	rd.include(request, response);
        }
        else
        {
        	//  session.invalidate();
        	
        	out.println("<script src='Sweet_JS/sweetalert2.js'></script>");
			out.println("<script src='https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>");
			out.println("<script>");
			out.println("$(document).ready(function(){");
			out.println("swal ( 'Session' ,  'Session Expired!' ,  'error' );");
			out.println("});");
			out.println("</script>");
        	RequestDispatcher rd = request.getRequestDispatcher("Admin_Dashboard.jsp");
        	rd.include(request, response);
        }
		
		
	}

}
