package p1;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;


public class RegisterDao 

{
public static Connection getConnection()
{ 
Connection con=null;
try
{
Class.forName("com.mysql.jdbc.Driver");
con=DriverManager.getConnection(
"jdbc:mysql://localhost:3306/test","root","root");
}catch(Exception e){System.out.println(e);}
return con;
}

public static int save(Register lobj) 
{
int status=0;
ResultSet rs = null;
Connection conn=null;

	
	try{

		conn=CredDao.getConnection();

		PreparedStatement ps=conn.prepareStatement("insert into register values(?,?,?,?,?)");
		ps.setString(1,lobj.getFn());
		ps.setString(2,lobj.getLn());
		ps.setInt(3, lobj.getEmpid());
		ps.setString(4, lobj.getEmail());
		ps.setString(5, lobj.getPassword());
		//status=ps.executeUpdate();
		int e = ps.executeUpdate();
		//r.next();
		if(e==1)
		{
			PreparedStatement ps2=conn.prepareStatement("insert into Credentials values(?,?,?,?)");
			
			ps2.setString(1,lobj.getFn());
			//ps2.setString(2,lobj.getLn());
			ps2.setInt(2, lobj.getEmpid());
			ps2.setString(3,lobj.getPassword());
			ps2.setInt(4, 0);
			int f = ps2.executeUpdate();
			if(f==1)
				status=1;
			else
				status=0;
			
		}
		else
			status=0;

	}catch(Exception ex)
	    {  ex.printStackTrace();
	    
	      }
	try {
		conn.close();
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	return status;
}
}
