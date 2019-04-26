package p1;

public class Warning {

	
	public Warning(int id, String name, String warning) {
		super();
		this.id = id;
		this.name = name;
		this.warning = warning;
	}
	int id;
	String name,warning;
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
	public String getWarning() {
		return warning;
	}
	public void setWarning(String warning) {
		this.warning = warning;
	}
}
