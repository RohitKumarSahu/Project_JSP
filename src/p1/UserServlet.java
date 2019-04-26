package p1;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/UserServlet")
public class UserServlet extends HttpServlet {
	static int f=0;
	private static final long serialVersionUID = 1L;
	@SuppressWarnings("unused")
	protected void doPost(HttpServletRequest req,
			HttpServletResponse res) 
			throws ServletException, IOException 
			{
			res.setContentType("text/html");
			PrintWriter out=res.getWriter();
			String name=req.getParameter("na");
			//String password=req.getParameter("pass");
			//Login dobj=new Login(1,name,password);	
			//Login dobj=new Login(1,name,password);
			//Login obj=CredDao.save(dobj);
			//int f=0;
            //System.out.println(obj.getName()+" "+obj.getPassword());
			HttpSession session=req.getSession(false);
			//String b=(String) session.getAttribute("minhost");
			//session.setAttribute("na",name);
			//session.invalidate();
			Object c=session.getAttribute("min");
			
			if(c!=null)
			{
				try{


					Login s=CredDao.update();
					Login d=CredDao.stat();
					//System.out.println("Select Operation "+d.getStatus());
					if(s.getStatus()==1 && f==0)
					{
						
						Login w=CredDao.transfer();
						if(w.getStatus()==1)
						{
							f=1;
							out.println("<script src='https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.11.4/sweetalert2.all.js'></script>");
							out.println("<script src='https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>");
							out.println("<script>");
							out.println("$(document).ready(function(){");
							out.println("swal ( 'Attendance' ,  'You have been marked Present!' ,  'success' );");
							out.println("});");
							out.println("</script>");
							RequestDispatcher rd = req.getRequestDispatcher("User_Dash.jsp");
							rd.include(req, res);
						}
						
						
					}
					
					if(d.getStatus()==1 && f==1)
					{
						out.println("<script src='Sweet_JS/sweetalert2.js'></script>");
						out.println("<script src='https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>");
						out.println("<script>");
						out.println("$(document).ready(function(){");
						out.println("swal ( 'Attendance' ,  'You have already been marked as Present!' ,  'error' );");
						out.println("});");
						out.println("</script>");
						RequestDispatcher rd = req.getRequestDispatcher("User_Dash.jsp");
						rd.include(req, res);
					}
					
				//req.getRequestDispatcher("index2.html").include(req, res);
				}
			
			
			
			catch(Exception e)
			{
				out.println("Error");
			}
			}
			else
			{
				out.println("<script src='Sweet_JS/sweetalert2.js'></script>");
				out.println("<script src='https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>");
				out.println("<script>");
				out.println("$(document).ready(function(){");
				out.println("swal ( 'Error' ,  'The session has either expired or not yet started' ,  'error' );");
				out.println("});");
				out.println("</script>");
				RequestDispatcher rd = req.getRequestDispatcher("User_Dash.jsp");
				rd.include(req, res);
			}
	}

}




