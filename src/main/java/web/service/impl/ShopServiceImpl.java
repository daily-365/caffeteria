package web.service.impl;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import web.dao.face.ShopDAO;
import web.dto.CartListDTO;
import web.dto.CartDTO;

import web.dto.GoodsViewDTO;
import web.dto.OrderDetailDTO;
import web.dto.OrderListDTO;
import web.dto.OrderDTO;
import web.dto.ReplyListDTO;
import web.dto.ReplyDTO;
import web.service.face.ShopService;

@Service
public class ShopServiceImpl implements ShopService{

	@Autowired
	private ShopDAO dao;

	// 카테고리별 상품 리스트
	@Override
	public List<GoodsViewDTO> list(int cateCode, int level) throws Exception {
	 
	 int cateCodeRef = 0;  // 카테고리 참조 코드. 없어도 무관
	 
	 if(level == 1) {  // lavel 1 = 1차 분류.
	  
	  cateCodeRef = cateCode;
	  return dao.list(cateCode, cateCodeRef);
	  // 두가지 모두 cateCode로 해도 무관
	  
	 } else {  // lavel 2 = 2차 분류
	  
	  return dao.list(cateCode);
	  
	 }
	 
	}

	@Override
	public GoodsViewDTO goodsView(int gdsNum) throws Exception {
	
		return dao.goodsView(gdsNum);
		
		
	}

	@Override
	public void registReply(ReplyDTO reply) throws Exception {
	 dao.registReply(reply);
		
	}

	@Override
	public List<ReplyListDTO> replyList(int gdsNum) throws Exception {
	
		return dao.replyList(gdsNum);
	}

	@Override
	public void deleteReply(ReplyDTO reply) throws Exception {
	dao.deleteReply(reply);
		
	}

	@Override
	public String idCheck(int repNum) throws Exception {
		
		 return dao.idCheck(repNum);
		
	}

	@Override
	public void modifyReply(ReplyDTO reply) throws Exception {
	
	dao.modifyReply(reply);
		
	}

	@Override
	public void addCart(CartDTO cart) throws Exception {
		
		dao.addCart(cart);
		
	}

	@Override
	public List<CartListDTO> cartList(String userId) throws Exception {
		
		return dao.cartList(userId);
	}

	@Override
	public void deleteCart(CartDTO cart) throws Exception {

		 dao.deleteCart(cart);
		
	}

	@Override
	public void orderInfo(OrderDTO order) throws Exception {
		
		dao.orderInfo(order);
		
	}

	@Override
	public void orderInfo_Details(OrderDetailDTO OrderDetail) throws Exception {
		dao.orderInfo_Details(OrderDetail);
		
	}

	@Override
	public void cartAllDelete(String userId) throws Exception {
		dao.cartAllDelete(userId);
		
	}

	@Override
	public List<OrderDTO> orderList(OrderDTO order) throws Exception {
		
		return dao.orderList(order);
	}

	@Override
	public List<OrderListDTO> orderView(OrderDTO order) throws Exception {
		
		return dao.orderView(order);
	}


	
	 
	}


