<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
    <!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<!-- <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script> -->
  
  <style type="text/css">
 
  .container-fluid{
  
   background-color: #000;
   opacity: 70%;
  }
  
  ul>li>a {
  
  color: #fff;
  font-size: 15px;
   
  }
 


 </style>
 
 
<div class="container-fluid">

<br><br>

    <h1 align="center" style="color: navy; font-weight: bold;">Admin Page</h1>
    
    <br>
  
  <c:if test="${member eq null}">
    
    <button type="button" class="btn btn-primary col-sm-2 col-sm-offset-4"
    onclick="javascript: location.href='${pageContext.request.contextPath}/member/signin'">로그인</button>
    <button type="button"  class="btn btn-primary col-sm-2"
    onclick="javascript: location.href='${pageContext.request.contextPath}/member/signup'">회원가입</button>
    
  
    
 </c:if>
    
    
   <c:if test="${member ne null }">
   
     
  
       <script type="text/javascript">
      alert('관리자님 환영합니다');
       </script>
       
        
         
         <a type="button"  class="col-sm-3 pull-right" style="font-weight: bold; font-size: 20px; font-style: italic;"
     onclick="javascript: location.href='${pageContext.request.contextPath}/member/signout'">LogOut</a>
   
   </c:if>
   
     
   <br><br><br><br>
   
    
    <h2 style="color: blue;">CateGory</h2>
    
   <ul class="nav nav-pills nav-stacked">
     
  <li role="presentation"><a href="/admin/goods/register">상품등록</a></li>
  <li role="presentation"><a href="/admin/goods/list">상품목록</a></li>
  <li role="presentation"><a href="/admin/shop/orderList">주문목록</a>
  <li role="presentation"><a href="/admin/shop/allReply">상품소감</a></li>

   </ul>
     
       <br><br><br>
        
  </div>
