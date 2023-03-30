<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page import="org.springframework.security.core.context.SecurityContextHolder" %>
<%@ page import="org.springframework.security.core.Authentication" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
 <sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal" var="principal"/>
</sec:authorize> 
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
$(function(){
	
	var check = 0;
	
	$("#check").click(function(){
		if(check==0){
			check=1;
		} else (check=0)
	})
	
	
	
	$("#deleteBtn").click(function(){
		if($("#user_pw").val()==""){
			alert("올바른 비밀번호를 입력해주세요");
			return false;
		} else if (check==0){
			alert("회원 탈퇴시의 사항들을 숙지했는지 체크해주세요");
			return false;
		} else{
			$.ajax({
				url : "/pwchk",
				type : "get",
				dataType : "json",
				data : {id : $("#user_id").val(),
						pw : $("#user_pw").val()
						},
				success : function(data){
					if(data == 0){
						alert("올바른 비밀번호를 입력해주세요.");
						return false;
					}else if(data == 1){
						alert("탈퇴가 성공적으로 완료되었습니다");
						$("#deleteForm").submit();
						}
					}
				})
		}
	})
	
	
	
	
});
</script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/loadHTML.js"></script>
<style>
    .error_msg {color: red; font-size:17px; margin:10px 0px 10px 0px}
</style>
</head>
<body>
<script>loadHTML("/header");</script>
<div id="main">
<div id="content">
<div class="tit_page">
<h2 class="tit">회원탈퇴안내</h2>
</div>
<div class="">
  <div class="type_form member_join member_hack">
    <form method="post" action="/common/mypage/delete" id="deleteForm">
      <input type="hidden" name="act" value="Y">
      <table class="tbl_comm">
      <tbody>
        <tr>
          <th>
          회원탈퇴안내
          </th>
          <td class="info">
            고객님께서 회원 탈퇴를 원하신다니 저희의 서비스가 많이 부족하고 미흡했나 봅니다. 불편하셨던 점이나 불만사항을 알려주시면 적극 반영해서 고객님의 불편함을 해결해 드리도록 노력하겠습니다.
            <strong class="emph">아울러 회원 탈퇴시의 아래 사항을 숙지하시기 바랍니다.</strong>
            1. 회원 탈퇴 시 고객님의 정보는 상품 반품 및 A/S를 위해 전자상거래 등에서의 소비자 보호에 관한 법률에 의거한 고객정보 보호정책에따라 관리 됩니다.<br>
            2. 소비자 보호에 관한 법률에 의거한 고객정보 보호정책에따라 탈퇴를 한 시점부터 30일 후, 모든 정보가 삭제됩니다.<br>
            3. 회원 탈퇴 후 30일간 해당 정보로는 재가입 또는 로그인이 불가능합니다.<br>
          </td>
        </tr>
        <tr>
          <th></th>
          <td>
            <label class="label_block">
              <input type="checkbox" id="check">
              <span class="ico"></span>위의 사항들을 숙지하였습니다
            </label>
          </td>
        </tr>
        <tr>
          <th>
            비밀번호 확인
          </th>
          <td>
          	<input type="hidden" id="user_id" name="user_id" value="${principal.vo.user_id}" readonly="">
            <input type="password" id="user_pw" name="user_pw" maxlength="16">
          </td>
        </tr>
      </tbody>
      </table>
    </form>
      <div id="formSubmit" class="form_footer">
      <p class="error_msg"></p>
        <button id="deleteBtn" type="submit" class="btn active">탈퇴</button>
      </div>
  </div>
</div>
</div>
</div>

<script>loadHTML("/footer");</script>

</body>
</html>