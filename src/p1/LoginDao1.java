package p1;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;


public class LoginDao1{

	
	
	public static int j=0;
	

	/*public String getNotification() {
		String message= null;
		
		Connection conn=LoginUtil.getConnect();
		
		try {
			
			PreparedStatement ps=conn.prepareStatement("select Notification from notifications where ID=1");
			ResultSet rs=ps.executeQuery();
			
			if(rs.next()){
				message=rs.getString(1);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
		return message;
	}
	*/
	/*public String deleteNotification()
	{
		String i=null;
		Connection conn=LoginUtil.getConnect();
		
		try {
			PreparedStatement ps=conn.prepareStatement("delete from notifications where ID=1");
			int u= ps.executeUpdate();
			
			if(u>0)
			{
				i="No More Notifications";
			}
			else
				i="NotSuccess";
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return i;
	}
	*/
	/*public String notifAll()
	{
		String s= null;
		int i=0;
		Connection conn=LoginUtil.getConnect();
		try {
			PreparedStatement ps=conn.prepareStatement("select ID from analysis where Attend=0");
			ResultSet rs= ps.executeQuery();
			while(rs.next()){
				int ID=rs.getInt(1);
				PreparedStatement	ps1=conn.prepareStatement("insert into notifications (ID,Notification) values (?,'You have Missed a session')");
				ps1.setInt(1,ID);
				i=ps1.executeUpdate();
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		if(i>0)
			s="Notified All Sucessfully";
		else
			s="Notifying failed";
		
		return s;
	}*/
	
	public static int[] feedbackAll()
	{
		String s=null;
		int stat=0;
		int A[]=new int[100];
		Connection conn=LoginUtil.getConnect();
		try {
			PreparedStatement ps=conn.prepareStatement("select Eid from Credentials where status=0");
			ResultSet rs= ps.executeQuery();
			while(rs.next()){
				stat=rs.getInt("Eid");
				A[j++]=stat;
				//System.out.println("A=== "+A[j]);
				//PreparedStatement	ps1=conn.prepareStatement("insert into feedback (ID,Feedback) values (?,'Please give a feedback')");
				//ps1.setInt(1,ID);
				//j=ps1.executeUpdate();
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return A;
	}

	/*public String getFeedback() {
		String message= null;
		
		Connection conn=LoginUtil.getConnect();
		
		try {
			
			PreparedStatement ps=conn.prepareStatement("select Feedback from feedback where ID=1");
			ResultSet rs=ps.executeQuery();
			
			if(rs.next()){
				message=rs.getString(1);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return message;
	}*/
}