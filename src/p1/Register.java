package p1;

public class Register {

	public Register(String fn, String ln, String email, String password, int empid) {
		super();
		this.fn = fn;
		this.ln = ln;
		this.email = email;
		this.password = password;
		this.empid = empid;
	}
	String fn,ln,email,password;
	int empid;
	public String getFn() {
		return fn;
	}
	public void setFn(String fn) {
		this.fn = fn;
	}
	public String getLn() {
		return ln;
	}
	public void setLn(String ln) {
		this.ln = ln;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public int getEmpid() {
		return empid;
	}
	public void setEmpid(int empid) {
		this.empid = empid;
	}
	
	
	
}
