package web.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import net.sf.json.JSONArray;
import web.dto.CategoryDTO;
import web.dto.GoodsDTO;
import web.dto.GoodsViewDTO;
import web.dto.OrderListDTO;
import web.dto.ReplyListDTO;
import web.dto.OrderDTO;
import web.service.face.AdminService;
import web.util.UploadFileUtils;

@Controller
@RequestMapping(value = "/admin/*")
public class AdminController {

	@Autowired
	AdminService adminService;
	
	@Resource(name = "uploadPath")
	private String uploadPath;
	
	
	private static final Logger logger= LoggerFactory.getLogger(AdminController.class);
	
	@RequestMapping(value = "/index")
	public String AdminMain() {
		
		logger.info("관리자 화면");
		
		return "admin/index";
	}
	
	// 상품 등록
	@RequestMapping(value = "/goods/register", method = RequestMethod.GET)
	public void getGoodsRegister(Model model) throws Exception {
	 logger.info("get goods register");
	 
	 List<CategoryDTO> category = null;
	 
	 category = adminService.categroy();
	 	 model.addAttribute("category" ,JSONArray.fromObject(category));
	 	 
	 	 
	}
	
	// 상품 등록
	@RequestMapping(value = "/goods/register", method = RequestMethod.POST)
	public String postGoodsRegister(GoodsDTO goods, MultipartFile file) throws Exception {
	 
	 String imgUploadPath = uploadPath + File.separator + "imgUpload";  // 이미지를 업로드할 폴더를 설정 = /uploadPath/imgUpload
	 String ymdPath = UploadFileUtils.calcPath(imgUploadPath);  // 위의 폴더를 기준으로 연월일 폴더를 생성
	 String fileName = null;  // 기본 경로와 별개로 작성되는 경로 + 파일이름
	   
	 if(file.getOriginalFilename() != null && file.getOriginalFilename() != "") {
	  // 파일 인풋박스에 첨부된 파일이 없다면(=첨부된 파일이 이름이 없다면)
	  
	  fileName =  UploadFileUtils.fileUpload(imgUploadPath, file.getOriginalFilename(), file.getBytes(), ymdPath);

	  // gdsImg에 원본 파일 경로 + 파일명 저장
	  goods.setGdsImg(File.separator + "imgUpload" + ymdPath + File.separator + fileName);
	  // gdsThumbImg에 썸네일 파일 경로 + 썸네일 파일명 저장
	  goods.setgdsThumbImg(File.separator + "imgUpload" + ymdPath + File.separator + "s" + File.separator + "s_" + fileName);
	  
	 } else {  // 첨부된 파일이 없으면
	  fileName = File.separator + "images" + File.separator + "none.png";
	  // 미리 준비된 none.png파일을 대신 출력함
	  
	  goods.setGdsImg(fileName);
	  goods.setgdsThumbImg(fileName);
	 }
	      
	 adminService.register(goods);
	 
	 return "redirect:/admin/index";
	}
	
	
	// 상품 목록
		@RequestMapping(value = "/goods/list", method = RequestMethod.GET)
		public void getGoodsList(GoodsDTO goods,Model model) throws Exception {
		
	 logger.info("get Goods List");
	 
	 List<GoodsViewDTO> list = adminService.goodslist();
	 
	 model.addAttribute("list",list);
			
		}
	
		// 상품 조회
		@RequestMapping(value = "/goods/view", method = RequestMethod.GET)
		public void getGoodsView(@RequestParam("n")int gdsNum,Model model) throws Exception {
		
					
	 logger.info("get Goods View");
	 
	 GoodsViewDTO goods = adminService.goodsView(gdsNum);
	 model.addAttribute("goods",goods);
	 
	 
		}
		
		
		// 상품 수정
		@RequestMapping(value = "/goods/modify", method = RequestMethod.GET)
		public void getGoodsModify(@RequestParam("n")int gdsNum,Model model) throws Exception {
		 logger.info("get goods Modify");
		 
		 GoodsViewDTO goods = adminService.goodsView(gdsNum);
		 model.addAttribute("goods",goods);
		
		 List<CategoryDTO> category = null;
		 
		 category = adminService.categroy();
		 	 model.addAttribute("category" ,JSONArray.fromObject(category));
		 	 
		 	 
		}
		
		// 상품 수정
		@RequestMapping(value = "/goods/modify", method = RequestMethod.POST)
		public String postGoodsModify(GoodsDTO goods,MultipartFile file,HttpServletRequest req) throws Exception {
		 logger.info("post goods modify");

		 // 새로운 파일이 등록되었는지 확인
		 if(file.getOriginalFilename() != null && file.getOriginalFilename() != "") {
		  // 기존 파일을 삭제
		  new File(uploadPath + req.getParameter("gdsImg")).delete();
		  new File(uploadPath + req.getParameter("gdsThumbImg")).delete();
		  
		  // 새로 첨부한 파일을 등록
		  String imgUploadPath = uploadPath + File.separator + "imgUpload";
		  String ymdPath = UploadFileUtils.calcPath(imgUploadPath);
		  String fileName = UploadFileUtils.fileUpload(imgUploadPath, file.getOriginalFilename(), file.getBytes(), ymdPath);
		  
		  goods.setGdsImg(File.separator + "imgUpload" + ymdPath + File.separator + fileName);
		  goods.setgdsThumbImg(File.separator + "imgUpload" + ymdPath + File.separator + "s" + File.separator + "s_" + fileName);
		  
		 } else {  // 새로운 파일이 등록되지 않았다면
		  // 기존 이미지를 그대로 사용
			 goods.setGdsImg(req.getParameter("gdsImg"));
			 goods.setgdsThumbImg(req.getParameter("gdsThumbImg"));
		  
		 }
		 
		 adminService.goodsModify(goods);
		 
		 return "redirect:/admin/index";
		}
	
		// 상품 삭제
		@RequestMapping(value = "/goods/delete", method = RequestMethod.POST)
		public String postGoodsDelete(@RequestParam("n") int gdsNum) throws Exception {
		 logger.info("post goods delete");

		 adminService.goodsDelete(gdsNum);
		 
		 return "redirect:/admin/index";
		}
	
	
	
		// ck 에디터에서 파일 업로드
		@RequestMapping(value = "/goods/ckUpload", method = RequestMethod.POST)
		public void postCKEditorImgUpload(HttpServletRequest req,
		          HttpServletResponse res,
		          @RequestParam MultipartFile upload) throws Exception {
		 logger.info("post CKEditor img upload");
		 
		 // 랜덤 문자 생성
		 UUID uid = UUID.randomUUID();
		 
	
		 OutputStream out = null;
		 PrintWriter printWriter = null;
		   
		 // 인코딩
		 res.setCharacterEncoding("utf-8");
		 res.setContentType("text/html;charset=utf-8");
		 
		 try {
		  
		  String fileName = upload.getOriginalFilename();  // 파일 이름 가져오기
		  byte[] bytes = upload.getBytes();
		  
		  // 업로드 경로
		 
		   
		  String ckUploadPath = uploadPath + File.separator + "ckUpload" + File.separator + uid + "_" + fileName;
		  
		  out = new FileOutputStream(new File(ckUploadPath));
		  out.write(bytes);
		  out.flush();  // out에 저장된 데이터를 전송하고 초기화
		  
		  String callback = req.getParameter("CKEditorFuncNum");
		  printWriter = res.getWriter();
		  String fileUrl = "/ckUpload/" + uid + "_" + fileName;  // 작성화면
		  
		  // 업로드시 메시지 출력
	
			 printWriter.println("<script type='text/javascript'>" +
			  "window.parent.CKEDITOR.tools.callFunction(" + callback+",'"+
			 fileUrl+"','이미지를 업로드하였습니다.')" +"</script>");
			
		  
		 //버전 업데이트로 인한 코드 변경
		 	  
		  printWriter.println("{\"filename\" : \""+fileName+"\", \"uploaded\" : 1, \"url\":\""+fileUrl+"\"}");
			
		  
		  
		  
		  
		  printWriter.flush();
		  
		 } catch (IOException e) { e.printStackTrace();
		 } finally {
		  try {
		   if(out != null) { out.close(); }
		   if(printWriter != null) { printWriter.close(); }
		  } catch(IOException e) { e.printStackTrace(); }
		 }
		 
		 return; 
		}
	
		
		
		// 주문 목록
		@RequestMapping(value = "/shop/orderList", method = RequestMethod.GET)
		public void getOrderList(Model model) throws Exception {
		 logger.info("get order list");
		   
		 List<OrderDTO> orderList = adminService.orderList();
		 
		 model.addAttribute("orderList", orderList);
		}

		// 주문 상세 목록
		@RequestMapping(value = "/shop/orderView", method = RequestMethod.GET)
		public void getOrderList(@RequestParam("n") String orderId,
		      OrderDTO order, Model model) throws Exception {
		 logger.info("get order view");
		 
		 order.setOrderId(orderId);  
		 List<OrderListDTO> orderView = adminService.orderView(order);
		 
		 model.addAttribute("orderView", orderView);
		}
		
		
		// 주문 상세 목록 - 상태 변경
		@RequestMapping(value = "/shop/orderView", method = RequestMethod.POST)
		public String delivery(OrderDTO order) throws Exception {
		 logger.info("post order view");
		   
		 adminService.delivery(order);

		 return "redirect:/admin/shop/orderView?n=" + order.getOrderId();
		}
		
		
		// 모든 소감(댓글)
		@RequestMapping(value = "/shop/allReply", method = RequestMethod.GET)
		public void getAllReply(Model model) throws Exception {
		 logger.info("get all reply");
		   
		 List<ReplyListDTO> reply = adminService.allReply();
		 
		 model.addAttribute("reply", reply);
		}
		
		@RequestMapping(value = "/shop/allReply", method = RequestMethod.POST)
		public String postDeleteReply(int repNum) {
			
		 adminService.deleteReply(repNum);
		 
		 return "redirect:/admin/shop/allReply";
		}
		
		
		
 }

