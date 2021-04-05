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
  
  <h1 align="center">상품 정보</h1>
 
 <br>
 
    <img alt="logo" src="/../resources/img/logo.png" style="width:250px; height: 200px; margin-left:42%; ">
   
   <br><br>
   
   <form role="form" method="post" autocomplete="off" enctype="multipart/form-data" >
   
   <input type="hidden" name="n" value="${goods.gdsNum}">
   
    <div class="form-group col-sm-4 col-sm-offset-4">
    <label>상품코드</label>
    ${goods.cateCode}
    </div>
   
   <div class="form-group col-sm-4 col-sm-offset-4">
<label for="gdsName">상품명</label>
${goods.gdsName}
</div>

<div class="form-group col-sm-4 col-sm-offset-4">
<label for="gdsPrice">상품가격</label>
<fmt:formatNumber value="${goods.gdsPrice}" pattern="###,###,###"/>
</div>
    
    <div class="form-group col-sm-4 col-sm-offset-4">
<label for="gdsStock">상품수량</label>
${goods.gdsStock}
</div>

    
   <div class="form-group col-sm-4 col-sm-offset-4">
   <p style="font-weight: bold">상품소개</p>
   <textarea rows="5" cols="50" name="gdsDes">${goods.gdsDes}</textarea>
   
 </div>
 
 
     <div class="form-group col-sm-4 col-sm-offset-4">
<label for="gdsImg">이미지</label>
<%-- ${goods.gdsImg}  이미지 경로 --%>

<img src="${goods.gdsImg}"/>


</div>
 

    <div class="form-group col-sm-4 col-sm-offset-4">
   <button type="button" id="modify_btn" class="btn btn-warning">수정하기</button>
   <button type="button" id="delete_btn" class="btn btn-danger">삭제하기</button>
   </div>
     <script type="text/javascript">
 
 var formObj = $("form[role='form']"); 
 
   $('#modify_btn').on('click',function(){
     
    formObj.attr('action','/admin/goods/modify');
    formObj.attr('method','get');
    alert('수정화면으로 이동합니다.');
    formObj.submit();
   
  });
 
  $('#delete_btn').on('click',function(){
    
    formObj.attr('action','/admin/goods/delete');
    formObj.submit();
  
  });
 
  </script>
    
   </form>
   
   </div>