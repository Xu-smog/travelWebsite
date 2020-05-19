package org.travel.root;

public class root {
	private String root_id;
	private String name;
	private String password;
	
	public root(String root_id,String name,String password) {
		super();
		this.root_id = root_id;
		this.name = name;
		this.password = password;
	}
	public String getRoot_id() {
		return root_id;
	}
	public void setRoot_id(String root_id) {
		this.root_id = root_id;
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
	
	
}
