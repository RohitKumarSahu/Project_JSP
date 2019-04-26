package p1;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Notify
 */
@WebServlet("/Notify")
public class Notify extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException 
	{
		LoginDao1 ld=new LoginDao1();
		//String update= ld.deleteNotification();
		
		//request.setAttribute(update, update);
		RequestDispatcher dispatcher = request.getRequestDispatcher("/dash.jsp");
		if(dispatcher!=null)
		{
			dispatcher.forward(request, response);
		}
	}

}
