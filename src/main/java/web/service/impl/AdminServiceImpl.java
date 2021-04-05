package web.service.impl;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import web.dao.face.AdminDAO;
import web.dto.CategoryDTO;
import web.dto.GoodsDTO;
import web.dto.GoodsViewDTO;
import web.dto.OrderListDTO;
import web.dto.ReplyListDTO;
import web.dto.OrderDTO;
import web.service.face.AdminService;

@Service
public class AdminServiceImpl implements AdminService{

	@Autowired
	private AdminDAO dao;
	
	@Override
	public List<CategoryDTO> categroy() throws Exception {
	
		return dao.category();
	}

	@Override
	public void register(GoodsDTO goods) throws Exception {
		
		dao.register(goods);
		
	}

	@Override
	public List<GoodsViewDTO> goodslist() throws Exception {
		
		return dao.goodslist();
	}

	@Override
	public GoodsViewDTO goodsView(int gdsNum) throws Exception {
	
		return dao.goodsView(gdsNum);
	}

	@Override
	public void goodsModify(GoodsDTO  goods) throws Exception {
		
	 dao.goodsModify(goods);
		
	}

	@Override
	public void goodsDelete(int gdsNum) throws Exception {
	
		dao.goodsDelete(gdsNum);
		
	}

	@Override
	public List<OrderDTO> orderList() throws Exception {
		
		return dao.orderList();
	}

	@Override
	public List<OrderListDTO> orderView(OrderDTO order) throws Exception {
		
		return dao.orderView(order);
	}

	@Override
	public void delivery(OrderDTO order) throws Exception {
	
		 dao.delivery(order);
		
	}

	@Override
	public List<ReplyListDTO> allReply() {
		return dao.allReply();
	}

	@Override
	public void deleteReply(int repNum) {
	    dao.deleteReply(repNum);
		
	}

	

	
	
}
