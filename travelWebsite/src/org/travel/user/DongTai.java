package org.travel.user;

import java.util.ArrayList;

public class DongTai {
	private String user_id;
	private String user_comment;
	private String zan;
	private String dongtai_id;
	private String time;
	private ArrayList<String> photo=null;
	
	public DongTai(String user_id, String user_comment, String zan, String dongtai_id, String time, ArrayList<String> photo) {
		super();
		this.user_id = user_id;
		this.user_comment = user_comment;
		this.zan = zan;
		this.dongtai_id = dongtai_id;
		this.time = time;
		this.photo = photo;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getUser_comment() {
		return user_comment;
	}

	public void setUser_comment(String user_comment) {
		this.user_comment = user_comment;
	}

	public String getZan() {
		return zan;
	}

	public void setZan(String zan) {
		this.zan = zan;
	}

	public String getDongtai_id() {
		return dongtai_id;
	}

	public void setDongtai_id(String dongtai_id) {
		this.dongtai_id = dongtai_id;
	}

	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}

	public ArrayList<String> getPhoto() {
		return photo;
	}

	public void setPhoto(ArrayList<String> photo) {
		this.photo = photo;
	}

	@Override
	public String toString() {
		return "DongTai [user_id=" + user_id + ", user_comment=" + user_comment + ", zan=" + zan + ", dongtai_id="
				+ dongtai_id + ", time=" + time + ", photo=" + photo + "]";
	}	
	
}
