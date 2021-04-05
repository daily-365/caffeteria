package web.dao.face;

import java.util.List;

import web.dto.CartListDTO;
import web.dto.CartDTO;
import web.dto.GoodsViewDTO;
import web.dto.OrderDetailDTO;
import web.dto.OrderListDTO;
import web.dto.OrderDTO;
import web.dto.ReplyListDTO;
import web.dto.ReplyDTO;

public interface ShopDAO {

	
	
	public List<GoodsViewDTO> list (int cateCode) throws Exception;
	
	 public List<GoodsViewDTO> list (int cateCode,int cateCodeRef) throws
	  Exception;
	 
	 public GoodsViewDTO goodsView(int gdsNum)throws Exception;
	 
	 public void registReply(ReplyDTO reply)throws Exception;
	 
	 public List<ReplyListDTO> replyList(int gdsNum)throws Exception;
	
	 public void deleteReply(ReplyDTO reply)throws Exception;
	 
	 public String idCheck(int repNum) throws Exception;
	
	 public void modifyReply (ReplyDTO  reply) throws Exception;
	 
	 public void addCart(CartDTO cart)throws Exception;
	 
	 public List<CartListDTO> cartList (String userId) throws Exception;

     public void deleteCart(CartDTO cart) throws Exception;

     public void orderInfo(OrderDTO order)throws Exception;
     
     public void orderInfo_Details(OrderDetailDTO OrderDetail)throws Exception;
     
     public void cartAllDelete(String userId)throws Exception;
     
     public List<OrderDTO>orderList(OrderDTO order)throws Exception;
     
     public List<OrderListDTO> orderView(OrderDTO order)throws Exception;
     
   
     
}
