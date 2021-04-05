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
 
 <style type="text/css">
  ul>li {
  display: inline-block;
  }
  span{
    font-weight: bold;
  }
 
 </style>
    
  <div class="container-fluid" > 
  
  <header class="container">
     <br><br>
   <h1 class="text-center">주문 상세 내역</h1>
   <br><br>
   <button type="button" class="btn" onclick="javascript: location.href='/admin/shop/orderList';">상품 리스트로</button>
    <br><br> <br><br>
    
  </header> 
  
  
  <section class="container-fulid text-center">
<div class="orderInfo">
  <c:forEach items="${orderView}" var="orderView" varStatus="status">
  
  <c:if test="${status.first}">
   <p><span>주문자 : </span>${orderView.userId}</p>
   <p><span>수령인 : </span>${orderView.orderRec}</p>
   <p><span>주소 : </span>(${orderView.userAddr1}) ${orderView.userAddr2} ${orderView.userAddr3}</p>
   <p><span>가격 : </span><fmt:formatNumber pattern="###,###,###" value="${orderView.amount}" /> 원</p>
   
   <p><span>배송 상태 : </span>${orderView.delivery}</p>
    
<div class="deliveryChange">
 <form role="form" method="post" class="deliveryForm">
 
  <input type="hidden" name="orderId" value="${orderView.orderId}" />
  <input type="hidden" name="delivery" class="delivery" value="" />
  
  <button type="button" class="delivery1_btn btn">배송 중</button>
  <button type="button" class="delivery2_btn btn">배송 완료</button>
  
  <script>
   $(".delivery1_btn").click(function(){
    $(".delivery").val("배송 중");
    run();
   });
   
   $(".delivery2_btn").click(function(){
    $(".delivery").val("배송 완료");
    run();
    
   });
   
   function run(){
    $(".deliveryForm").submit();
   }
  
  </script>
 </form>
</div>
  
  </c:if>
  <br><br>
   </c:forEach>
   
</div>

<ul class="orderView">
 <c:forEach items="${orderView}" var="orderView">     
 <li>
  <div class="thumb">
   <img src="${orderView.gdsThumbImg}" />
  </div>
  <div class="gdsInfo">
   <p>
    <span>상품명 : </span>${orderView.gdsName}<br />
    <span>개당 가격 : </span><fmt:formatNumber pattern="###,###,###" value="${orderView.gdsPrice}" /> 원<br />
    <span>구입 수량 : </span>${orderView.cartStock} 개<br />
    <span>최종 가격 : </span><fmt:formatNumber pattern="###,###,###" value="${orderView.gdsPrice * orderView.cartStock}" /> 원                  
   </p>
  </div>
 </li>    
 &nbsp; &nbsp; &nbsp; &nbsp; 
 </c:forEach>
</ul>
</section>


</div>
 
   
   
  
    
 