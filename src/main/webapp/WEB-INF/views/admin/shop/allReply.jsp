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
 
 .replyInfo{
    border-top: 3px solid gray;
    
  } 

 </style>
    
  <div class="container-fluid" > 
  
  <header class="container">
     <br><br>
   <h1 class="text-center">모든 소감 (댓글)</h1>
   <br><br>
   <button type="button" class="btn" onclick="javascript: history.back();">뒤로가기</button>
      
  </header> 
  
  <section class="container"> 
  
  <c:forEach items="${reply}" var="reply">
     <br><br>
     <div class="replyInfo">
     <br><br>
    <p>작성된 상품: <a href="/shop/view?n=${reply.gdsNum}">바로가기</a></p>
    <p>아이디 : ${reply.userId } </p>
    <p>작성자:${reply.userName }</p>
    <p>댓글 내용 : ${reply.repCon }</p>
    <p>등록 일자 : <fmt:formatDate value="${reply.repDate }" pattern="yyyy-MM-dd"/></p>
    </div>
     <br>                          
 
    
  <form class="deleteForm"  role="form" method="post" autocomplete="off" >
       <input type="hidden" name="repNum" value="${reply.repNum}">
       <button type="button"  class="btn" onclick="submitFunc()">삭제</button>
      <script type="text/javascript">
     
    function submitFunc(){
    	
    	alert('삭제 되었습니다.')
        document.querySelector('.deleteForm').submit();
    	

    }
      
      </script>
      

  </form>
    
     </c:forEach>
  </section>
  
  
  
  
  </div>