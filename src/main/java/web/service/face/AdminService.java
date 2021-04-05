package web.service.face;

import java.util.List;

import web.dto.CategoryDTO;
import web.dto.GoodsDTO;
import web.dto.GoodsViewDTO;
import web.dto.OrderListDTO;
import web.dto.ReplyListDTO;
import web.dto.OrderDTO;

public interface AdminService  {

	public List<CategoryDTO> categroy() throws Exception;
	
	public void register(GoodsDTO   goods) throws Exception;
	
	public List<GoodsViewDTO> goodslist() throws Exception;
	
	public GoodsViewDTO goodsView(int gdsNum) throws Exception;
	
	public void goodsModify(GoodsDTO  goods)throws Exception;
	
	public void goodsDelete(int gdsNum)throws Exception;
	
    public List<OrderDTO> orderList() throws Exception;
    
    public List<OrderListDTO> orderView(OrderDTO order) throws Exception;
    
    public void delivery(OrderDTO order)throws Exception;
    
    public List<ReplyListDTO> allReply();
    
    public void deleteReply(int repNum);
} 
