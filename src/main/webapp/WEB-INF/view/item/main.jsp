<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="title" content="마켓컬리 :: 내일의 장보기, 마켓컬리">
<meta name="description" content="Love Food, Love Life. 마켓컬리! 당일 수확 채소, 과일, 맛집 음식까지 내일 아침 문 앞에서 만나요!">
<meta name="keywords" content="다이어트, 식단, 닭가슴살, 요리, 치아바타, 레시피, 요리, 상차림, 다이어트음식, 이유식, 건강이유식">
<title>마켓컬리 :: 내일의 장보기, 마켓컬리</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0">
<meta name="naver-site-verification" content="58ff7c242d41178131208256bfec0c2f93426a1d">
<meta name="facebook-domain-verification" content="tyur3wmoos7t63tpkb7zosur6p98m1">

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.6.0/slick.min.css">
<link rel="shortcut icon" href="https://res.kurly.com/images/marketkurly/logo/favicon_v2.png" type="image/x-icon">
<link rel="apple-touch-icon" sizes="57x57" href="https://res.kurly.com/images/marketkurly/logo/ico_57.png">
<link rel="icon" type="image/png" sizes="16x16" href="https://res.kurly.com/images/marketkurly/logo/ico_16.png">

<link rel="styleSheet" href="${pageContext.request.contextPath}/resources/css/normalize.css">
<link rel="styleSheet" href="${pageContext.request.contextPath}/resources/css/common.css">

<style>.async-hide { opacity: 0 !important} </style>

<style data-emotion="css" data-s=""></style>
<Style>
.top{
	margin-top:30px;
}
</Style>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/loadHTML.js"></script>
</head>
<body>

<!-- HEADER -->
<script>loadHTML("/header");</script>
<div id="main">



<div class="top">
<h1 align="center">이 상품 어때요?</h1>
</div>
<div id="content">
<div id="goodsList" class="page_section section_goodslist" align="center"><div class="list_ability"></div> 
 
 <div class="list_goods"><div class="inner_listgoods">
 <ul class="list">

 <c:forEach items="${list}" var="welcomeWebList" varStatus="g">
 <li>
 <div class="item">
 <div class="thumb">
 <a class="img">

 <img src=  "/resources/image/market/item/<fmt:formatDate value="${welcomeWebList.ori_date}" pattern="yyyy-MM-dd" />/<c:out value="${welcomeWebList.item_code}"/><c:out value="${fn:split(welcomeWebList.item_image,'[:]')[0]}"/>"
  width="388px" height="480px" alt="" '/resources' , express.static('resources') />
  </a>
</div>

 <a class="info">
 <a href="/itemdetail/<c:out value="${welcomeWebList.item_code}"/>">
<span class="name"> <c:out value="${welcomeWebList.item_name}"/></span> 
</a>
<span class="cost"> <span class="price"><fmt:formatNumber value="${welcomeWebList.item_price}" pattern="#,### 원" /></span></span> 
 <span class="desc"></span> 
 <span class="tag"><!----></span>
 </a>
 </div>
 </li>
  </c:forEach>
</ul>
</div>
</div>
</div>
</div>
</div>

<!-- FOOTER -->
<script>loadHTML("/footer");</script>

</body></html>