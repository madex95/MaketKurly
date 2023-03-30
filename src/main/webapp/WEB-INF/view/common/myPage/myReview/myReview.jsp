<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page import="org.springframework.security.core.context.SecurityContextHolder" %>
<%@ page import="org.springframework.security.core.Authentication" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마켓컬리 :: 내일의 장보기, 마켓컬리</title>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/loadHTML.js"></script>
<link rel="shortcut icon" href="https://res.kurly.com/images/marketkurly/logo/favicon_v2.png" type="image/x-icon">
<link rel="styleSheet" href="${path}/resources/css/normalize.css">
<link rel="styleSheet" href="${path}/resources/css/section1.css">
<link rel="styleSheet" href="${path}/resources/css/common.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

</head>
<body>
<script>loadHTML("/header");</script>



<div id="main">
<div id="content">
<div class="page_aticle aticle_type2">
  <div id="snb" class="snb_my">
    <h2 class="tit_snb">마이컬리</h2>
    <div class="inner_snb">
        <ul class="list_menu">
          <li class="">
            <a href="myinfo">회원 정보 수정</a>
          </li>
          <li>
            <a href="">주문 조회</a>
          </li>
          <li>
            <a href="">리뷰 조회</a>
          </li>
          <li>
            <a href="myquestion">1:1 문의</a>
          </li>
        </ul>
      </div>
    </div>


<form name="frmList" id="form" method="get" action="https://www.kurly.com/shop/service/faq.php?">
<div class="page_section">
<div class="head_aticle">
<h2 class="tit">리뷰 조회 <span class="tit_sub">고객님이 남기신 리뷰를 확인 할 수 있습니다.</span></h2>
</div>
<div class="xans-element- xans-myshop xans-myshop-couponserial ">
<table width="100%" class="xans-board-listheader">
<tbody><tr>
<th width="100" class="input_txt" >이미지</th>
<th width="90" style="padding-left:60px">점수</th>
<th class="input_txt">제목</th>
<th width="135">작성일</th>
</tr>
</tbody>
</table>
<div>



<!-- 아코디언 시작-->
<c:forEach items="${reviewPage}" var="reviewPage">
<div>
<table width="100%" class="table_faq" onclick="view_content(this)" id="faq_189">
<tbody>
<tr>

<td width="100" align="center"><img src="\resources\image\market\item\<fmt:formatDate value="${reviewPage.ori_date}" pattern="yyyy-MM-dd" />\<c:out value="${reviewPage.review_itemcode}"/><c:out value="${fn:split(reviewPage.item_image,':')[0]}"/>" alt="상품 대표 이미지" class="" style="width:90px; height:90px"></td>
<td width="90" style="padding-left:60px" align="center">${reviewPage.review_grade} 점</td>
<td style="cursor:pointer" align="center">${reviewPage.item_name}</td>
<td width="135" align="center"><fmt:formatDate value="${reviewPage.review_date}" pattern="yyyy-MM-dd"/></td>
</tr>
</tbody>
</table>
<div style="display: none; padding: 30px; border-top: 1px solid rgb(230, 230, 230);">
<table cellpadding="0" cellspacing="0" border="0">
<tbody>
<tr valign="top">
<th style="color:#0000bf;width:40px; padding-top:1px;"></th>
<td>■ 리뷰내용<br>
${reviewPage.review_content}
<br>
<div>
<textarea type="text" style="width:800px; height:80px"></textarea><br>
</div><br>
<div class="goods-review-grp-btn" style="text-align:right;">
<button type="button" class="styled-button" onclick="popup_register()" style="display:none">등록</button>
<button type="button" class="styled-button" onclick="popup_register()" >수정</button>
<button type="button" class="styled-button" onclick="popup_register()" >삭제</button>
</div>
</td>
</tr>
</tbody>
</table>
</div>
</div>
</c:forEach>
<!-- 아코디언 끝 -->

</div>
<div style="padding:1px; border-top:1px solid #e6e6e6"></div>
<!-- 페이징 위치 -->
            <div class="layout-pagination">
                <div class="pagediv">
                	<a href="noticepage${pageMarker.makeQuery(pageMarker.realStart)}" class="layout-pagination-button layout-pagination-first-page">맨 처음 페이지로 가기</a>
                    
                    <c:choose>
						<c:when test="${pageMarker.prev}">
	                    	<a href="noticepage${pageMarker.makeQuery(pageMarker.startPage - 1)}" class="layout-pagination-button layout-pagination-prev-page">이전 페이지로 가기</a>
	                    </c:when>
	                    
	                    <c:otherwise>
	                    	<a href="noticepage${pageMarker.makeQuery(pageMarker.realStart)}" class="layout-pagination-button layout-pagination-prev-page">이전 페이지로 가기</a>
	                    </c:otherwise>
                    </c:choose>
                    
                    <c:forEach begin="${pageMarker.startPage}" end="${pageMarker.endPage}" var="idx">
                    	<a href="myreview${pageMarker.makeQuery(idx)}" class="layout-pagination-button layout-pagination-number">${idx}</a>
                    </c:forEach>
                    
                    <c:choose>
	                    <c:when test="${pageMarker.next && pageMarker.endPage > 0}">
	                    	<a href="noticepage${pageMarker.makeQuery(pageMarker.endPage + 1)}" class="layout-pagination-button layout-pagination-next-page">다음 페이지로 가기</a>
	                	</c:when> 
	                	
	                	<c:otherwise>
	                		<a href="noticepage${pageMarker.makeQuery(pageMarker.realEnd)}" class="layout-pagination-button layout-pagination-next-page">다음 페이지로 가기</a>
	                	</c:otherwise>
                	</c:choose>
                	
                	
                	<a href="noticepage${pageMarker.makeQuery(pageMarker.realEnd)}" class="layout-pagination-button layout-pagination-last-page">맨 끝 페이지로 가기</a>
                </div>
            </div>
<!-- 페이징 위치 -->
</div>

</div>
</form>
</div>
<script>
  var preContent;

  function view_content(obj)
  {
    var div = obj.parentNode;

    for (var i=1, m=div.childNodes.length;i<m;i++) {
      if (div.childNodes[i].nodeType != 1) continue;	// text node.
      else if (obj == div.childNodes[ i ]) continue;

      obj = div.childNodes[ i ];
      break;
    }

    if (preContent && obj!=preContent){
      obj.style.display = "block";
      preContent.style.display = "none";
    }
    else if (preContent && obj==preContent) preContent.style.display = ( preContent.style.display == "none" ? "block" : "none" );
    else if (preContent == null ) obj.style.display = "block";

    preContent = obj;
  }

  { // 초기출력
    var no = "faq_";
    if ( document.getElementById( no ) ) view_content( document.getElementById( no ) );
  }
</script>
</div>
</div>
	
	
	
<script>loadHTML("/footer");</script>
</body>
</html>