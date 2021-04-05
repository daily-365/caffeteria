<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
 
 <script type="text/javascript" src="/../../resources/js/jquery-3.5.1.min.js"></script>
 
 <script type="text/javascript">
  
$(document).ready(function(){

 alert('로그아웃 되었습니다.');
location.href='${pageContext.request.contextPath}/';


})
 
 </script>