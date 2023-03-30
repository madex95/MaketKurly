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




<div id="main">
<div id="content">

<div id="qnb" class="quick-navigation" style="top: 70px;">

</div>
<div class="page_aticle aticle_type2">
<div id="snb" class="snb_cc">
<h2 class="tit_snb">고객센터</h2>
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
      <a href="myquestion">1:1 문의 조회</a>
    </li>
  </ul>
</div>
</div>
<div class="page_section section_qna">
<div class="head_aticle">
<h2 class="tit">1:1 문의</h2>
</div>

<table class="xans-board-listheader" width="100%">
<tbody><tr class="input_txt">
<th width="8%">번호</th>
<th width="15%"> </th>
<th>제목</th>
<th width="12%">작성자</th>
<th width="12%">작성일</th>
</tr>
</tbody></table>
<div class="mypage_wrap" style="float:none;width:100%">
<table class="table_faq" width="100%" onclick="view_content(this, event)">
<tbody><tr>
<td width="8%" align="center">4</td>
<td width="15%" align="center" class="stxt"></td>
<td style="padding-top:5px; padding-bottom:5px;">
ㅍㅋㅌ
</td>
<td width="12%" align="center">cih954</td>
<td width="12%" align="center">2022-02-03</td>
</tr>
</tbody></table>
<div style="display:none;padding:30px; border-top:1px solid #e6e6e6">
<div width="100%" style="padding-left:55px;">ㅍㅋㅌㅁㄴㅇ</div>
<div class="goods-review-grp-btn" style="text-align:right;">
<button type="button" class="styled-button" onclick="popup_register( &#39;mod_qna&#39;, &#39;5860446&#39; );">수정</button>
</div>
</div>
</div>
<div class="mypage_wrap" style="float:none;width:100%">
<table width="100%" class="replayD" onclick="view_content(this, event)">
<tbody><tr>
<td width="8%" align="center">3</td>
<td width="15%" align="right"><img src="./마켓컬리 __ 1대1 문의 _files/myqna_answer.gif"></td>
<td style="padding-top:5px; padding-bottom:5px;" class="stxt">안녕하세요 고객님, 답변드립니다.</td>
<td width="12%" align="center">marketkurly</td>
<td width="12%" align="center">2022-02-03</td>
</tr>
</tbody></table>
<div style="display:none;padding:30px; border-top:1px solid #e6e6e6">
<div width="100%" style="padding-left:55px;">안녕하세요 고객님<br>
마켓컬리를 이용해주셔서 감사합니다.<br>
<br>
문의하신 내용이 확인이 되지 않아 궁금하신 사항이 있으시면 언제든 고객행복센터를 찾아주시기 바랍니다.<br>
<br>
[상담 업무 시간]<br>
평일, 주말, 공휴일 : 오전 7시 ~ 오후 7시<br>
<br>
감사합니다.<br>
마켓컬리 드림.</div>
<div class="goods-review-grp-btn" style="text-align:right;">
</div>
</div>
</div>
<div class="mypage_wrap" style="float:none;width:100%">
<table class="table_faq" width="100%" onclick="view_content(this, event)">
<tbody><tr>
<td width="8%" align="center">2</td>
<td width="15%" align="center" class="stxt"></td>
<td style="padding-top:5px; padding-bottom:5px;">
ㅁㄴㅇ
</td>
<td width="12%" align="center">cih954</td>
<td width="12%" align="center">2022-02-03</td>
</tr>
</tbody></table>
<div style="display:none;padding:30px; border-top:1px solid #e6e6e6">
<div width="100%" style="padding-left:55px;">ㅁㄴㅇ</div>
<div class="goods-review-grp-btn" style="text-align:right;">
<button type="button" class="styled-button" onclick="popup_register( &#39;mod_qna&#39;, &#39;5860444&#39; );">수정</button>
</div>
</div>
</div>
<div class="mypage_wrap" style="float:none;width:100%">
<table width="100%" class="replayD" onclick="view_content(this, event)">
<tbody><tr>
<td width="8%" align="center">1</td>
<td width="15%" align="right"><img src="./마켓컬리 __ 1대1 문의 _files/myqna_answer.gif"></td>
<td style="padding-top:5px; padding-bottom:5px;" class="stxt">안녕하세요 고객님, 답변드립니다.</td>
<td width="12%" align="center">marketkurly</td>
<td width="12%" align="center">2022-02-03</td>
</tr>
</tbody></table>
<div style="display:none;padding:30px; border-top:1px solid #e6e6e6">
<div width="100%" style="padding-left:55px;">안녕하세요 고객님,<br>
마켓컬리 이용에 불편을 드려 진심으로 죄송합니다.<br>
<br>
고객님께서 문의하신 내용은 다른 게시글로 안내 도와드렸습니다.<br>
<br>
추후에도 문의사항이 있으시다면 언제든지 고객행복센터 (1644-1107) / [1:1 문의] 게시판 / 실시간 카카오톡 채팅 상담을 통해 문의 주신다면 보다 신속한 상담 도와드리도록 하겠습니다.<br>
<br>
운영시간 : 오전 7시 ~ 오후 7시 (365일)<br>
<br>
고객님께 더욱 만족을 드릴 수 있는 마켓컬리가 되도록 하겠습니다.<br>
<br>
감사합니다. 마켓컬리 이승연 드림.</div>
<div class="goods-review-grp-btn" style="text-align:right;">
</div>
</div>
</div>
<div style="position:relative">
<div style="position:absolute;right:0;top:60px;">
<a href="javascript:popup_register( &#39;add_qna&#39; );"><span class="bhs_buttonsm yb" style="float:none;">글쓰기</span></a>
</div>
</div>


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
                    	<a href="noticepage${pageMarker.makeQuery(idx)}" class="layout-pagination-button layout-pagination-number">${idx}</a>
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
</div>
<script type="text/javascript">
function popup_register( mode, sno )
{
    // KMF-299 1:1문의 글쓰기 버튼 트래킹
    if (mode === 'add_qna') {
      KurlyTracker.setAction('select_my_kurly_add_personal_inquiry').sendData();
    }

    if ( mode == 'del_qna' )  var win = window.open("../mypage/mypage_qna_del.php?mode=" + mode + "&sno=" + sno,"qna_register","width=400,height=200");
    else parent.location.href = ("../mypage/mypage_qna_register.php?mode=" + mode + "&sno=" + sno);

}

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
        preCheck = false
    }else if (preContent && obj==preContent){
        preContent.style.display = ( preContent.style.display == "none" ? "block" : "none" );
    }else if (preContent == null ){
        obj.style.display = "block";
    }

    preContent = obj;

    if(preContent.style.display === 'block'){
        KurlyTracker.setScreenName('personal_inquiry_detail');
    }else{
        KurlyTracker.setScreenName('personal_inquiry_history');
    }
}

// KM-1483 Amplitude 연동
KurlyTracker.setScreenName('personal_inquiry_history');
</script>
</div>
</div>



<script>loadHTML("/footer");</script>

</body></html>