<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
    <!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<!-- <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script> -->
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
<script src="//netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>

<style type="text/css">


.footer{

  background-color: #000;
  color: #fff;
  padding: 30px;
  text-align: center;

}

</style>

<script type="text/javascript">

$('.dropdown-toggle').dropdown()

</script>

  
<div class="container-fluid">

<br><br>
   
    <header class="container text-center">
    
    
    <h1 style="font-family: Forte; font-size: 70px;">CaffeTeria</h1>
    
    
    <br>
  
  <c:if test="${member eq null}">
    
    <button type="button" class="btn  col-sm-2 col-sm-offset-1"
    onclick="javascript: location.href='${pageContext.request.contextPath}/member/signin'">로그인</button>
    <button type="button"  class="btn  col-sm-2 col-sm-offset-2"
    onclick="javascript: location.href='${pageContext.request.contextPath}/member/signup'">회원가입</button>
    <button type="button"  class="btn  col-sm-2 col-sm-offset-2"
    onclick="javascript: location.href='${pageContext.request.contextPath}/member/signin';
    alert('로그인후 이용가능합니다.');">마이페이지</button>
    
     
 </c:if>
    
 <c:if test="${member.verify eq 1 }">
 <script type="text/javascript">
 
   location.href='/admin/index';
 
 </script>
</c:if>

    
   <c:if test="${member ne null }">
   
       
       <script type="text/javascript">
      alert('${member.userName}님 환영합니다.');
       </script>
       
         
         <button type="button"  class="btn col-sm-2 col-sm-offset-3"
     onclick="javascript: location.href='${pageContext.request.contextPath}/shop/myPage/main'; alert('마이페이지로 이동합니다.');">마이페이지</button>
         
         <button type="button"  class="btn col-sm-2 col-sm-offset-2"
     onclick="javascript: location.href='${pageContext.request.contextPath}/member/signout'">로그아웃</button>
   
   </c:if>
   
     </header>
     
   <br><br><br><br>
   
   <nav class="container text-center">
   
    <h1 style="font-family:Wide Latin;">Menu</h1>
    
      <br><br><br>
    
      <ul class="nav nav-tabs nav-justified">
     
     <li class="dropdown">
      <a class="dropdown-toggle" style="font-size: 20px;" id="coffee_dropdown" role="button" data-toggle="dropdown" data-target="#" href="/shop/list?c=100&l=1">Coffee</a>
       <ul class="dropdown-menu" role="menu" aria-labelledby="coffee_dropdown">
       <li><a href="/shop/list?c=101&l=2">까페 라떼(HOT)</a></li>
       <li><a href="/shop/list?c=102&l=2">까페 라떼(ICED)</a></li>
       <li><a href="/shop/list?c=103&l=2">까페모카(HOT)</a></li>
       <li><a href="/shop/list?c=104&l=2">까페모카(ICED)</a></li>
       <li><a href="/shop/list?c=105&l=2">바닐라라떼(HOT)</a></li>
       <li><a href="/shop/list?c=106&l=2">바닐라라떼(ICED)</a></li>
       <li><a href="/shop/list?c=107&l=2">아메리카노(HOT)</a></li>
       <li><a href="/shop/list?c=108&l=2">아메리카노(ICED)</a></li>
       <li><a href="/shop/list?c=109&l=2">에스프레소(HOT ONLY)</a></li>
       <li><a href="/shop/list?c=110&l=2">카라멜 마끼아또(HOT)</a></li>
       <li><a href="/shop/list?c=111&l=2">카라멜 마끼아또(ICED)</a></li>
       <li><a href="/shop/list?c=112&l=2">카푸치노(HOT ONLY)</a></li>
       <li><a href="/shop/list?c=113&l=2">콜드브루</a></li>
       <li><a href="/shop/list?c=114&l=2">고구마라떼(HOT)</a></li>
       <li><a href="/shop/list?c=115&l=2">고구마라떼(ICED)</a></li>
       <li><a href="/shop/list?c=116&l=2">그린티라뗴(HOT)</a></li>
       <li><a href="/shop/list?c=117&l=2">그린티라떼(ICED)</a></li>
       <li><a href="/shop/list?c=118&l=2">오곡라떼(HOT)</a></li>
       <li><a href="/shop/list?c=119&l=2">오곡라뗴(ICED)</a></li>
         </ul>
     </li>
     
     
     
     <li class="dropdown">
      <a class="dropdown-toggle" style="font-size: 20px;" id="ade_dropdown" role="button" data-toggle="dropdown" data-target="#" href="/shop/list?c=200&l=1"> 
     Ade
</a> 
  <ul class="dropdown-menu" role="menu" aria-labelledby="ade_dropdown"> 
       <li><a href="/shop/list?c=201&l=2">레몬에이드</a></li>
       <li><a href="/shop/list?c=202&l=2">오렌지주스</a></li>
       <li><a href="/shop/list?c=203&l=2">자몽에이드</a></li>
       <li><a href="/shop/list?c=204&l=2">자몽주스</a></li>
       <li><a href="/shop/list?c=205&l=2">청포도에이드</a></li>
       <li><a href="/shop/list?c=206&l=2">키위주스</a></li>
       <li><a href="/shop/list?c=207&l=2">홍시주스</a></li>
          </ul>
          </li>
          
      <li class="dropdown">    
     <a class="dropdown-toggle" style="font-size: 20px;" id="tea_dropdown" role="button" data-toggle="dropdown" data-target="#" href="/shop/list?c=300&l=1"> 
Tea
</a> 
<ul class="dropdown-menu" role="menu" aria-labelledby="tea_dropdown"> 
       <li><a href="/shop/list?c=301&l=2">갑잎차</a></li>
       <li><a href="/shop/list?c=302&l=2">국화차</a></li>
       <li><a href="/shop/list?c=303&l=2">유자차</a></li>
       <li><a href="/shop/list?c=304&l=2">복숭아아이스티</a></li>
       <li><a href="/shop/list?c=305&l=2">얼그레이티</a></li>
       <li><a href="/shop/list?c=306&l=2">페퍼민트티</a></li>
       <li><a href="/shop/list?c=307&l=2">히비스커스티</a></li>

 </ul>    
     </li>
     
           <li class="dropdown">    
     <a class="dropdown-toggle" style="font-size: 20px;"id="tea_dropdown" role="button" data-toggle="dropdown" data-target="#" href="/shop/list?c=400&l=1"> 
     SideMenu
</a> 
<ul class="dropdown-menu" role="menu" aria-labelledby="tea_dropdown"> 
       <li><a href="/shop/list?c=401&l=2">딸기빙수</a></li>
       <li><a href="/shop/list?c=402&l=2">베이글</a></li>
       <li><a href="/shop/list?c=403&l=2">시나몬브레드</a></li>
       <li><a href="/shop/list?c=404&l=2">크로크무슈</a></li>
       <li><a href="/shop/list?c=405&l=2">티라미수케이크</a></li>
       <li><a href="/shop/list?c=406&l=2">페스츄리</a></li>

 </ul>    
     </li>
     
     
     
      </ul>
      
       <br><br><br>
        
        </nav>
        
     
       <section class="container">
       
                        
          <br><br><br><br>
         <h1 class="text-center" style="font-family: 휴먼둥근헤드라인;">Shop View <br><br><br><br></h1>
        
     
         <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
   
  <!-- Indicators -->
  <ol class="carousel-indicators">
    <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
    <li data-target="#carousel-example-generic" data-slide-to="1"></li>
    <li data-target="#carousel-example-generic" data-slide-to="2"></li>
  </ol>

  <!-- Wrapper for slides -->
  <div class="carousel-inner" role="listbox">
    <div class="item active">
      <img class="img-rounded" src="/../resources/img/커피매장.jpg" style="width:350px; height: 350px;">
    </div>
    <div class="item">
      <img class="img-rounded" src="/../resources/img/커피매장2.jpg" style="width:350px; height: 350px;">
     </div>
       <div class="item">
      <img class="img-rounded" src="/../resources/img/main01.png" style="width:350px; height: 350px;">
     </div>

  </div>

  <!-- Controls -->
  <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
    <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
    <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
    <span class="sr-only">Next</span>
  </a>
</div>
        
          <br><br><br><br>
              
        <!-- 카카오 지도 API 사용 -->
 
<br><br><br><br>

 <h1 style="text-align: center;  font-family: HY견고딕">강남(본점)</h1>
 
<br><br>

  <div id="map" style="width: 500px; height: 400px; margin: auto"></div>
 
    <script type="text/javascript"
        src="//dapi.kakao.com/v2/maps/sdk.js?appkey=2817f0535f8f934d24d50e0e2b8052db&libraries=services"></script>
    <script>
        var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
        mapOption = {
            center : new daum.maps.LatLng(37.49956102061012, 127.02983112378229), // 지도의 중심좌표
            level : 3
        // 지도의 확대 레벨
        };
 
        // 지도를 생성합니다    
        var map = new daum.maps.Map(mapContainer, mapOption);
 
        // 주소-좌표 변환 객체를 생성합니다
        var geocoder = new daum.maps.services.Geocoder();
 
        var myAddress = [
                "서울특별시 강남구 테헤란로 14길 6" ];
 
        function myMarker(number, address) {
            // 주소로 좌표를 검색합니다
            geocoder
                    .addressSearch(
                            //'주소',
                            address,
                            function(result, status) {
                                // 정상적으로 검색이 완료됐으면 
                                if (status === daum.maps.services.Status.OK) {
 
                                    var coords = new daum.maps.LatLng(
                                            result[0].y, result[0].x);
 
                                    // 결과값으로 받은 위치를 마커로 표시합니다
                                   
                                    var marker = new daum.maps.Marker({
                                        map : map,
                                        position : coords
                                    });
                                     
 
                                    // 커스텀 오버레이에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
                                    var content = '<div class="customoverlay">'
                                            + '    <span class="title">'
                                            + '<div style="font-style:normal; color:red; font-weight:bold; font-size:2.0em">'
                                            + '</div>' + '</span>'
                                            + '</div>';
 
                                    // 커스텀 오버레이가 표시될 위치입니다 
                                    var position = new daum.maps.LatLng(
                                            result[0].y, result[0].x);
 
                                    // 커스텀 오버레이를 생성합니다
                                    var customOverlay = new daum.maps.CustomOverlay(
                                            {
                                                map : map,
                                                position : position,
                                                content : content,
                                                yAnchor : 1
                                            });
 
                                    // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
                                    map.setCenter(coords);
                                }
                            });
        }
 
        for (i = 0; i < myAddress.length; i++) {
            myMarker(i + 1, myAddress[i]);
        }
    </script>
    
    

<br><br><br><br>

</section>

<aside class="container">
                 
         <img class="img-circle"src="/../resources/img/커피설명.png" style="float: left;">
          <h2 class="text-right" style="font-family: 휴먼매직체; font-size: 30px;">매장 소개</h2>
         <p class="text-right" style="font-family: 휴먼옛체;">성공적인 만남을 함께 하는 배달 커피.</p>
       CaffeTeria 는 커피 케이터링(출장카페) 전문업체입니다.<br>       
       저희 업체는 고객이 원하는 시간과 장소에서 고품격 Cafe 를 만들어 커피의 그윽한 맛과 함께고객님의 성공적인 만남을 성사시킬 것 입니다.<br>      
      브랜드 커피회사 출신의 전문적인 바리스타들이 직접 수입해오는 원두를 사용하여차별화가 될 수 있는 CaffeTeria 입니다.<br>      
      후회없는 선택과 성공적인 만남을 CaffeTeria와 함께 하시길 바랍니다.<br>       
      정성스럽게 내린 커피 한잔으로, 여러분의 성공적인 비지니스와 만남을 돕겠습니다.<br>       
         </aside>                  
  
       
       <footer class="container-fluid"> 
        <br><br><br><br>
        <div class="info text-center" style="padding:50px; font-size: 15px; background-color: #000;">
      <a  href="/footer/privacy">개인정보처리방침</a>
     <a  href="/footer/useragree">이용약관</a>
     <a  href="/footer/location">오시는 길</a>
     </div>
        
       
       </footer>
     
               
             
        
        </div>
        
        

