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
   <h1 class="text-center">주문 상세 내역</h1>
   <br><br>
   <button type="button" class="btn" onclick="javascript: history.back();">뒤로가기</button>
   
    
  </header> 
  
  
  <section class="container-fulid">
     
      <table class="table table-hover">
      
      <c:forEach var="orderView" items="${orderView}">
     <thead>
     <tr>
     <th>수령인</th>
     <th>주소</th>
     <th>가격</th>
     
      <th>상품 이미지</th> 
      <th>상품명</th>
      <th>개당 가격</th>   
      <th>구입 수량</th>   
      <th>최종 가격</th> 
      <th>배송 상태</th>
     </tr>
     </thead>
     
     <tbody>
     <tr>
     <td>${orderView.orderRec }</td>
     <td>${orderView.userAddr1 } ${orderView.userAddr2 } ${orderView.userAddr3 }</td>
     <td>${orderView.amount}</td>    
    
     <td><img src="${orderView.gdsThumbImg}"style="width: 150px;"></td>
     <td>${orderView.gdsName }</td>
     <td>${orderView.gdsPrice }</td>
     <td>${orderView.cartStock }</td>
     <td>${orderView.gdsPrice * orderView.cartStock}</td>   
     <td>${orderView.delivery}</td> 
     </tr>
     </tbody>
     
     </c:forEach>
     </table>
   
       
     
     
  
  
  </section>
  
  
  
  
  
  
  
  </div>
  
  
  
  