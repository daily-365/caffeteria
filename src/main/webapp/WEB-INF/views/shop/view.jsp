<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
 
<!-- 부트스트랩 CDN-->

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
<script src="//netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css">

  <script type="text/javascript" src="/../resources/js/jquery-3.5.1.min.js"></script>
  
    <style type="text/css">
     .bold{
     font-weight: bold;
       }
       
       .replyModal{
       position:absolute; 
       top:0; left:0;
       background-color: black;
       border: 3px solid black;
       opacity: 75%;
       border-radius:10%;
        display:none;
        color: #fff;
     }
    
  
      </style>
       
    
  <div class="container">
  
        
     <br><br>
     
    <h1 class="text-center">상품 상세 정보</h1>      
      <br><br>      
      
  <form role="form" method="post" autocomplete="off"> 
  
   <input type="hidden" name="gdsNum" value="${view.gdsNum}">
  
     <div class="form-group col-sm-4 col-sm-offset-4">
     <label for="gdsImg">상품이미지</label>
     <img src="${view.gdsThumbImg}" style="width:200px;">
       
    </div>
      
   <div class="form-group col-sm-4 col-sm-offset-4">
<label for="gdsName">상품명</label>
   <p class="form-control">${view.gdsName}</p>
</div>

<div class="form-group col-sm-4 col-sm-offset-4">
<label for="gdsPrice">상품가격</label>
<p class="form-control" ><fmt:formatNumber value="${view.gdsPrice}" pattern="###,###,###"/></p>
</div>
    
    <c:if test="${view.gdsStock ne 0}">
    <div class="form-inline col-sm-4 col-sm-offset-4">
<label for="gdsStock">상품수량</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<button type="button" class="btn btn-info form-control text-center" id="plus">+</button>
<input  id="numBox" class="form-control text-center" type="number" min="1" max="${view.gdsStock}" value="1" readonly="readonly" /> 
<button type="button" class="btn btn-info form-control text-center" id="minus">-</button>
<br><br>

 
<script type="text/javascript">
 
 $("#plus").on('click',function(){
   var num = $("#numBox").val();
   var plusNum = Number(num) + 1;
   
   if(plusNum >= ${view.gdsStock}) {
    $("#numBox").val(num);
   } else {
    $("#numBox").val(plusNum);          
   }
  });
  
 $("#minus").on('click',function(){
   var num = $("#numBox").val();
   var minusNum = Number(num) - 1;
   
   if(minusNum <= 0) {
    $("#numBox").val(num);
   } else {
    $("#numBox").val(minusNum);          
   }
  });
  
</script>


</div>

</c:if>

   <c:if test="${view.gdsStock eq 0 }">
 
   <p style="color: red;">상품 수량이 부족 합니다.</p>
 
 </c:if>
   
   <div class="form-group col-sm-4 col-sm-offset-4">
   <p style="font-weight: bold;">상품소개</p>
   <p class="form-control">${view.gdsDes}</p>
    </div>
    
   
   <div class="form-group col-sm-4 col-sm-offset-4 addToCart">
    <button id="addCart_btn" class="btn btn-warning" type="button">카트에 담기</button>
    
    <script type="text/javascript">
      $("#addCart_btn").click(function(){
      var gdsNum =$("#gdsNum").val();
      var cartStock=$("#numBox").val();   
      
      var data ={
      gdsNum : gdsNum,
      cartStock : cartStock      
      };
         
      $.ajax({
      url: "/shop/view/addCart",
      type:"post",
      data: data,
      success : function(result) {
      if(result==1){
      alert("카트 담기 성공");
      $("#numBox").val("1");
      location.href='${pageContext.request.contextPath}/shop/myPage/cartList';
      
       }else{
       alert("회원만 사용 가능합니다.");
       location.href='${pageContext.request.contextPath}/member/signin';
       $("#numBox").val("1");
       }
      },
      error : function() {
      alert("카트 담기 실패.");
      
      }
      
      });
              
      });    
        
    </script>
    
    
    
    
    </div>
  
  
  </form> 
  
  <div class="form-group col-sm-4 col-sm-offset-4" id="reply">

    <br><br>
    
   <c:if test="${member eq null }">  
   <p>소감을 남기시려면 <a href="/member/signin">로그인</a>을 해주세요</p>
   </c:if>
   
   <c:if test="${member ne null }">
   <form role="form" class="replyForm"  method="post" autocomplete="off">
     <input type="hidden" id="gdsNum" name="gdsNum"  value="${view.gdsNum}"> 
       
   
    <label for="repCon">상품 소감</label>
      <textarea id="repCon" name="repCon" rows="5" cols="50" required="required" placeholder="소감을 남겨주세요" ></textarea>
     
      
      <br><br>
           
             
  
         <button type="button" id="reply_btn" class="btn btn-success">소감 남기기</button>
    
      <script type="text/javascript">
     
 $("#reply_btn").click(function(){
  
  var formObj = $(".replyForm form[role='form']");
  var gdsNum = $("#gdsNum").val();
  var repCon = $("#repCon").val()
  
  var data = {
    gdsNum : gdsNum,
    repCon : repCon
    };
  console.log(data)
  
  $.ajax({
   url : "/shop/view/registReply",
   type : "post",
   data : data,
   success : function(){
    replyList();
    $('#repCon').val("");
   }
  });
 });
       
      
      
      </script>
    
     
    
   </form>
   
   </c:if>
   
   <br><br>
   
  <section class="replyList">
  
     <div class="replyModal">
           <div class="replyContent">
           <div class="form-group">
           <h3 class="text-center">소감 수정</h3>
           </div>
            <div class="form-group">
              <textarea id="modal_repCon" rows="5" cols="50" ></textarea>
            </div>
              <div class="form-group text-center">
              <button type="button" class="btn btn-primary" id="modify_btn">수정하기</button>
              <button type="button"  class="btn btn-danger" id="cancel_btn">취소</button>
              
              </div>
                   
          </div>
      
          </div>
              <script type="text/javascript">
         $(document).on('click','#modify',function(){
         
         $('.replyModal').fadeIn();
         
         var repNum = $(this).attr("data-repNum");
         var repCon = $(this).parent().parent().children(".replyContent").text();
         
         $("#modal_repCon").val("");
         $("#modal_repCon").attr("style","color:black; font-weight: bold;");
         $("#modify_btn").attr("data-repNum",repNum);
         
         });
                  
                  
         $('#cancel_btn').click(function(){
         
         $('.replyModal').fadeOut();
         
         });
       
       </script> 
     
   <ol class="text-center" >
 
   
   <script type="text/javascript">
   
   function replyList(){
   var gdsNum = ${view.gdsNum};
 $.getJSON("/shop/view/replyList" + "?n=" + gdsNum, function(data){
  var str = "";
  
  $(data).each(function(){
   
   
   var repDate = new Date(this.repDate);
   repDate = repDate.toLocaleDateString("ko-US")
   
   str += "<li data-repNum='" + this.repNum + "'>"
     + "<div class='userInfo'>"
     + "<p class='userName'>"+"<span class='bold'>"+"작성자 : "+"</span>" + this.userName + "</p>"
     + "<p class='date'>"+"<span class='bold'>"+"작성일 : "+"</span>" + repDate + "</p>"
     + "</div>"
     + "<p class='replyContent'>"+"<span class='bold'>"+"소감 : "+"</span>" + this.repCon + "</p>"
     +"<div class='replyFooter'>"
     +"<c:if test='${member != null }'>"
     +"<button id='delete' class='btn btn-danger'  type='button' data-repNum='"+this.repNum+"'>삭제하기</button>"
     +"<button id='modify' class='btn btn-warning' type='button' data-repNum='"+this.repNum+"'>수정하기</button>"
     +"</c:if>"
     +"<br><br><br>"
     +"</div>"
     + "</li>";           
  });
  
  $("section.replyList ol").html(str);
 });

   }  
   
      </script>
      
     <script type="text/javascript">
   
      $(document).on("click","#delete",function(){
       
      var deleteConfirm = confirm("정말로 삭제하시겠습니까??");
      
      if(deleteConfirm){
       
      var data= {repNum : $(this).attr("data-repNum") };
       
       $.ajax({
        url: "/shop/view/deleteReply",
        type: "post",
        data: data,
        success: function(result) {
          if(result==1){
           replyList();
           alert('댓글이 삭제 되었습니다.');
          }else{
          
          alert('작성자 본인만 할 수 있습니다.'); 
                 
        }     
      },
      error : function(){
        alert("로그인 후 이용해 주세요");
      }
      
      });   
     
     }
     
    });
   
 
   </script>
   
    <script type="text/javascript">
    
  $("#modify_btn").on('click',function(){
 var modifyConfirm = confirm("정말로 수정하시겠습니까?");
 
 if(modifyConfirm) {
   var data = {
     repNum : $(this).attr("data-repNum"),
     repCon : $("#modal_repCon").val()
    };
    
    console.log(data);

  
  $.ajax({
   url : "/shop/view/modifyReply",
   type : "post",
   data : data, 
   success : function(result){
    
    if(result == 1) {
     replyList();
     alert('글이 수정 되었습니다.')
     $(".replyModal").fadeOut();
      
    } else {
     alert("작성자 본인만 할 수 있습니다.");       
    }
   },
   error : function(){
    alert("로그인 후 이용해 주세요.")
   }
  });
 }
 
});   
   
   </script>
   
   
       
      </ol>
         
   
 
     <script type="text/javascript">
  
   replyList();
  
  </script>
   

  
            
   </section>
   

</div>
  
  
  </div>
  
 