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
    
     
    
    
  <div class="container-fluid">
  
   <br><br>
   
    <h1 class="text-center">상품 정보</h1>
    
     <br><br>
  
  
  
  
   <table class="table table-hover" >
   
 <c:forEach items="${list}" var="list">
    <thead>
  <tr> 
  <th>등록번호</th>
  <th>상품이미지</th>
  <th>상품명</th>
  <th>상품가격</th>
  <th>재고수량</th>
  <th>상품설명</th>
  <th>등록일자</th>
  </tr>
  </thead>
   <tbody>
  <tr>
  <td>${list.cateCode}</td>
   <td><img src="${list.gdsImg}" style="width: 150px;"></td>
  <td><a href="/shop/view?n=${list.gdsNum }">${list.gdsName }</a></td>
  <td><fmt:formatNumber value="${list.gdsPrice}" pattern="###,###,###원"/></td>
   <td>${list.gdsStock}개</td>
   <td>${list.gdsDes}</td>
   <td><fmt:formatDate value="${list.gdsDate}" pattern="yyyy-MM-dd hh:MM:ss"/></td>
  </tr>
  </tbody>
  
    
</c:forEach>
  </table>
  
  
   
  </div>
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  