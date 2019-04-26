package p1;

public class Login {
	public Login(){
		
	}
public Login(int id,String name, String password) {
		super();
		this.id = id;
		//this.eid=eid;
		this.name = name;
		this.password = password;
	}
private int id,status,eid;
private String name,password;
public int getId() {
	return id;
}
public void setId(int id) {
	this.id = id;
}
public String getName() {
	return name;
}
public void setName(String name) {
	this.name = name;
}
public String getPassword() {
	return password;
}
public void setPassword(String password) {
	this.password = password;
}
public int getStatus() {
	return status;
}
public void setStatus(int status) {
	this.status = status;
}
}
