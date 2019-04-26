package p1;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;


public class WarningDao 

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
	
	
	public static int save(Warning dobj)
	{
		ResultSet rs = null;
		ResultSet r=null;
		Connection conn=null;
		try{

			conn=WarningDao.getConnection();

			PreparedStatement ps=conn.prepareStatement("insert into Warning values(?,?,?)");
			ps.setInt(1, dobj.getId());
			ps.setString(2,dobj.getName() );
			ps.setString(3, dobj.getWarning());
			
			//status=ps.executeUpdate();
			
			int e = ps.executeUpdate();
			//r.next();
			return e;

		}catch(Exception ex)
		    {  ex.printStackTrace();
		    
		      }

		return 0;
	}
	
	
}