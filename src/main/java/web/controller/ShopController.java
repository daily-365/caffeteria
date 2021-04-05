package web.controller;

import java.text.DecimalFormat;
import java.util.Calendar;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import web.dto.CartListDTO;
import web.dto.CartDTO;
import web.dto.GoodsViewDTO;
import web.dto.MemberDTO;
import web.dto.OrderDetailDTO;
import web.dto.OrderListDTO;
import web.dto.OrderDTO;
import web.dto.ReplyListDTO;
import web.dto.ReplyDTO;
import web.service.face.ShopService;

@Controller
	@RequestMapping("/shop/*")
	public class ShopController {

	 private static final Logger logger = LoggerFactory.getLogger(ShopController.class);
	 
	 @Autowired
	 ShopService service;
	    
	 // 카테고리별 상품 리스트

	 
	 @RequestMapping(value = "/list", method = RequestMethod.GET)
	 public void getList(@RequestParam("c") int cateCode,
	      @RequestParam("l") int level, Model model) throws Exception {
	  logger.info("get list");
	  
	  List<GoodsViewDTO> list = null;
	 list = service.list(cateCode,level);
	 	 
	  model.addAttribute("list", list);
	  
	 }
	 
	 
	// 상품 조회
	 

	 
	 @RequestMapping(value = "/view", method = RequestMethod.GET)
	 public void getView(@RequestParam("n") int gdsNum, Model model) throws Exception {
	  logger.info("get view");
	  
	  GoodsViewDTO view = service.goodsView(gdsNum);
	  model.addAttribute("view", view);
	  
	
	 
	  
	 }
	 
	 

	 
	 // 상품 소감(댓글) 작성
	 
	
	 @ResponseBody
	 @RequestMapping(value = "/view/registReply",method = {RequestMethod.GET,RequestMethod.POST})
	 public void registReply(ReplyDTO reply , HttpSession session)throws Exception
	 {
		 logger.info("regist reply");
		 
		 MemberDTO member = (MemberDTO)session.getAttribute("member");
		 reply.setUserId(member.getUserId());
		 
		 service.registReply(reply);
	 }
	 
	// 상품 소감(댓글) 목록
	
	 @ResponseBody
	 @RequestMapping(value = "/view/replyList", method = {RequestMethod.GET,RequestMethod.POST})
	 public List<ReplyListDTO> ReplyList(@RequestParam("n") int gdsNum) throws Exception {
	  logger.info("post reply list");
	    
	  List<ReplyListDTO> reply = service.replyList(gdsNum);
	  
	  return reply;
	 } 
	 
	 
	// 상품 소감(댓글) 삭제

	 
	 @ResponseBody
	 @RequestMapping(value = "/view/deleteReply", method ={RequestMethod.GET,RequestMethod.POST})
	 public int replyDelete(ReplyDTO reply,  HttpSession session) throws Exception {
	  logger.info("post delete reply");

	  int result = 0;
	  
	  MemberDTO member = (MemberDTO)session.getAttribute("member");
	  String userId = service.idCheck(reply.getRepNum());
	    
	  if(member.getUserId().equals(userId)) {
	   
	   reply.setUserId(member.getUserId());
	   service.deleteReply(reply);
	   
	   result = 1;
	  }
	  
	  return result; 
	 }
	 
	 
	// 상품 소감(댓글) 수정
	 

	 
	 @ResponseBody
	 @RequestMapping(value = "/view/modifyReply", method = {RequestMethod.GET,RequestMethod.POST})
	 public int ModifyReply(ReplyDTO reply, HttpSession session) throws Exception {
	  logger.info("modify reply");
	  
	  int result = 0;
	  
	  MemberDTO member = (MemberDTO)session.getAttribute("member");
	  String userId = service.idCheck(reply.getRepNum());
	  
	  if(member.getUserId().equals(userId)) {
	   
	   reply.setUserId(member.getUserId());
	   service.modifyReply(reply);
	   result = 1;
	  }
	  
	  return result;
	 } 
	 
	// 카트 담기
	 

	 
	 @ResponseBody
	 @RequestMapping(value = "/view/addCart", method = {RequestMethod.GET,RequestMethod.POST})
	 public int postAddCart(CartDTO cart, HttpSession session) throws Exception {
	  
		 int result =0;
	  
	  MemberDTO member = (MemberDTO)session.getAttribute("member");
	 
	  if(member!=null) {
	  cart.setUserId(member.getUserId());
        service.addCart(cart);
	    result=1;
	  }
	  
	  return result;
	  
	 }
	
	 
	 //마이페이지 메인 화면
	 @RequestMapping(value = "/myPage/main")
	 public void myPageMain() {}
	 
	 	 
	 
	// 카트 목록
    

	 
	 @RequestMapping(value = "/myPage/cartList", method =   RequestMethod.GET )
	 public void getCartList(HttpSession session, Model model) throws Exception {
	  logger.info("get cart list");
	  
	  MemberDTO member = (MemberDTO)session.getAttribute("member");
	  String userId = member.getUserId();
	  
	  List<CartListDTO> cartList = service.cartList(userId);
	  
	  model.addAttribute("cartList", cartList);
	  
	 }
	 
	 
	// 카트 삭제
	 
	 
	 @ResponseBody
	 @RequestMapping(value = "/myPage/deleteCart", method =  RequestMethod.POST)
	 public int postDeleteCart(HttpSession session,
	      @RequestParam(value = "chBox[]") List<String> chArr, CartDTO cart) throws Exception {
	  logger.info("delete cart");
	  
	  MemberDTO member = (MemberDTO)session.getAttribute("member");
	  String userId = member.getUserId();
	  
	  int result = 0;
	  int cartNum = 0;
	  
	  
	  if(member != null) {
	   cart.setUserId(userId);
	   
	   for(String i : chArr) {   
	    cartNum = Integer.parseInt(i);
	    cart.setCartNum(cartNum);
	    service.deleteCart(cart);
	   }   
	   result = 1;
	  }  
	  return result;  
	 }
	 
	 
	// 주문
		 
	 @RequestMapping(value = "/myPage/cartList", method = RequestMethod.POST)
	 public String postOrder(HttpSession session, OrderDTO order, OrderDetailDTO orderDetail) throws Exception {
	  logger.info("order");
	  
	  MemberDTO member = (MemberDTO)session.getAttribute("member");  
	  String userId = member.getUserId();
	  
	  Calendar cal = Calendar.getInstance();
	  int year = cal.get(Calendar.YEAR);
	  String ym = year + new DecimalFormat("00").format(cal.get(Calendar.MONTH) + 1);
	  String ymd = ym +  new DecimalFormat("00").format(cal.get(Calendar.DATE));
	  String subNum = "";
	  
	  for(int i = 1; i <= 6; i ++) {
	   subNum += (int)(Math.random() * 10);
	  }
	  
	  String orderId = ymd + "_" + subNum;
	  
	  order.setOrderId(orderId);
	  order.setUserId(userId);
	   
	  service.orderInfo(order);
	  
	  orderDetail.setOrderId(orderId);   
	  service.orderInfo_Details(orderDetail);
	  
	  service.cartAllDelete(userId);
	  
	  return "redirect:/shop/myPage/orderList";  
	 }
	 
	 
	 
	// 주문 목록
	 @RequestMapping(value = "/myPage/orderList", method =  RequestMethod.GET )
	 public void getOrderList(HttpSession session, OrderDTO order, Model model) throws Exception {
	  logger.info("get order list");
	  
	  MemberDTO member = (MemberDTO)session.getAttribute("member");
	  String userId = member.getUserId();
	  
	  order.setUserId(userId);
	  
	  List<OrderDTO> orderList = service.orderList(order);
	  
	  model.addAttribute("orderList", orderList);
	 }
	 
	// 주문 상세 목록
	 @RequestMapping(value = "/myPage/orderView", method = RequestMethod.GET )
	 public void getOrderList(HttpSession session,
	       @RequestParam("n") String orderId,
	       OrderDTO order, Model model) throws Exception {
	  logger.info("get order view");
	  
	  MemberDTO member = (MemberDTO)session.getAttribute("member");
	  String userId = member.getUserId();
	  
	  order.setUserId(userId);
	  order.setOrderId(orderId);
	  
	  List<OrderListDTO> orderView = service.orderView(order);
	  
	  model.addAttribute("orderView", orderView);
	 }
	 
	}

