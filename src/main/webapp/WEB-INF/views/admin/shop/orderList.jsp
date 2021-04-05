<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
 <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
    
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
   <h1 class="text-center">주문 내역</h1>
   <br><br>
   <button type="button" class="btn" onclick="javascript: location.href='/admin/index';">홈으로 이동</button>
   
    
  </header> 
  
  
  <section class="container">
 
    <c:forEach var="orderList" items="${orderList}" >
   <br>
   <p>주문번호 : <a href="/admin/shop/orderView?n=${orderList.orderId }">${orderList.orderId }</a> </p>
   <p>수령인 : ${orderList.orderRec }</p>
   <p>주소 :  ${orderList.userAddr1} ${orderList.userAddr2}${orderList.userAddr3}</p>
   <p>가격 :  <fmt:formatNumber value="${orderList.amount}" pattern="###,###,###"/>원</p>
   <p>배송 상태 : ${orderList.delivery}</p>
    <br>
  
   </c:forEach>
  
  
  
  
  </section>
  
  
  
  
  
  </div>