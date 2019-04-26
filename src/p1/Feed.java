package p1;

public class Feed {

	
	public Feed(){}
	
	public Feed(int id, String name, String obj, String part, String top, String train, String well,String fee) {
		super();
		this.id = id;
		this.name = name;
		this.obj = obj;
		this.part = part;
		this.top = top;
		this.train = train;
		this.well = well;
		this.fee=fee;
	}
	int id,status;
	String name,obj,part,top,train,well,fee;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getStatus() {
		return id;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getObj() {
		return obj;
	}
	public void setObj(String obj) {
		this.obj = obj;
	}
	public String getPart() {
		return part;
	}
	public void setPart(String part) {
		this.part = part;
	}
	public String getTop() {
		return top;
	}
	public void setTop(String top) {
		this.top = top;
	}
	public String getTrain() {
		return train;
	}
	public void setTrain(String train) {
		this.train = train;
	}
	public String getWell() {
		return well;
	}
	public void setWell(String well) {
		this.well = well;
	}

	public String getFee() {
		return fee;
	}

	public void setFee(String fee) {
		this.fee = fee;
	}
	
	
}
