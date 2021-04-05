<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<!-- <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script> -->
    
 <script type="text/javascript" src="/../../resources/js/jquery-3.5.1.min.js"></script>
  <script type="text/javascript" src="/../../resources/ckeditor/ckeditor.js"></script>
 
 
 <div class="container-fluid">
 
  <br><br>
  
  <h1 align="center">상품 수정</h1>
 
 <br>
 
    <img alt="logo" src="/../resources/img/logo.png" style="width:250px; height: 200px; margin-left:42%; ">
 
 <form role="form" method="post" autocomplete="off" enctype="multipart/form-data"> 
 
 <input type="hidden" name="gdsNum"  value="${goods.gdsNum}">
 
 
    <div class="form-group col-sm-4 col-sm-offset-4">
   <label>1차 분류</label>
    <select required="required"  class="category1" style="margin-top:30px; margin-left:10px; padding-right: 250px;">
      <option value="">메뉴선택
        </option>
        </select>
       </div>
          <script type="text/javascript">
  //제이손 데이터 받아오기
     var jsonData = JSON.parse('${category}')
 //     console.log(jsonData);
      
   var cate1Arr = new Array();
   var cate1Obj = new Object();
   
   //배열에 데이터 값 추가
   for(var i=0; i<jsonData.length; i++){
     if(jsonData[i].cateLevel =="1"){
     cate1Obj = new Object();
     cate1Obj.cateCode = jsonData[i].cateCode;
     cate1Obj.cateName = jsonData[i].cateName;
     cate1Arr.push(cate1Obj);
   }
   }
//   console.log(cate1Arr);
   
  //카테고리 선택
  var cate1Select = $('select.category1');
  
   //추가된 데이터 값 적용
  for(var i=0; i<cate1Arr.length; i++){
    cate1Select.append("<option value='"+cate1Arr[i].cateCode+"'>"
                      +cate1Arr[i].cateName+"</option>");
  
  }
  // console.log(cate1Select);
   
   </script>
    
          <div class="form-group col-sm-4 col-sm-offset-4">
   <label>2차 분류</label>
    <select  required="required"   class="category2" name="cateCode" style="margin-top:30px; margin-left:10px; padding-right: 250px;">
      <option value="">메뉴선택
        </option>
        </select>
       </div>
       
   <script type="text/javascript">
   
    $(document).on('change','select.category1',function(){
    
     var cate2Arr = new Array();
     var cate2Obj = new Object();
     
     for(var i=0; i<jsonData.length; i++){
     
     if(jsonData[i].cateLevel=="2"){
       
       cate2Obj = new Object();
       cate2Obj.cateCode = jsonData[i].cateCode;
       cate2Obj.cateName = jsonData[i].cateName;
       cate2Obj.cateCodeRef = jsonData[i].cateCodeRef;
       cate2Arr.push(cate2Obj);
     
     }
         
     }
     
     console.log(cate2Arr);
     
     var cate2Select = $('select.category2');
     
   cate2Select.children().remove();
   
 
 /*
 for(var i = 0; i < cate2Arr.length; i++) {
   cate2Select.append("<option value='" + cate2Arr[i].cateCode + "'>"
        + cate2Arr[i].cateName + "</option>");
 }
 */
 
 cate2Select.children().remove();

//선택한 조건에 해당되는 데이터 출력
 $("option:selected", this).each(function(){
  
  var selectVal = $(this).val();  
  cate2Select.append("<option value=''>메뉴선택</option>");
  
  for(var i = 0; i < cate2Arr.length; i++) {
   if(selectVal == cate2Arr[i].cateCodeRef) {
    cate2Select.append("<option value='" + cate2Arr[i].cateCode + "'>"
         + cate2Arr[i].cateName + "</option>");
   }
  }
  
 });


});


 
   </script>    
       
       
 
  
  
 <div class="form-group col-sm-4 col-sm-offset-4">
<label for="gdsName">상품명</label>
<input class="form-control" type="text" value="${goods.gdsName}" id="gdsName" name="gdsName" placeholder="상품명을 입력해 주세요" required="required">
</div>

<div class="form-group col-sm-4 col-sm-offset-4">
<label for="gdsPrice">상품가격</label>
<input class="form-control" type="text" value="${goods.gdsPrice}"  id="gdsPrice" name="gdsPrice" placeholder="상품가격을 입력해 주세요" required="required">
</div>
    
    <div class="form-group col-sm-4 col-sm-offset-4">
<label for="gdsStock">상품수량</label>
<input class="form-control" type="text" value="${goods.gdsStock}" id="gdsStock" name="gdsStock" placeholder="상품수량을 입력해 주세요" required="required">
</div>

    
   <div class="form-group col-sm-4 col-sm-offset-4">
   <p style="font-weight: bold">상품소개</p>
   <textarea rows="5" cols="62" id="gdsDes"
    name="gdsDes" required="required">${goods.gdsDes}</textarea>
       <script>
 var ckeditor_config = {
   resize_enaleb : false,
   enterMode : CKEDITOR.ENTER_BR,
   shiftEnterMode : CKEDITOR.ENTER_P,
   filebrowserUploadUrl : "/admin/goods/ckUpload"
 };
 
 CKEDITOR.replace("gdsDes", ckeditor_config);
</script>
</div>


    <div class="form-group col-sm-4 col-sm-offset-4">
<label for="gdsImg">이미지</label>
<input class="form-control" id="gdsImg" type="file" name="file" required="required">
<div class="select_img">
<img src="${goods.gdsImg}"/>
<input type="hidden" name="gdsImg" value="${goods.gdsImg}">
<input type="hidden" name="gdsThumbImg" value="${goods.gdsThumbImg}">
</div>

<script type="text/javascript">

 $("#gdsImg").change(function(){
   if(this.files && this.files[0]) {
    var reader = new FileReader;
    reader.onload = function(data) {
     $(".select_img img").attr("src", data.target.result).width('200px');        
    }
    reader.readAsDataURL(this.files[0]);
   }
  });

</script>




</div>



  <div class="form-group col-sm-4 col-sm-offset-4">
<button class="btn btn-warning"   type="submit" id="goods_btn" onsubmit="javascript: alert('수정이 완료되었습니다.');">상품수정</button>
<button class="btn btn-danger"   type="reset"
  onclick="javascript: alert('수정이 취소되었습니다.'); location.href='/admin/goods/view?n='+${goods.gdsNum};" >수정취소</button>
</div>



</form>


</div>