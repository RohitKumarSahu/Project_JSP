package p1;
import java.sql.Connection;

import java.sql.DriverManager;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import p1.Feed;

public class FeedbackSave
{
	static int id=0;
	static String name="";
	public static Connection getConnection()
	{
		Connection conn=null;

		try {

			Class.forName("com.mysql.jdbc.Driver");

			conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/test","root","root");

		} catch (Exception e) {

			System.out.println(e);

		}

		return conn;
	}

	public static Feed save(Feed dobj)
	{
		ResultSet rs = null;
		Connection conn=null;

			
			try{

				conn=CredDao.getConnection();

				PreparedStatement ps=conn.prepareStatement("insert into feedback values(?,?,?,?,?,?,?,?)");
				ps.setInt(1,dobj.getId());
				ps.setString(2,dobj.getName());
				ps.setString(3, dobj.getObj());
				ps.setString(4, dobj.getPart());
				ps.setString(5, dobj.getTop());
				ps.setString(6, dobj.getTrain());
				ps.setString(7, dobj.getWell());
				ps.setString(8, dobj.getFee());
				//status=ps.executeUpdate();
				Feed f1=new Feed();
				int e = ps.executeUpdate();
				//r.next();
				if(e==1)
					f1.setStatus(e);
				else if(e==0)
					f1.setStatus(0);
				return f1;

			}catch(Exception ex)
			    {  ex.printStackTrace();
			    
			      }
			try {
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return null;
		}
	
	

}