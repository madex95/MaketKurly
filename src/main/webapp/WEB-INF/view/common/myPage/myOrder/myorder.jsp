<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<!-- saved from url=(0042)https://www.kurly.com/shop/member/join.php -->
<html lang="ko"><head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>마켓컬리 :: 내일의 장보기, 마켓컬리</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0">


<link rel="shortcut icon" href="https://res.kurly.com/images/marketkurly/logo/favicon_v2.png" type="image/x-icon">
<link rel="styleSheet" href="${path}/resources/css/normalize.css">
<link rel="styleSheet" href="${path}/resources/css/section1.css">
<link rel="styleSheet" href="${path}/resources/css/common.css">
</head>


<div class="page_aticle aticle_type2">
<div id="snb" class="snb_my">
<h2 class="tit_snb">마이컬리</h2>
<div class="inner_snb">
<ul class="list_menu">
  <li>
    <a href="https://www.kurly.com/shop/member/myinfo.php">회원 정보 수정</a>
    </li>
<li class="on">
<a href="https://www.kurly.com/shop/mypage/mypage_orderlist.php">주문 조회</a>
</li>
<li>
<a href="https://www.kurly.com/shop/mypage/mypage_review.php">리뷰 조회</a>
</li>
<li>
<a href="https://www.kurly.com/shop/mypage/product_inquiry.php">1:1 문의 조회</a>
</li>
</ul>
</div>
</div>
<div id="viewOrderList" class="page_section section_orderlist">
  <div class="head_aticle">
    <h2 class="tit">주문 내역 </h2>
  </div> 
  <div class="search_date"> 
  <ul class="list_order"> <li class="no_data">주문내역이 없습니다.</li></ul> <!---->
  </div>
</div>
<div id="oftenList" style="display: none;"></div>
</div>


	<a href="#" onclick="document.getElementById('logout-form').submit();">로그아웃</a>
	<form id="logout-form" action=/logout method="POST">
	<input name="${_csrf.parameterName}" type="hidden" value="${_csrf.token}"/>
	</form><br>
	<p>.</p><br>
	<a href="/register"><span class="txt">회원가입</span></a><br>
<p>.</p><br>
<a href="/mypage/myinfo"><span class="txt">마이페이지-회원정보수정</span></a><br>
<p>.</p><br>
<a href="/mypage/mycart"><span class="txt">마이페이지-장바구니</span></a><br>
<p>.</p><br>
<a href="/mypage/myorder"><span class="txt">마이페이지-주문조회</span></a><br>
<p>.</p><br>
<a href="/center"><span class="txt">고객센터</span></a><br>
<p>.</p><br>

</body></html>

