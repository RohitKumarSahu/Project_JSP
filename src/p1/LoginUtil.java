package p1;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class LoginUtil {
	
	private static Connection conn= null;

	public static Connection getConnect(){
		
		
		if(conn==null){
			try {
				Class.forName("com.mysql.jdbc.Driver");
			} catch (ClassNotFoundException e) {

				e.printStackTrace();
			}
		
			String cs="jdbc:mysql://localhost:3306/test";
			
			try {
				conn=DriverManager.getConnection(cs, "root", "root");
			
			
			} catch (SQLException e) {

				e.printStackTrace();
			}
		}
		
		
		return conn;
	}
	
}
