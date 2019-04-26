package p1;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class User_Validation
 */
@WebServlet("/User_Validation")
public class User_Validation extends HttpServlet {
	private static final long serialVersionUID = 1L;
       public static String name="";
       public static int ei=0;
	protected void doPost(HttpServletRequest req, 
			HttpServletResponse res) 
			throws ServletException, IOException 
			{
			res.setContentType("text/html");
			PrintWriter out=res.getWriter();
			name=req.getParameter("na");
			String password=req.getParameter("pass");
			ei=Integer.parseInt(req.getParameter("empid"));
			req.setAttribute("id", ei);
			//System.out.println("ID : "+req.getAttribute("id"));
			//Login dobj=new Login(1,name,password);	
			Login dobj=new Login(ei,name,password);
			Login obj=CredDao.save(dobj);
            //System.out.println(obj.getName()+" "+obj.getPassword());
			try{
				if(obj!=null)
				{
			if(ei==obj.getId() && password.equals(obj.getPassword()))
				{
				HttpSession session=req.getSession();  
		        session.setAttribute("na",name); 
				

				
				
		        out.println("<script src='https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.11.4/sweetalert2.all.js'></script>");
				out.println("<script src='https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>");
				out.println("<script>");
				out.println("$(document).ready(function(){");
				out.println("swal ( 'WELCOME' ,  'Login successfull !' ,  'success' );");
				out.println("});");
				out.println("</script>");
				
				RequestDispatcher rd = req.getRequestDispatcher("User_Dash.jsp");
				rd.include(req, res);
				//req.getRequestDispatcher("index2.html").include(req, res);
				}
			
				else
				{
				out.println("Sorry! unable to save record");
				}
			//out.close();
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
					RequestDispatcher rd = req.getRequestDispatcher("Login.html");
					rd.include(req, res);
				}
			}
			catch(Exception e)
			{
				e.printStackTrace();
			}
		
		
		
	}

}
