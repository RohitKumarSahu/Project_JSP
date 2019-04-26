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
 * Servlet implementation class WarningServlet
 */
@WebServlet("/WarningServlet")
public class WarningServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		int id=User_Validation.ei;
		String name=User_Validation.name;
		String reason=request.getParameter("absent");
		PrintWriter out=response.getWriter();
		Warning w1=new Warning(id,name,reason);
		int stat=WarningDao.save(w1);
		if(stat==1)
		{
			out.println("<script src='https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.11.4/sweetalert2.all.js'></script>");
			out.println("<script src='https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>");
			out.println("<script>");
			out.println("$(document).ready(function(){");
			out.println("swal ( 'Absent' ,  'Absent Reason Sent Successfully!!' ,  'success' );");
			out.println("});");
			out.println("</script>");
			
			RequestDispatcher rd = request.getRequestDispatcher("User_Dash.jsp");
			rd.include(request, response);
		}
		
	}

}
