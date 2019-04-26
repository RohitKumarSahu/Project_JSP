package p1;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;


public class AdminLoginDao

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
	public static AdminLogin save(AdminLogin lobj) 
	{
	int status=0;
	ResultSet rs=null;
	AdminLogin a1=new AdminLogin();
	try
	{
	Connection con2=AdminLoginDao.getConnection();
	PreparedStatement ps2=
	con2.prepareStatement("select * from Admin");
	//ps2.setInt(1,lobj.getUslid());
	//ps2.setString(2,lobj.getUslogin());
	//ps2.setInt(3,lobj.getUslpassword());
	rs=ps2.executeQuery();
	
	while(rs.next())
	{
		a1.setUser(rs.getString(2));
		a1.setPassword(rs.getString(3));
	}
	
	con2.close();
	}
	catch(Exception ex) {ex.printStackTrace();}
	return a1;
	}

}