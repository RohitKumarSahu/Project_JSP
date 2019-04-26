package p1;

public class AdminLogin {

	
	
	
	public AdminLogin(){}
	
	public AdminLogin(String user, String password) {
		super();
		this.user = user;
		this.password = password;
	}

	String user,password;

	public String getUser() {
		return user;
	}

	public void setUser(String user) {
		this.user = user;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}
	
	
}
