package p1;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;


public class LoginDao 

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

public static int save(Login lobj) 
{
int status=0;
try
{
Connection con2=LoginDao.getConnection();
PreparedStatement ps2=
con2.prepareStatement("select * from Credentials");
//ps2.setInt(1,lobj.getUslid());
//ps2.setString(2,lobj.getUslogin());
//ps2.setInt(3,lobj.getUslpassword());
status=ps2.executeUpdate();
con2.close();
}
catch(Exception ex) {ex.printStackTrace();}
return status;
}
}
