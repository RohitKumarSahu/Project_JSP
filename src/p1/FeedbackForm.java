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
 * Servlet implementation class FeedbackForm
 */
@WebServlet("/FeedbackForm")
public class FeedbackForm extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public static int e=0;
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		Feedback.d=0;
		e=1;
		int id=User_Validation.ei;
		String na=User_Validation.name;
		String fb=request.getParameter("fee");
		String ob=request.getParameter("obj");
		String pa=request.getParameter("part");
		String top=request.getParameter("topics");
		String tra=request.getParameter("train");
		String tre=request.getParameter("tr");
		PrintWriter out=response.getWriter();
		Feed f1=new Feed(id,na,ob,pa,top,tra,tre,fb);
		Feed f2=FeedbackSave.save(f1);
		out.println("<script src='https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.11.4/sweetalert2.all.js'></script>");
		out.println("<script src='https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>");
		out.println("<script>");
		out.println("$(document).ready(function(){");
		out.println("swal ( 'Feedback' ,  'Feedback sent successfully to the Admin!!!' ,  'success' );");
		out.println("});");
		out.println("</script>");
		RequestDispatcher rd = request.getRequestDispatcher("User_Dash.jsp");
		rd.include(request, response);
		
	}

}
