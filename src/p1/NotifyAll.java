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
 * Servlet implementation class NotifyAll
 */
@WebServlet("/NotifyAll")
public class NotifyAll extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	public static int s=0,q=0;
	public static String t="";
	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException 
	{
		// TODO Auto-generated method stub
		/*LoginDao1 ld=new LoginDao1();
		String notify=ld.notifAll();
		
		request.setAttribute(notify, notify);
		RequestDispatcher dispatcher = request.getRequestDispatcher("Admin_Dashboard.jsp");
		if(dispatcher!=null)
		{
			dispatcher.forward(request, response);
		}*/
		
		int e=User_Validation.ei;
		int A[]=LoginDao1.feedbackAll();
		System.out.println("EI:  "+e);
		for(int i=0;i<LoginDao1.j;i++)
		{
			//System.out.println("A = "+A[i]);
			if(A[i]==e)
			{
				q=1;
			}
		}
		
		//System.out.println("Q:" +q);
		
		//System.out.println("EII : "+ei);
		//request.setAttribute("sample",ei);
		/*int s=User_Validation.ei;
		t=Integer.toString(s);
		request.setAttribute("sample",t);*/
		PrintWriter out=response.getWriter();
		out.println("<script src='https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.11.4/sweetalert2.all.js'></script>");
		out.println("<script src='https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>");
		out.println("<script>");
		out.println("$(document).ready(function(){");
		out.println("swal ( 'Notification' ,  'Notification Sent Successfully !' ,  'success' );");
		out.println("});");
		out.println("</script>");
		RequestDispatcher rd = request.getRequestDispatcher("Admin_Dashboard.jsp");
		rd.include(request, response);
	}

}
