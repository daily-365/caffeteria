package web.dto;

public class OrderDetailDTO {

//	 ORDERDETAILSNUM                                       NOT NULL NUMBER
//	 ORDERID                                               NOT NULL VARCHAR2(50)
//	 GDSNUM                                                NOT NULL NUMBER
//	 CARTSTOCK                                             NOT NULL NUMBER
	
	
	private int orderDetailsNum;
	private String orderId;
	private int gdsNum;
	private int cartStock;
	public int getOrderDetailsNum() {
		return orderDetailsNum;
	}
	public void setOrderDetailsNum(int orderDetailsNum) {
		this.orderDetailsNum = orderDetailsNum;
	}
	public String getOrderId() {
		return orderId;
	}
	public void setOrderId(String orderId) {
		this.orderId = orderId;
	}
	public int getGdsNum() {
		return gdsNum;
	}
	public void setGdsNum(int gdsNum) {
		this.gdsNum = gdsNum;
	}
	public int getCartStock() {
		return cartStock;
	}
	public void setCartStock(int cartStock) {
		this.cartStock = cartStock;
	}
	@Override
	public String toString() {
		return "OrderDetailVO [orderDetailsNum=" + orderDetailsNum + ", orderId=" + orderId + ", gdsNum=" + gdsNum
				+ ", cartStock=" + cartStock + "]";
	}
	
	
	
	
}
