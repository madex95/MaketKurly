<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page import="org.springframework.security.core.context.SecurityContextHolder" %>
<%@ page import="org.springframework.security.core.Authentication" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
 <sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal" var="principal"/>
</sec:authorize> 
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
$(function(){
	
	$("#modifyEnter").click(function(){
		if($("#enter_pw").val()==""){
			alert("올바른 비밀번호를 입력해주세요");
			return false;
		} else{
		$.ajax({
			url : "/pwchk",
			type : "get",
			dataType : "json",
			data : {id : $("#enter_id").val(),
					pw : $("#enter_pw").val()
					},
			success : function(data){
				if(data == 0){
					alert("올바른 비밀번호를 입력해주세요.");
					return false;
				}else if(data == 1){
					$("#first").load("/ajaxinput");
					}
				}
			})
		}
	});
	
	
	
});
</script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/loadHTML.js"></script>
</head>

<script>loadHTML("/header");</script>
	<div id="main">
	<div id="content">
            <div class="page_aticle aticle_type2">
              <div id="snb" class="snb_my">
                <h2 class="tit_snb">마이컬리</h2>
                <div class="inner_snb">
                    <ul class="list_menu">
                      <li class="on">
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


              <div class="page_section section_myinfo" id="first">
                <div class="head_aticle"><h2 class="tit">개인 정보 수정</h2></div>
                <div class="type_form member_join member_pw">
                  <form name="pwChkForm" method="post" action="">
                    <table class="tbl_comm">
                      <tbody>
                        <tr class="fst">
                        <th>아이디</th>
                          <td>
                            <input id="enter_id" name="enter_id" type="text" value="${principal.vo.user_id}" readonly="" class="inp_read">
                          </td>
                        </tr>
                        <tr>
                        <th>비밀번호<span class="ico">*<span class="screen_out">필수항목</span></span></th>
                          <td>
                            <input type="password" name="enter_pw" id="enter_pw" class="inp_pw">
                          </td>
                        </tr>
                      </tbody>
                    </table>
                    <input type="button" id="modifyEnter" class="btn active" value="확인">
                    <input name="${_csrf.parameterName}" type="hidden" value="${_csrf.token}">
                  </form>
                </div>
              </div>
            </div>
	</div>
	</div>
	
	<script>loadHTML("/footer");</script>
</body></html>
