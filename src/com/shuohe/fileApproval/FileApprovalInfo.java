package com.shuohe.fileApproval;

public class FileApprovalInfo {
	String approvalId;
	String approvalSN;
	String setStatus;
	String describe;
	String sponsor;
	String leader;
	String date;
	
	
	
	public FileApprovalInfo(String approvalId, String approvalSN,
			String setStatus, String describe, String sponsor, String leader,
			String date) {
		super();
		this.approvalId = approvalId;
		this.approvalSN = approvalSN;
		this.setStatus = setStatus;
		this.describe = describe;
		this.sponsor = sponsor;
		this.leader = leader;
		this.date = date;
	}
	public String getApprovalId() {
		return approvalId;
	}
	public void setApprovalId(String approvalId) {
		this.approvalId = approvalId;
	}
	public String getApprovalSN() {
		return approvalSN;
	}
	public void setApprovalSN(String approvalSN) {
		this.approvalSN = approvalSN;
	}
	public String getSetStatus() {
		return setStatus;
	}
	public void setSetStatus(String setStatus) {
		this.setStatus = setStatus;
	}
	public String getDescribe() {
		return describe;
	}
	public void setDescribe(String describe) {
		this.describe = describe;
	}
	public String getSponsor() {
		return sponsor;
	}
	public void setSponsor(String sponsor) {
		this.sponsor = sponsor;
	}
	public String getLeader() {
		return leader;
	}
	public void setLeader(String leader) {
		this.leader = leader;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	
	
		
}
