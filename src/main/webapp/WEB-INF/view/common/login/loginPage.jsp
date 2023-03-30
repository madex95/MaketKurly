<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<!-- saved from url=(0042)https://www.kurly.com/shop/member/join.php -->
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>마켓컬리 :: 내일의 장보기, 마켓컬리</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0">


<link rel="shortcut icon" href="https://res.kurly.com/images/marketkurly/logo/favicon_v2.png" type="image/x-icon">
<link rel="styleSheet" href="${path}/resources/css/normalize.css">
<link rel="styleSheet" href="${path}/resources/css/section1.css">
<link rel="styleSheet" href="${path}/resources/css/common.css">

<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>

</script>
<style>
.error_msg{color:red; margin-bottom:15px; font-size:17px;}
</style>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/loadHTML.js"></script>
</head>
<body>
<script>loadHTML("/header");</script>

<div id="main">
<div id="content">
<div class="section_login">
    <h3 class="tit_login">로그인</h3>
    <div class="write_form">
    <div class="write_view login_view">
    <form method="post" name="form" id="loginForm"  action="/login">
    <!-- <input type="hidden" name="returnUrl" value="https://www.kurly.com/shop/main/index.php">
    <input type="hidden" name="return_url" value="">
    <input type="hidden" name="recommend_id" value="">
    <input type="hidden" name="close" value=""> -->
    <input type="text" id="login_user_id" name="user_id" name="m_id" size="20" tabindex="1" value="" placeholder="아이디를 입력해주세요">
    <input type="password" id="login_user_pw" name="user_pw" size="20" tabindex="2" placeholder="비밀번호를 입력해주세요">
    <div class="checkbox_save">

    
    <div class="login_search">
    <a class="link" onclick="KurlyTrackerLink(&#39;/member/find/id&#39;, &#39;select_find_id&#39;)" href="https://www.kurly.com/shop/member/login.php#none">
    아이디 찾기
    </a>
    <span class="bar"></span>
    <a class="link" onclick="KurlyTrackerLink(&#39;/member/find/password&#39;, &#39;select_find_password&#39;)" href="https://www.kurly.com/shop/member/login.php#none">
    비밀번호 찾기
    </a>
    </div>
    </div>
	<c:if test="${not empty SPRING_SECURITY_LAST_EXCEPTION}">
		<p class="error_msg">아이디 또는 비밀번호가 잘못됐거나</p>
		<p class="error_msg">탈퇴한 계정입니다</p>
		<c:remove var="SPRING_SECURITY_LAST_EXCEPTION" scope="session"/>
	</c:if>
    <button id="loginBtn" class="btn_type1" type="submit" onclick="">
    <span class="txt_type">로그인</span>
    </button>
    <input name="${_csrf.parameterName}" type="hidden" value="${_csrf.token}">
    </form>
    <a class="btn_type2 btn_member" href="/common/register">
    <span class="txt_type">회원가입</span>
    </a>
    </div>
    </div>
    </div>
 </div>
 </div>

<script>loadHTML("/footer");</script>

</body></html>