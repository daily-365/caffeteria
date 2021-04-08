<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<!-- <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script> -->
    
 <script type="text/javascript" src="/../../resources/js/jquery-3.5.1.min.js"></script>
 
 
 
 
 <div class="container">
 
 <br><br>
 
 <h1 align="center">로그인</h1>

<br>

<img alt="logo" src="/../resources/img/logo.png" style="width:250px; height: 200px; margin-left:42%; ">

<form  role="form" method="post" autocomplete="off" >

<div class="form-group col-sm-4 col-sm-offset-4">
<label for="userId">아이디</label>
<input class="form-control" type="email" id="userId" name="userId" placeholder="example@email.com" required="required">
</div>

<div class="form-group col-sm-4 col-sm-offset-4">
<label for="userPass">패스워드</label>
<input class="form-control" type="password" id="userPass" name="userPass" placeholder="비밀번호를 입력해 주세요" required="required">
</div>


<button type="submit" class="btn btn-primary col-sm-2 col-sm-offset-4" id="signin_btn" name="signin_btn">로그인</button>
<button type="button" class="btn btn-danger col-sm-2" 
onclick="javasceript: location.href='${pageContext.request.contextPath}/member/signup'">회원가입</button>

<c:if test="${msg eq false }">
<script type="text/javascript">
alert('아이디와 비밀번호를 확인해 주세요.');
</script>

</c:if>



</form>

</div>