package com.shuohe.JobClassification;

public class Job {
	private int id;
	private String department_name;
	private String position_name;
	
	public Job(int id,String department_name,String position_name)
	{
		this.id = id;
		this.department_name = department_name;
		this.position_name = position_name;
	}	
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getDepartment_name() {
		return department_name;
	}
	public void setDepartment_name(String department_name) {
		this.department_name = department_name;
	}
	public String getPosition_name() {
		return position_name;
	}
	public void setPosition_name(String position_name) {
		this.position_name = position_name;
	}
	
	
}
