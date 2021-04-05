package web.dto;

import java.util.Date;

public class ReplyDTO {

//	 GDSNUM                                                NOT NULL NUMBER
//	 USERID                                                NOT NULL VARCHAR2(50)
//	 REPNUM                                                NOT NULL NUMBER
//	 REPCON                                                NOT NULL VARCHAR2(2000)
//	 REPDATE                                                        DATE
	
	private int gdsNum;
	private String userId;
	private int repNum;
	private String repCon;
	private Date repDate;
	public int getGdsNum() {
		return gdsNum;
	}
	public void setGdsNum(int gdsNum) {
		this.gdsNum = gdsNum;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public int getRepNum() {
		return repNum;
	}
	public void setRepNum(int repNum) {
		this.repNum = repNum;
	}
	public String getRepCon() {
		return repCon;
	}
	public void setRepCon(String repCon) {
		this.repCon = repCon;
	}
	public Date getRepDate() {
		return repDate;
	}
	public void setRepDate(Date repDate) {
		this.repDate = repDate;
	}
	@Override
	public String toString() {
		return "ReplyVO [gdsNum=" + gdsNum + ", userId=" + userId + ", repNum=" + repNum + ", repCon=" + repCon
				+ ", repDate=" + repDate + "]";
	}
	
	
	
}
