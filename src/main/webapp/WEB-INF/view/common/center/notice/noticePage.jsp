<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
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
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/loadHTML.js"></script>
</head>
<body>
<script>loadHTML("/header");</script>
<c:set var="part" value="${board_part}"/>
<c:set var="bp" value="${boardPage}"/>
<input id="partt" type="hidden" value="${board_part}">
<div id="main">
<div id="content">
<div class="page_aticle aticle_type2">
    <div id="snb" class="snb_cc">
        <h2 class="tit_snb">고객센터</h2>
        <div class="inner_snb">
		  <ul class="list_menu">
		    <li class="">
		    <a href="/center/board?board_part=notice" name="link" onclick="" data-part="asd">공지사항</a>
		    </li>
		    <li>
		    <a href="/center/board?board_part=question" name="link" onclick="" >1:1 문의</a>
		    </li>
		    <li>
		    <a href="/center/board?board_part=faq" name="link"  onclick="" >자주하는 질문</a>
		    </li>
		  </ul>
        </div>
    </div>
    <div class="page_section">
        <div class="head_aticle">
        	<c:choose>
	        	<c:when test="${part eq 'notice'}">
	            <h2 class="tit">공지사항 <span class="tit_sub">컬리의 새로운 소식들과 유용한 정보들을 한곳에서 확인하세요.</span></h2>
	            </c:when>
	        	<c:when test="${part eq 'question'}">
	            <h2 class="tit">1:1 문의 <span class="tit_sub">직접 묻고 싶은 궁금한 사항들을 이 곳에서 해결하세요.</span></h2>
	            </c:when>
	            <c:when test="${part eq 'faq'}">
	            <h2 class="tit">자주묻는 질문<span class="tit_sub">자주 묻는 질문들을 이 곳에서 빠르게 확인하세요.</span></h2>
	            </c:when>
            </c:choose>
        </div>
        <form name="frmList" action="" onsubmit="">
            <input type="hidden" id="board_part" name="board_part" value="notice">
            <style>
                .notice .layout-pagination{margin: 0}
                .eng2{color: #939393}
                .xans-board-listheader{font-size:12px}
            </style>
            <table width="100%" align="center" cellpadding="0" cellspacing="0">
            <tbody>
                <tr>
                    <td>
                    <div class="xans-element- xans-myshop xans-myshop-couponserial ">
                        <table width="100%" class="xans-board-listheader jh" cellpadding="0" cellspacing="0">
                        <thead>
                        	<c:choose>
                        	<c:when test="${part eq 'notice' || part eq 'faq' }">
                            <tr>
                            <th>번호</th>
                            <th>제목</th>
                            <th>작성자</th>
                            <th>작성일</th>
                            </tr>
                            </c:when>
                        	<c:when test="${part eq 'question'}">
                            <tr>
                            <th width="8%">번호</th>
                            <th width="15%">상태</th>
                            <th>제목</th>
                            <th width="12%">작성자</th>
                            <th width="12%">작성일</th>
                            </tr>
                            </c:when>
                            </c:choose>
                        </thead>
                        <tbody>	
                            <c:forEach items="${boardPage}" var="boardPage">
                            <tr>
                                <td width="50" nowrap="" align="center">${boardPage.fake_num}</td>
                                <c:if test="${part eq 'question'}">
	                                <c:choose>
		                                <c:when test="${boardPage.reply_num == 0}">
		                                <td width="50" nowrap="" align="center" id="state">[답변대기중] </td>
		                                </c:when>
		                                <c:otherwise>
		                                <td width="50" nowrap="" align="center" id="state">[답변완료] </td>
		                                </c:otherwise>
	                                </c:choose>
                                </c:if>
                                <td style="padding-left:10px; text-align:left; color:#999">
                                <a href="/center/noticecontent?board_code=${boardPage.board_code}">${boardPage.board_title}</a>
                                </td>
                                <td width="100" nowrap="" align="center">${boardPage.board_id}</td>
                                <td width="100" nowrap="" align="center" class="eng2"><fmt:formatDate value="${boardPage.board_date}" pattern="yyyy-MM-dd"/></td>
                            </tr>
                            </c:forEach>
                            <script></script>
                        </tbody>
                        </table><br>
               <c:choose>
                <c:when test="${part eq 'notice'}">
                <sec:authorize access="hasRole('ADMIN')">
			      <table width="100%">
			      <tbody>
			        <tr>
			          <td align="right">
			            <input type="button" class="bhs_button yb" style="float:none;" value="글쓰기" onclick="goWrite()">
			          </td>
			        </tr>
			      </tbody>
			      </table>
			     </sec:authorize>
			     </c:when>

					<c:when test="${part eq 'question'}">
			      <table width="100%">
			      <tbody>
			        <tr>
			          <td align="right">
			            <input type="button" class="bhs_button yb" style="float:none;" value="글쓰기" onclick="goWrite()">
			          </td>
			        </tr>
			      </tbody>
			      </table>
			      </c:when>
			      
			      <c:otherwise>
			      </c:otherwise>
                </c:choose>

                
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
                    	<a href="board${pageMarker.makeQuery(idx)}&board_part=${part}" class="layout-pagination-button layout-pagination-number">${idx}</a>
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

                    </div>
                    </td>
                </tr>
            </tbody>
            </table>

        </form>
    </div>
</div>
</div>
</div>
<script>
function goWrite(){
	var part = $("#partt").val();
	location.href="/regiview?board_part="+part;
}
</script>
<script>
function goPart(){
	var part = $("#partt").val();
	location.href="/center/board?board_part="+part;
}
</script>
<script>loadHTML("/footer");</script>

</body></html>