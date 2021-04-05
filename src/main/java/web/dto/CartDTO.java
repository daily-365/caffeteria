
package web.dto;

import java.util.Date;

public class CartDTO {

//	 CARTNUM                                               NOT NULL NUMBER
//	 USERID                                                NOT NULL VARCHAR2(50)
//	 GDSNUM                                                NOT NULL NUMBER
//	 CARTSTOCK                                             NOT NULL NUMBER
//	 ADDDATE                                                        DATE
	
	private int cartNum;
	private String userId;
	private int gdsNum;
	private int cartStock;
	private Date addDate;
	
	
	@Override
	public String toString() {
		return "CartVO [cartNum=" + cartNum + ", userId=" + userId + ", gdsNum=" + gdsNum + ", cartStock=" + cartStock
				+ ", addDate=" + addDate + "]";
	}
	public int getCartNum() {
		return cartNum;
	}
	public void setCartNum(int cartNum) {
		this.cartNum = cartNum;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
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
	public Date getAddDate() {
		return addDate;
	}
	public void setAddDate(Date addDate) {
		this.addDate = addDate;
	}
	
	
	
	
	
	
	
}
