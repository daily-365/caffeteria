<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

         <!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<!-- <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script> -->
 <script type="text/javascript" src="/../resources/js/jquery-3.5.1.min.js"></script>
 
    
  <div class="container-fluid" > 
  
  <header class="container">
     <br><br>
   <h1 class="text-center">마이페이지</h1>
   <br><br>
   <button type="button" class="btn" onclick="javascript: history.back();">뒤로가기</button>
   
    
  </header>
   <br><br>
   <section class="container">
    <button type="button" class="btn btn-default col-sm-2 col-sm-offset-4" onclick="javascript: location.href='/shop/myPage/cartList';">카트 리스트</button>
    <button type="button" class="btn btn-default col-sm-2" onclick="javascript: location.href='/shop/myPage/orderList';">주문 리스트</button>
   
   </section>
  
  
  
  </div>