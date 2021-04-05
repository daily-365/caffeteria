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
    
 <script type="text/javascript" src="/../../resources/js/jquery-3.5.1.min.js"></script>
 
 <div class="container-fluid">
 
  <br><br>
  
  <h1 align="center">상품 목록</h1>
 
 <br>
 
    <img alt="logo" src="/../resources/img/logo.png" style="width:250px; height: 200px; margin-left:42%; ">
    
   <br><br>
   
   <table class="table table-hover">
    
    <thead>
    <tr>
    <th>번호</th> 
    <th>이미지</th>
    <th>이름</th>
    <th>카테고리</th>
    <th>가격</th>
    <th>수량</th>
    <th>등록날짜</th>
    </tr>
    </thead>
   
   
     <tbody>
     <c:forEach var="list" items="${list}">
     <tr>
     <td>${list.gdsNum}</td>
     <td><img src="${list.gdsThumbImg}" style="width: 150px;"/></td>
     <td><a href="/admin/goods/view?n=${list.gdsNum}">${list.gdsName}</a></td>
     <td>${list.cateName}</td>
     <td>${list.gdsPrice}</td>
     <td>${list.gdsStock}</td>
     <td> <fmt:formatDate value="${list.gdsDate}" pattern="yyyy-MM-dd"/></td>
     </tr>
     </c:forEach>
     </tbody>
      
   
   </table>

 
 </div>