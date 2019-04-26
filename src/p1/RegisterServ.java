package p1;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/RegisterServ")
public class RegisterServ extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		String fn=request.getParameter("fname");
		String ln=request.getParameter("lname");
		int eid=Integer.parseInt(request.getParameter("eid"));
		String em=request.getParameter("email");
		String pass=request.getParameter("password");
		
		Register r1=new Register(fn,ln,em,pass,eid);
		PrintWriter out=response.getWriter();
		int stat=RegisterDao.save(r1);
		
		if(stat==1)
		{
			out.println("<script src='https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.11.4/sweetalert2.all.js'></script>");
			out.println("<script src='https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>");
			out.println("<script>");
			out.println("$(document).ready(function(){");
			out.println("swal ( 'Register' ,  'Successfully Registered!!' ,  'success' );");
			out.println("});");
			out.println("</script>");
			RequestDispatcher rd = request.getRequestDispatcher("Login.html");
			rd.include(request, response);
		}
		else
		{
			out.println("<script src='Sweet_JS/sweetalert2.js'></script>");
			out.println("<script src='https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>");
			out.println("<script>");
			out.println("$(document).ready(function(){");
			out.println("swal ( 'Registration' ,  'Not able to save data!' ,  'error' );");
			out.println("});");
			out.println("</script>");
        	RequestDispatcher rd = request.getRequestDispatcher("Register.html");
        	rd.include(request, response);
		}
		
		
		
		
		
	}

}
