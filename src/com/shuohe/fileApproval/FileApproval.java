package com.shuohe.fileApproval;

public class FileApproval {
	private String id;
	private String sponsor;
	private String leader;
	private String describe;
	private String file;
	private String date;
	private int status;
		
	
	public FileApproval(String id, String sponsor, String leader,
			String describe, String file, String date ,int status) {
		super();
		this.id = id;
		this.sponsor = sponsor;
		this.leader = leader;
		this.describe = describe;
		this.file = file;
		this.date = date;
		this.status = status;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getSponsor() {
		return sponsor;
	}
	public void setSponsor(String sponsor) {
		this.sponsor = sponsor;
	}
	public String getleader() {
		return leader;
	}
	public void setleader(String leader) {
		this.leader = leader;
	}
	public String getDescribe() {
		return describe;
	}
	public void setDescribe(String describe) {
		this.describe = describe;
	}
	public String getFile() {
		return file;
	}
	public void setFile(String file) {
		this.file = file;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	
	
	
}
