<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<script type="text/javascript"  src="/../../resources/js/jquery-3.5.1.min.js"></script>

<script type="text/javascript">

 $(document).ready(function(){

  //ex)email@example.com
  var userIdRegex = RegExp(/^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i);

 //특수문자 / 문자 / 숫자 포함 형태의 8~15자리 이내의 암호 정규식
  var userPassRegex = RegExp(/^.*(?=^.{8,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/);

 //2~10자의 한글, 영문, 숫자만 사용할 수 있습니다
  var userNameRegex =RegExp(/[0-9]|[a-z]|[A-Z]|[가-힣]/);
 
//ex)01012341234
  var userPhoneRegex=RegExp(/^\d{3}\d{3,4}\d{4}$/);
 
 
    $('#userId').on('blur',function(){
    
    
    if($('#userId').val()==""){
         $('#userIdCheck').text("아이디를 입력해 주세요");
        $('#userIdCheck').css('color','green');
        $('#userIdCheck').focus(); 
      
     
     }else if(!userIdRegex.test($('#userId').val())){
     
        $('#userIdCheck').text("아이디 형식에 맞춰 주세요.");
        $('#userIdCheck').css('color','red');
        $('#userIdCheck').focus();     
        
     }
     else{
        $('#userIdCheck').text("사용가능한 아이디 입니다.");
        $('#userIdCheck').css('color','blue');  
        
       }
    });
 
 
 
 
    $('#userPass').on('blur',function(){
   
      if($('#userPass').val()==""){
       
       $('#userPassCheck').text("비밀번호를 입력해 주세요");
        $('#userPassCheck').css('color','green');
       $('#userPassCheck').focus(); 
     
     }else if(!userPassRegex.test($('#userPass').val())){
     
        $('#userPassCheck').text("비밀번호는 특수문자,문자,숫자 포함 형태의 8~15자리 이내의 암호 형식 입니다.");
        $('#userPassCheck').css('color','red');
        $('#userPassCheck').focus();     
        
     }else{
        $('#userPassCheck').text("사용가능한 비밀번호 입니다.");
        $('#userPassCheck').css('color','blue');  
        
       }
      
   });
   
       $('#userPassOk').on('blur',function(){
   
    if($('#userPassOk').val()==""){
       
        $('#userPassOkCheck').text('비밀번호를 확인해 주세요.');
         $('#userPassOkCheck').css('color','green');
         $('#userPassOkCheck').focus();  
     
     }else if($('#userPassOk').val()!=$('#userPass').val()){
     
       $('#userPassOkCheck').text('비밀번호가 일치하지 않습니다.');
       $('#userPassOkCheck').css('color','red');
        $('#userPassOkCheck').focus();    
    
     }else{
     
      $('#userPassOkCheck').text('비밀번호가 일치합니다.');
       $('#userPassOkCheck').css('color','blue');
        
      }
      
   });
   
   
       $('#userName').on('blur',function(){
   
     if($('#userName').val()==""){
       
           $('#userNickCheck').text('닉네임을 입력해 주세요');
            $('#userNickCheck').css('color','green');
          $('#userNickCheck').focus();
     
     }else if(!userNameRegex.test($('#userName').val())){
     
         $('#userNickCheck').text('닉네임은 2~10자의 한글, 영문, 숫자만 사용할 수 있습니다');
       $('#userNickCheck').css('color','red');
        $('#userNickCheck').focus();
    
     
     }else{
     
      $('#userNickCheck').text('사용 가능한 닉네임 입니다.');
       $('#userNickCheck').css('color','blue');

         }
      
   });
   
       $('#userPhone').on('blur',function(){
   
   if($('#userPhone').val()==""){
       
       $('#userPhoneCheck').text('휴대폰 번호를 입력해 주세요');
       $('#userPhoneCheck').css('color','green');
       $('#userPhoneCheck').focus();
     
     }else if(!userPhoneRegex.test($('#userPhone').val())){
     
         $('#userPhoneCheck').text('휴대폰 형식에 맞춰 주세요 (ex : 01012341234)');
       $('#userPhoneCheck').css('color','red');
        $('#userPhoneCheck').focus();
    
     
     }else{
     
          $('#userPhoneCheck').text('사용가능한 휴대폰 번호 입니다.');
       $('#userPhoneCheck').css('color','blue');
     
     }
      
   });
   
   
   
 });




</script>



<div class="container">

<br><br>

<h1 align="center">회원 가입</h1>

<img alt="logo" src="/../resources/img/logo.png" style="width:250px; height: 200px; margin-left:40%; ">

<form  role="form" class="signupForm" method="post" autocomplete="off" >
<div class="form-group col-sm-4 col-sm-offset-4">
<label for="userId">아이디</label>
<input class="form-control" type="text" id="userId" name="userId" placeholder="example@email.com" required="required">
<div id="userIdCheck"></div>
</div>

<div class="form-group col-sm-4 col-sm-offset-4">
<label for="userPass">비밀번호</label>
<input class="form-control" type="password" id="userPass" name="userPass" placeholder="비밀번호를 입력해 주세요" required="required">
<div id="userPassCheck"></div>
</div>

<div class="form-group col-sm-4 col-sm-offset-4">
<label for=userPassOk>비밀번호 확인</label>
<input class="form-control" type="password" id="userPassOk" name="userPassOk" placeholder="비밀번호를 한번 더 입력해 주세요" required="required">
<div id="userPassOkCheck"></div>
</div>

<div class="form-group col-sm-4 col-sm-offset-4">
<label for="userName">닉네임</label>
<input class="form-control" type="text" id="userName" name="userName" placeholder="닉네임을 입력해 주세요" required="required">
<div id="userNickCheck"></div>
</div>

<div class="form-group col-sm-4 col-sm-offset-4">
<label for="userPhone">연락처</label>
<input class="form-control" type="text" id="userPhone" name="userPhone" placeholder="연락처를 입력해 주세요" required="required">
<div id="userPhoneCheck"></div>
</div>

<div class="form-group">
<button class="btn btn-primary col-sm-2 col-sm-offset-4" type="submit" id="sign_btn" name="sign_btn">회원가입</button>
 <button class="btn btn-danger col-sm-2 " type="reset" >다시작성</button>
</div>
<script type="text/javascript">
 $('.signupForm').on('submit',function(){
   alert('회원가입이 완료되었습니다');
  });

</script>
</form>


</div>
