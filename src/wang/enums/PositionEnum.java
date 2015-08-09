package wang.enums;

public enum PositionEnum {
	JAVA(1,"Java开发"),
	CPP(2,"C++开发"),
	JavaWeb(3,"JavaWeb开发"),
	PD(4,"产品经理"),
	WebFront(5,"前端开发");
	
	
	private int id;
	private String name;

	private PositionEnum(int id,String name) {
		this.id=id;
		this.name = name;
	}

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
	
	
	
	
}
