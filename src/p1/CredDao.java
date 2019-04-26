package p1;
import java.sql.Connection;

import java.sql.DriverManager;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import p1.Login;

public class CredDao
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

	public static Login save(Login dobj)
	{
		
		ResultSet rs = null;
		Connection conn=null;
		try{

			conn=CredDao.getConnection();
			id=dobj.getId();
			PreparedStatement ps=conn.prepareStatement("select * from Credentials where Eid="+dobj.getId());
			name=dobj.getName();
			//status=ps.executeUpdate();
			Login lobj=new Login();
			rs = ps.executeQuery();
            rs.next();
			//lobj.setId(rs.getInt(1));
            lobj.setId(rs.getInt(2));
			//lobj.setName(rs.getString(2));
			lobj.setPassword(rs.getString(3));
			
			if(dobj.getId()==lobj.getId() && dobj.getPassword().equals(lobj.getPassword()))
			{
				return lobj;
				
			}
			else
			{
				return null;
			}
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
	
	public static Login update()
	{
		ResultSet rs = null;
		ResultSet r=null;
		Connection conn=null;
		try{

			conn=CredDao.getConnection();

			PreparedStatement ps=conn.prepareStatement("update Credentials set status=1 where Eid="+id);

			//status=ps.executeUpdate();
			Login lobj=new Login();
			int e = ps.executeUpdate();
			System.out.println("Update Operation "+e);
			PreparedStatement p=conn.prepareStatement("select status from Credentials where Eid="+id);
			r=p.executeQuery();
			r.next();
			if(e==1)
				lobj.setStatus(e);
			else if(e==0)
				lobj.setStatus(0);
			return lobj;

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
	public static Login stat()
	{
		ResultSet rs = null;
		Connection conn=null;
		try{

			conn=CredDao.getConnection();

			//PreparedStatement ps=conn.prepareStatement("update Credentials set status=1 where id=1");

			//status=ps.executeUpdate();
			Login lobj=new Login();
			PreparedStatement p=conn.prepareStatement("select status from Credentials where Eid="+id);
			rs=p.executeQuery();
			rs.next();
			Login e=CredDao.update();
			//if(e.getStatus()==1)
				lobj.setStatus(1);
			return lobj;

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
	
	public static Login transfer()
	{
		ResultSet rs = null;
		ResultSet r=null;
		Connection conn=null;
		try{

			conn=CredDao.getConnection();

			PreparedStatement ps=conn.prepareStatement("insert into analysis values(?,?,?)");
			ps.setString(2, name);
			ps.setInt(1,id );
			ps.setInt(3, 1);
			
			//status=ps.executeUpdate();
			Login lobj=new Login();
			int e = ps.executeUpdate();
			//r.next();
			if(e==1)
				lobj.setStatus(e);
			else if(e==0)
				lobj.setStatus(0);
			return lobj;

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
	
	
	public static Login transfer_absent()
	{
		ResultSet rs = null;
		ResultSet r=null;
		Connection conn=null;
		try{

			conn=CredDao.getConnection();

			PreparedStatement ps=conn.prepareStatement("insert into analysis values(?,?,?)");
			ps.setString(2, name);
			ps.setInt(1,id );
			ps.setInt(3, 0);
			
			//status=ps.executeUpdate();
			Login lobj=new Login();
			int e = ps.executeUpdate();
			//r.next();
			if(e==1)
				lobj.setStatus(e);
			else if(e==0)
				lobj.setStatus(0);
			return lobj;

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