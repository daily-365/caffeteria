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
 
   <!-- 다음 주소 api -->
  <script type="text/javascript" src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
  
  
 <style>
  span {
  font-weight: bold;
  font-size:15px;
    }
  .cartContent{
  
   border-top: 3px solid gray;
  }
  p{
   font-weight: bold;
   font-size: 15px;
  }
  
  .listResult {
  
     border-top: 3px solid black;
     
  
  }
  
  .orderInfo{
  display: none;
  border-top: 3px solid black;
  
  }
 </style>

   
  
    
  <div class="container-fluid" > 
  
  <header class="container">
     <br><br>
   <h1 class="text-center">카트 리스트</h1>
   <br><br>
   <button type="button" class="btn" onclick="javascript: history.back();">뒤로가기</button>
    
  </header> 
  

 
<section id="content" class="container text-center">
  <p class="text-center"><input id="allCheck" name="allCheck" type="checkbox">전체 선택
  <script type="text/javascript">
  $("#allCheck").on('click',function(){
  
    var chk = $("#allCheck").prop("checked");
    
    if(chk){
     $(".chBox").prop("checked",true);
    
    }else{
     $(".chBox").prop("checked",false);
    
    }  
  
  });
  
  
  </script>
  
  </p>
  
  <div class="delBtn">
   <button type="button" id="selectDelete_btn" class="btn btn_default col-sm-2 col-sm-offset-5">선택 삭제</button>
   <script>
 $("#selectDelete_btn").click(function(){
  var confirm_val = confirm("정말 삭제하시겠습니까?");
  
  if(confirm_val) {
   var checkArr = new Array();
   
   $("input[class='chBox']:checked").each(function(){
    checkArr.push($(this).attr("data-cartNum"));
   });
    
   $.ajax({
    url : "/shop/myPage/deleteCart",
    type : "post",
    data : { chBox : checkArr },
    success : function(result){
     alert('삭제 되었습니다.');
       location.href="/shop/myPage/cartList";
    }
   });
  } 
 });
</script>
   
    </div>
  <br><br><br><br>
  
 <ol>
 <c:set var="sum" value="0"/>
 
 
 <c:forEach items="${cartList}" var="cartList">
      
  <li class="cartContent">
  <br>
  <div class="checkBox">
  <p class="text-center"><input name="chBox" class="chBox" data-cartNum="${cartList.cartNum}" type="checkbox">
  <script type="text/javascript">
   $(".chBox").on('click',function(){
     
     $("#allCheck").prop("checked",false);
     
    
   });
  
  
  
  </script>
  
  
  <br>
  </p>
  
  
  </div>
  
  <br>
  <div class="thumb">
  
  
   <span>상품 이미지 : </span>
    <img src="${cartList.gdsThumbImg}" style="width:200px;"/>
   </div>
   <br>
   
   <div class="gdsInfo">
    
     <span>상품명 : </span>${cartList.gdsName}<br/> <br>
     <span>개당 가격 : </span><fmt:formatNumber pattern="###,###,###" value="${cartList.gdsPrice}" /><br /> <br>
     <span>구입 수량 : </span>${cartList.cartStock}<br /> <br>
     <span>최종 가격 : </span><fmt:formatNumber pattern="###,###,###" value="${cartList.gdsPrice * cartList.cartStock}" /> <br>
          
    <div class="delete"><br><br>
     <button type="button" id="delete_${cartList.cartNum}_btn" data-cartNum="${cartList.cartNum}" class="btn btn-default col-sm-offset-5 col-sm-2 ">삭제</button><br><br>
        <script type="text/javascript">
  $("#delete_${cartList.cartNum}_btn").click(function(){
   var confirm_val = confirm("정말 삭제하시겠습니까?");
   
   if(confirm_val) {
    var checkArr = new Array();
    
    checkArr.push($(this).attr("data-cartNum"));
               
    $.ajax({
     url : "/shop/myPage/deleteCart",
     type : "post",
     data : { chBox : checkArr },
     success : function(result){
      if(result == 1) {     
        alert('삭제 되었습니다.');
        location.href="/shop/myPage/cartList";
      } else {
       alert("삭제에 실패하였습니다.");
      }
     }
    });
   } 
  });
 </script>
        </div>
    <br><br>
    
    
   </div>
   </li>
   
   
   <c:set  var="sum"  value="${sum + ( cartList.gdsPrice * cartList.cartStock )}"/>
   <c:set var="cart" value="${cartList}"/>
   
   </c:forEach>
   
   
   
   </ol>
   
   
    <c:if test="${cart ne null }">
    <div class="listResult">
   <br><br>
    <div class="sum">
    총 결재 금액 :  <fmt:formatNumber value="${sum}" pattern="###,###,###" />원<br><br>
    </div>
    <div class="orderOpen">
      <button class="btn btn-default col-sm-2 col-sm-offset-5" type="button">주문 정보 입력</button>
      <br><br>
    </div>
    
    </div>
    <br><br><br><br>
   <div class="orderInfo">
 <form role="form" method="post" autocomplete="off">
         <br><br>
        <h2 class="text-center">주문 정보 입력</h2>
     <br><br>
  <input type="hidden" name="amount" value="${sum}" />
    
        
  <div class="form-group">
   <label for="" >수령인</label>
   <input type="text"  name="orderRec" id="orderRec" required="required" />
  </div>
  
  <div class="form-group">
   <label for="orderPhone">수령인 연락처</label>
   <input type="text" name="orderPhone" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" id="orderPhone" required="required" />
  </div>
  
   <hr>
  
   <div class="form-group">
  <input type="button" class="btn" onclick="execDaumPostcode()" value="우편번호 찾기" ><br>
  </div>
  
 <div class="form-group">
   <label for="userAddr1">우편 번호</label>
   <input type="text" name="userAddr1" id="userAddr1" placeholder="우편번호를 입력해 주세요" required="required">
   </div>
    <div class="form-group">
   <label for="userAddr2">주소</label>
<input type="text" name="userAddr2" id="userAddr2" placeholder="주소를 입력해 주세요" required="required"><br>
</div>
<div class="form-group">
   <label for="userAddr3">상세 주소</label>
<input type="text"  name="userAddr3" id="userAddr3" placeholder="상세주소를 입력해 주세요" required="required">
</div>

   <br>   
  <div class="form-group">
   <button type="submit" class="btn order_btn">주문</button>
   <button type="button" class="btn cancel_btn">취소</button> 
   

   <script type="text/javascript">
    function execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
 
                // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 도로명 조합형 주소 변수
 
                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }
                // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
                if(fullRoadAddr !== ''){
                    fullRoadAddr += extraRoadAddr;
                }
 
                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('userAddr1').value = data.zonecode; //5자리 새우편번호 사용
                document.getElementById('userAddr2').value = fullRoadAddr;
                document.getElementById('userAddr3').focus();
            }
        }).open();
    }
</script>

 
   
   <br><br>
   <script type="text/javascript">
    $(".orderOpen").on('click',function(){
    
    $('.orderInfo').slideDown();
          
    });
     
   </script>
    <script type="text/javascript">
    $(".cancel_btn").on('click',function(){
    
    $('.orderInfo').slideUp();
          
    });
     
   </script>
  

 
  </div>
  

 </form> 
 
 </div>
 </c:if>
   
   <c:if test="${cart eq null }">
   <script type="text/javascript">
   alert('카드에 담은 상품이 없습니다..')
     location.href="/shop/myPage/main";
   
   </script>
   </c:if>
 
   
   </section>
   

   
   </div>
   