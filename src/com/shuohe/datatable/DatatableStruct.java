package com.shuohe.datatable;

public class DatatableStruct {
	String name;
	String createDate;
	String createUser;
	String status;
	String info;
	
	public DatatableStruct(String name,String status,String info,String createDate,String createUser)
	{
		this.name = name;
		this.createDate = createDate;
		this.createUser = createUser;
		this.status = status;
		this.info = info;
	}
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getCreateDate() {
		return createDate;
	}
	public void setCreateDate(String createDate) {
		this.createDate = createDate;
	}
	public String getCreateUser() {
		return createUser;
	}
	public void setCreateUser(String createUser) {
		this.createUser = createUser;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getInfo() {
		return info;
	}
	public void setInfo(String info) {
		this.info = info;
	}
	
	
	
}
