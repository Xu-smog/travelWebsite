package org.travel.user;

public class User {
	private String user_id;
	private String user_name;
	private String email;
	private String password;	
	private String about_me;
	private String user_face_url;
		
	public User(String user_id, String user_name, String email, String password, String about_me,
			String user_face_url) {
		super();
		this.user_id = user_id;
		this.user_name = user_name;
		this.email = email;
		this.password = password;
		this.about_me = about_me;
		this.user_face_url = user_face_url;
	}
	
	public User(String user_id, String user_name, String user_face_url) {
		super();
		this.user_id = user_id;
		this.user_name = user_name;
		this.user_face_url = user_face_url;
	}
	
	public User(String user_id,String user_name, String email, String password) {
		super();
		this.user_id = user_id;
		this.email = email;
		this.password = password;
		this.user_name = user_name;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
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

	public String getUser_name() {
		return user_name;
	}

	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}

	public String getAbout_me() {
		return about_me;
	}

	public void setAbout_me(String about_me) {
		this.about_me = about_me;
	}

	public String getUser_face_url() {
		return user_face_url;
	}

	public void setUser_face_url(String user_face_url) {
		this.user_face_url = user_face_url;
	}

	@Override
	public String toString() {
		return "User [user_id=" + user_id + ", email=" + email + ", password=" + password + ", user_name=" + user_name
				+ ", about_me=" + about_me + ", user_face_url=" + user_face_url + "]";
	}
		
}
