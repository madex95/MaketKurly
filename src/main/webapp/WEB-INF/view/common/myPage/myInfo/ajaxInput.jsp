<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page import="org.springframework.security.core.context.SecurityContextHolder" %>
<%@ page import="org.springframework.security.core.Authentication" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal" var="principal" />
</sec:authorize>
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
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
$(function(){
	
    var pwChk1=0; var pwChk2=0; 
    var emailChk=1; var emailOverlap=1; 
    var phoneChk=1; var phoneOverlap=1; var phoneCodeChk1=1; var phoneCodeChk2=1;
    var nameChk=1; var searchChk=1; var subChk=1;
    
    var valPw= RegExp("((?=.*[a-zA-Z])(?=.*[0-9])(?=.*[^a-zA-Z0-9가-힣\\s]).{10,16})");
    var valName= RegExp(/^[a-zA-Z가-힣]+$/);
    var valEmail = RegExp(/^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/);
    var valPhone = RegExp(/01[016789][^0][0-9]{2,3}[0-9]{3,4}/);
    var valCode = RegExp(/[0-9]{4,}/);
    
    // 페스워드 유효성 검사
    $("#modify_user_pw").keyup(function(){
    	pwChk1=0;
	    $("#modify_user_pw").blur(function(){
	        if($("#modify_user_pw").val()==""){
	            $("#modify_pw_error").html("필수 기입 사항입니다.");
	        } else if(!valPw.test($("#modify_user_pw").val())){
	            $("#modify_pw_error").html("올바른 비밀번호를 입력해주세요");
	            } else {$("#modify_pw_error").html(""); pwChk1=1;}
	        if($("#modify_user_pwval").val()==$("#modify_user_pw").val()){
	        	$("#modify_pwval_error").html(""); pwChk2=1;
	        }
	    });
    });
    
    // 페스워드 확인 유효성 검사
    $("#modify_user_pwval").keyup(function(){
    	pwChk2=0;
	    $("#modify_user_pwval").blur(function(){
	        if ($("#modify_user_pwval").val()==""){
	        	$("#modify_pwval_error").html("필수 기입 사항압니다.")
	        } else if($("#modify_user_pwval").val()!=$("#modify_user_pw").val()){
	            $("#modify_pwval_error").html("동일한 비밀번호를 입력해주세요");
	        } else {$("#modify_pwval_error").html(""); pwChk2=1;}
	    });
    });
    
    // 이름 유효성 검사
    $("#modify_user_name").keyup(function(){
    	nameChk=0;
	    $("#modify_user_name").blur(function(){
	        if($("#modify_user_name").val()==""){
	            $("#modify_name_error").html("이름를 입력해주세요");
	        } else if(!valName.test($("#modify_user_name").val())){
	            $("#modify_name_error").html("올바른 이름를 입력해주세요");
	            } else {$("#modify_name_error").html(""); nameChk=1;}
	    });
    });
    
    // 새 이메일 등록 버튼 
    $("#otherEmailBtn").click(function(){
    	emailChk=0; emailOverlap=0;
    	alert("기존과 다른 새로운 이메일을 입력 후 중복검사를 시행해주세요");
    	$("#modify_user_email").attr("readonly",false);
    	$("#modify_user_email").val("");
    	$("#otherEmailBtn").css({
    		"display":"none"
    	});
    	$("#emailOverlapBtn").css({
    		"display":""
    	});
    });
    
    // 이메일 유효성검사
    	$("#modify_user_email").blur(function(){
	   		 $("#modify_user_email").keyup(function(){
			    	emailChk=0; emailOverlap=0;	    
	    			});
    		if($("#modify_user_email").val()==""){
	            $("#modify_email_error").html("이메일 입력해주세요");
	        }else if(!valEmail.test($("#modify_user_email").val())){
	            $("#modify_email_error").html("올바른 이메일을 입력해주세요");
	            } else if(emailOverlap==0){
	            	emailChk=1;
	            	$("#modify_email_error").html("중복검사를 실행해주세요");
	            } else {$("#modify_email_error").html(""); emailChk=1;}
    		});
    
    // 이메일 중복 검사
    $("#emailOverlapBtn").click(function(){
    	if(emailChk==0){
			alert("유효한 이메일를 입력해주세요");
		} else{
			$.ajax({
				url : "/email",
				type : "get",
				dataType : "json",
				data : {email : $("#modify_user_email").val()},
				success : function(data){
					if(data == 0){
						$("#modify_email_error").html("다른 이메일을 입력해주세요.");
						alert("이미 사용중이거나 기존과 같은 이메일입니다.\n다른 이메일을 입력해주세요.");
						emailOverlap=0;
					}else if(data == 1){
						$("#modify_email_error").html("");
						alert("사용가능한 이메일 입니다.");
						emailOverlap=1;
						}
					}
				})
		}

    });
    
    // 새 번호 등록 버튼 
    $("#otherPhoneBtn").click(function(){
    	phoneChk=0; phoneOverlap=0; phoneCodeChk1=0; phoneCodeChk2=0;
    	alert("기존과 다른 새로운 번호를 입력 후 중복검사를 시행해주세요");
     	$("#modify_user_phone").attr("readonly",false);
    	$("#modify_user_phone").val("");
    	$("#otherPhoneBtn").css({
    		"display":"none"
    	});
    	$("#phoneOverlapBtn").css({
    		"display":""
    	}); 
    });
    
    // 번호 유효성검사
	$("#modify_user_phone").blur(function(){
   		 $("#modify_phone_email").keyup(function(){
   			phoneChk=0; phoneOverlap=0;	    
    			});
		if($("#modify_user_phone").val()==""){
            $("#modify_phone_error").html("이메일 입력해주세요");
        }else if(!valPhone.test($("#modify_user_phone").val())){
            $("#modify_phone_error").html("올바른 이메일을 입력해주세요");
            } else if(phoneOverlap==0){
            	phoneChk=1;
            	$("#modify_phone_error").html("중복검사를 실행해주세요");
            } else {$("#modify_phone_error").html(""); emailChk=1;}
		});
    
    // 번호 중복검사 후 통과시 인증번호 발송 버튼 등장
    $("#phoneOverlapBtn").click(function(){
    	if(phoneChk==0){
			alert("유효한 번호를 입력해주세요");
		} else{
			$.ajax({
				url : "/phone",
				type : "get",
				dataType : "json",
				data : {phone : $("#modify_user_phone").val()},
				success : function(data){
					if(data == 0){
						$("#modify_phone_error").html("사용중인 번호입니다. 새로운 번호를 입력해주세요.");
						alert("사용중인 번호입니다. 새로운 번호를 입력해주세요.");
						phoneOverlap=0;
					}else if(data == 1){
						$("#modify_phone_error").html("");
						$("#modify_user_phone").attr("readonly",true);
						$("#phoneOverlapBtn").css({
							"display":"none"
						});
						$("#codeBtn").css({
							"display":""
						});
						alert("사용가능한 번호입니다. 인증번호받기 버튼을 눌러주세요.");
						phoneOverlap=1;
						}
					}
				})
		}
    });
    
    //인증번호 날리기 버튼 -> 누르면 인증번호 입력, 검사하는 칸 등장
    //인증번호 담을 그릇 (code2)
     var code2 = "";
    $("#codeBtn").click(function(){
    		alert("인증번호 발송이 완료되었습니다. 휴대폰에서 인증번호 확인을 해주십시오.");
    		var phone = $("#modify_user_phone").val();
    		$.ajax({
    	        type:"GET",
    	        url:"/phoneCheck?phone="+phone,
    	        cache : false,
    	        success:function(data){
	        		$("#codeDiv").css({
	        			"display":""
	        		});
    	        	code2 = data;
    	        	}
    	        })
    	    });
    
    //인증번호 유효성검사
    $("#modify_phone_code").blur(function(){
        $("#modify_phone_code").keyup(function(){
        	phoneCodeChk1=0;
        });
        if($("#modify_phone_code").val()==""){
            $("#modify_code_error").html("인증번호를 입력해주세요 ");
        } else if(!valCode.test($("#modify_phone_code").val())){
            $("#modify_code_error").html("올바른 인증번호를 입력해주세요");
            } else {$("#modify_code_error").html(""); phoneCodeChk1=1;}
        });
    
    //인증번호 맞는지 확인하기버튼
    $("#codeChkBtn").click(function(){
    	if($("#modify_phone_code").val() == code2){
    		alert("인증에 성공하였습니다");
    		phoneCodeChk2=1;
    		$("#modify_phone_code").attr("readonly",true);
    	} else {
    		alert("인증번호가 다릅니다. 확인 후 다시 시도해주세요");
    		}
    });
    
    //주소 유효성검사
    $("#modify_sub_address").blur(function(){
    	if($("#modify_sub_address").val()==""){
    		subChk=0;
    		$("#modify_address_error").html("나머지 주소를 입력해주세요");
    	} else {subChk=1;}
    });
    
    
    //수정완료 버튼 유효성 최종 검사
    $("#modifyBtn").click(function(){
               if(pwChk1 == 0
            		   || pwChk2 == 0 
            		   || nameChk == 0 
            		   || emailChk == 0 
             		   || emailOverlap == 0 
            		   || phoneChk == 0 
            		   || phoneOverlap == 0 
            		 //  || phoneCodeChk1 == 0 
            		 //  || phoneCodeChk2 == 0 
            		   || $("#modify_address_code").val()==""
            		   || subChk == 0  ){
                $("#modify_btn_error").html("유효하지 않은 기입사항이 존재합니다.");
                return false;
            } else {
            	alert("정보수정이 성공적으로 완료되었습니다");
            	$("#modifyForm").submit();
            	}   

    });
    
    
	//@@@@@@@@@@ 카카오톡 주소 검색 API 시작 @@@@@@@@@@//
    $("#addressSearch").click(function(){

        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                
                } 
                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('modify_address_code').value = data.zonecode;
                document.getElementById("modify_address").value = addr;
            }
    }).open();
    });
  //@@@@@@@@@@ 카카오톡 주소 검색 API 끝 @@@@@@@@@@//
    
    
	
});
</script>
<style>
    .error_msg {color: red; font-size:17px; margin:10px 0px 10px 0px}
</style>
</head>
<body>

              <div class="page_section section_myinfo">
                <div class="head_aticle"><h2 class="tit">개인 정보 수정</h2></div>
                <div class="type_form member_join member_mod">
                  <form id="modformifyForm" method="post" action="/common/mypage/myinfo">
                    <table class="tbl_comm">
                    <tbody>
                    <tr class="fst">
                      <th>
                      아이디
                      </th>
                      <td>
                        <input type="text" id="modify_user_id" name="user_id" maxlength="16" fld_esssential="" option="regId" label="아이디" value="${principal.vo.user_id}" readonly="" placeholder="아이디를 입력해주세요">
                      </td>
                    </tr>
                            <tr>
                                <th>
                                비밀번호
                                </th>
                                <td>
                                    <input type="password" id="modify_user_pw" name="user_pw" name="password" fld_esssential="" option="regPass" label="비밀번호" maxlength="16" class="reg_pw" placeholder="비밀번호를 입력해주세요">
                                    <p class="error_msg" id="modify_pw_error"></p>
                                    <p class="txt_guide square">
                                    <span class="txt txt_case1">10자 이상 입력</span>
                                    <span class="txt txt_case3">영문/숫자/특수문자만 사용가능</span>
                                    <span class="txt txt_case2">영문/숫자/특수문자(공백 제외) 세가지가 모두 입력 되어야합니다.</span>
                                    </p>
                                </td>
                            </tr>
                            <tr class="member_pwd">
                                <th>
                                비밀번호확인
                                </th>
                                <td>
                                    <input type="password" id="modify_user_pwval" name="password2" fld_esssential="" option="regPass" label="비밀번호" maxlength="16" class="confirm_pw" placeholder="비밀번호를 한번 더 입력해주세요">
                                    <p class="error_msg" id="modify_pwval_error"></p>
                                    <p class="txt_guide square">
                                    <span class="txt txt_case1">동일한 비밀번호를 입력해주세요.</span>
                                    </p> 
                                </td>
                            </tr>
                            <tr>
                                <th>
                                이름
                                </th>
                                <td>
                                    <input type="text" id="modify_user_name" name="user_name" maxlength="40" value="${principal.vo.user_name}" fld_esssential="" label="이름" placeholder="이름을 입력해주세요">
                                  <p class="error_msg" id="modify_name_error"></p>
                                </td>
                            </tr>
                            <tr>
                                <th>
                                이메일
                                </th>
                                <td>
                                    <input type="text" id="modify_user_email" name="user_email" maxlength="40" value="${principal.vo.user_email}" data-email="" readonly="" fld_esssential="" option="regEmail" label="이메일" placeholder="예: marketkurly@kurly.com">
                                    <input type="button" id="otherEmailBtn" name="otherEmailBtn" class="btn default" value="새 이메일 등록">
                                    <input type="button" id="emailOverlapBtn" name="emailOverlapBtn" class="btn default" value="중복검사" style="display:none">
                                    <p class="error_msg" id="modify_email_error"></p>
                                    <!--                         <input type="hidden" name="val_email" fld_esssential="" label="이메일중복체크">
                                    <a href="javascript:void(0)" onclick="valEmail()" class="btn default">중복확인</a> -->
                                </td>
                            </tr>
                            <tr class="field_phone">
                                <th>
                                휴대폰
                                </th>
                                <td>
                                    <div class="phone_num">
                                        <input id="modify_user_phone"type="text" value="${principal.vo.user_phone}" pattern="[0-9]*" name="user_phone" maxlength="11"name="mobileInp" readonly="" placeholder="숫자만 입력해주세요" class="inp">
                                        <input type="button" id="otherPhoneBtn" name="otherPhoneBtn" class="btn default" value="새 번호 등록">
                                        <input type="button" id="phoneOverlapBtn" name="phoneOverlapBtn" class="btn default" value="중복검사" style="display:none">
                                      <input type="button" id="codeBtn" name="codeBtn" class="btn default" value="인증번호받기" style="display:none">
                                      <p class="error_msg" id="modify_phone_error"></p>
                                    </div>
                                    <div id="codeDiv" style="display:none">
                                    <input id="modify_phone_code" type="text" name="modify_phone_code" maxlength="4" name="mobileInp" class="inp">
                                    <input type="button" id="codeChkBtn" name="codeChkBtn" class="btn default" value="인증번호검사" >
                                    <p class="error_msg" id="modify_code_error"></p>
                                    </div>
            <!--                         <div id="codeNum" class="code_num">
                                   </div> -->
                                </td>
                            </tr>
                            <tr>
                                <th>
                            <tr>
                                <th>
                                주소
                                </th>
                                <td class="field_address">
                                    <a href='javascript:void(0);' id="addressSearch" class="search">
                                    <span id="addressNo" class="address_no">주소검색</span>
                                    </a>
                                     <!-- 받아온 주소 -->
                                    <input type="text"  id="modify_address_code" name="user_address_code" value="${principal.vo.user_address_code}" readonly="readonly" label="우편번호" placeholder="우편번호">
                                    <input type="text"  id="modify_address" name="user_address" value="${principal.vo.user_address}" readonly="readonly" label="지번 주소 또는 도로명 주소" placeholder="지번 주소 또는 도로명 주소">
                                     <input type="text" id="modify_sub_address" name="user_sub_address" value="${principal.vo.user_sub_address}" class="byteTotext" placeholder="나머지 주소를 입력해주세요">
                                    <p class="txt_guide">
                                    <p class="error_msg" id="modify_address_error"></p>
                                    <p class="txt_guide square">
                                    <span class="txt txt_case1">나머지 주소를 입력해주세요.</span>
                                    <span class="txt txt_case2">배송지에 따라 상품 정보가 달라질 수 있습니다.</span>
                                    </p>
                                </td>
                            </tr>
                            </tbody>
                        </table>
                        <div id="formSubmit" class="form_footer">
                          <p class="error_msg" id="modify_btn_error"></p> 
                          <a href="/common/mypage/delete" class="btn default">탈퇴하기</a>
                        <button type="submit" id="modifyBtn" class="btn active">수정완료</button>
                        <input name="${_csrf.parameterName}" type="hidden" value="${_csrf.token}">
                      </div>
                  </form>
                </div>
              </div>
            </div>
</body>
</html>