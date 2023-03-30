<%@ page isELIgnored="false" language="java" contentType="text/html; charset=utf-8"
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
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/loadHTML.js"></script>
</head>
<body>


<script src="//code.jquery.com/jquery-1.11.0.min.js"></script> 

<style>
	/* 페이지 버튼 인터페이스 */
.pageMaker_wrap{
	text-align: center;
    margin-top: 30px;
    margin-bottom: 40px;
}
.pageMaker_wrap a{
	color : black;
}
.pageMaker{
    list-style: none;
    display: inline-block;
}	
.pageMaker_btn {
    float: left;
    width: 50px;
    height: 40px;
    line-height: 40px;
    margin-left: 20px;
}
.next, .prev {
    border: 1px solid #ccc;
    padding: 0 10px;
}
.next a, .prev a {
    color: #ccc;
}
.active{							/* 현재 페이지 버튼 */
	border : 2px solid black;
	font-weight:400;
}
/* 검색결과 없음 */
.table_empty{
	height: 50px;
    text-align: center;
    margin: 200px 0 215px 0px;
    font-size: 25px;
}
</style>

<!-- HEADER -->
<script>loadHTML("/header");</script>
 ${filter_info}
<div id="main">
<div id="content">
	<!-- 게시물 o -->
			<c:if test="${listcheck != 'empty'}">
			
			</c:if>
			<!-- 게시물 x -->
			<c:if test="${listcheck == 'empty'}">
				<div class="table_empty">
					검색결과가 없습니다.
				</div>
			</c:if>
<div class="page_aticle">

<div id="goodsList" class="page_section section_goodslist">
<div class="list_goods"><div class="inner_listgoods">


<ul class="list">
 <c:forEach items="${list}" var="search" varStatus="status">
<li>
<div class="item">
<div class="thumb">
<a class="img" style="">
<img src="\resources\image\market\item\<fmt:formatDate value="${search.ori_date}" pattern="yyyy-MM-dd" />\<c:out value="${search.item_code}"/><c:out value="${fn:split(search.item_image,':')[0]}"/>" 
 width="388px" height="480px" alt="" onerror=""></a> 
<div class="group_btn"><button type="button" class="btn btn_cart"><span class="screen_out">110295</span></button>
</div>
</div> 
<a class="info">
 <a href="/itemdetail/<c:out value="${search.item_code}"/>">
<span class="name"><c:out value="${search.item_name }"/> </span>
</a> 
<span class="cost"><span class="price"><fmt:formatNumber value="${search.item_price}" pattern="#,### 원" /></span></span> 

<span class="tag"></span>
</a>
</div>
</li>
</c:forEach>
</ul>

</div></div></div>
<script>
$(document).ready(function(){
/* 페이지 이동 버튼 */
const moveForm = $('#moveForm');

$(".pageMaker_btn a").on("click", function(e){
	
	e.preventDefault();
	
	moveForm.find("input[name='pageNum']").val($(this).attr("href"));
	
	moveForm.submit();
	
});

});
</script>
  <div class="bg_loading" id="bgLoading" style="display: none;">
<div class="loading_show"></div></div>

<!-- 페이지 이동 인터페이스 -->
<c:if test="${pageMaker ne null }">
<div class="pageMaker_wrap">
					<ul class="pageMaker">
	                			
						<!-- 이전 버튼 -->
						<c:if test="${pageMaker.prev }">
	               			<li class="pageMaker_btn prev">
	               				<a href="${pageMaker.pageStart -1}">  이전  </a>
	               			</li>
						</c:if>
	               			
	               		<!-- 페이지 번호 -->
	               		<c:forEach begin="${pageMaker.pageStart }" end="${pageMaker.pageEnd }" var="num">
	               			<li class="pageMaker_btn ${pageMaker.cri.pageNum == num ? 'active':''}">
	               				<a href="${num}">${num}</a>
	               			</li>	
	               		</c:forEach>
	               		
	                   	<!-- 다음 버튼 -->
	                   	<c:if test="${pageMaker.next}">
	                   		<li class="pageMaker_btn next">
	                   			<a href="${pageMaker.pageEnd + 1 }">다음</a>
	                   		</li>
	                   	</c:if>
					</ul>
				</div>
				</c:if>
					<form id="moveForm" action="/search" method="get" >
					<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
					<input type="hidden" name="amount" value="${pageMaker.cri.amount}">
					<input type="hidden" name="keyword" value="${pageMaker.cri.keyword}">
					<input type="hidden" name="code" value="<c:out value="${pageMaker.cri.code}"/>">
				
				</form>
	   


</div>

	                    

</div>
</div>
<!-- FOOTER -->
<script>loadHTML("/footer");</script>

</body></html>



