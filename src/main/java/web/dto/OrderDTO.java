package web.dto;

import java.util.Date;

public class OrderDTO {

	
//	 ORDERID                                               NOT NULL VARCHAR2(50)
//	 USERID                                                NOT NULL VARCHAR2(50)
//	 ORDERREC                                              NOT NULL VARCHAR2(50)
//	 USERADDR1                                             NOT NULL VARCHAR2(20)
//	 USERADDR2                                             NOT NULL VARCHAR2(50)
//	 USERADDR3                                             NOT NULL VARCHAR2(50)
//	 ORDERPhone                                             NOT NULL VARCHAR2(30)
//	 AMOUNT                                                NOT NULL NUMBER
//	 ORDERDATE                                                      DATE

	//DELIVERY     VARCHAR2(20)
	
	
	private String orderId;
	private String userId;
	private String orderRec;
	private String userAddr1;
	private String userAddr2;
	private String userAddr3;
	private String orderPhone;
    private int amount;
	private Date orderDate;
	
	private String delivery;
	
	
	public String getDelivery() {
		return delivery;
	}
	public void setDelivery(String delivery) {
		this.delivery = delivery;
	}
	
	
	public String getOrderId() {
		return orderId;
	}
	public void setOrderId(String orderId) {
		this.orderId = orderId;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getOrderRec() {
		return orderRec;
	}
	public void setOrderRec(String orderRec) {
		this.orderRec = orderRec;
	}
	public String getUserAddr1() {
		return userAddr1;
	}
	public void setUserAddr1(String userAddr1) {
		this.userAddr1 = userAddr1;
	}
	public String getUserAddr2() {
		return userAddr2;
	}
	public void setUserAddr2(String userAddr2) {
		this.userAddr2 = userAddr2;
	}
	public String getUserAddr3() {
		return userAddr3;
	}
	public void setUserAddr3(String userAddr3) {
		this.userAddr3 = userAddr3;
	}
	public String getOrderPhone() {
		return orderPhone;
	}
	public void setOrderPhone(String orderPhone) {
		this.orderPhone = orderPhone;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	public Date getOrderDate() {
		return orderDate;
	}
	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}
	@Override
	public String toString() {
		return "OrderVO [orderId=" + orderId + ", userId=" + userId + ", orderRec=" + orderRec + ", userAddr1="
				+ userAddr1 + ", userAddr2=" + userAddr2 + ", userAddr3=" + userAddr3 + ", orderPhone=" + orderPhone
				+ ", amount=" + amount + ", orderDate=" + orderDate + "]";
	}
	
	
}
