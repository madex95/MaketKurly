<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<!-- saved from url=(0042)https://www.kurly.com/shop/member/join.php -->
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0">
<meta name="description" content="" />
<meta name="author" content="" />
<title>관리자 모드</title>
<link rel="icon" type="image/png" href="https://res.kurly.com/images/marketkurly/logo/ico_16.png">
<link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
<link href="${pageContext.request.contextPath}/resources/css/styles.css" rel="stylesheet" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/loadHTML.js"></script>

<link rel="styleSheet" href="${path}/resources/css/common.css">

<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>

$(function(){

    var idChk=0; var idOverlap=0; var pwChk1=0; var pwChk2=0; var nameChk=0;
    var emailChk=0; var emailOverlap=0; 
    var phoneChk=0; var phoneOverlap=0; var phoneCodeChk1=0; var phoneCodeChk2=0;
    var searchChk=0; var subChk=0;
    
     var valId= RegExp("((?=.*[a-z])(?=.*[0-9]).{6,16})"); 
    var valPw= RegExp("((?=.*[a-zA-Z])(?=.*[0-9])(?=.*[^a-zA-Z0-9가-힣\\s]).{10,16})");
    var valName= RegExp(/^[a-zA-Z가-힣]+$/);
    var valEmail = RegExp(/^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/);
    var valPhone = RegExp(/01[016789][^0][0-9]{2,3}[0-9]{3,4}/);
    var valCode = RegExp(/[0-9]{4,}/);

    
	//@@@@@@@@@@ 유효성검사 시작 @@@@@@@@@@//
    //회원가입 아이디 유효성 검사
    $("#register_user_id").focus(function(){
    	idChk=0;
	$("#register_user_id").blur(function(){
        if($("#register_user_id").val()==""){
				$("#register_id_error").html("필수 기입 사항입니다.");
				} else if(!valId.test($("#register_user_id").val())){
					$("#register_id_error").html("아이디는 영문과 숫자를 포함하여 6~16자로 입력해주세요.");
				    } else if(idOverlap==0){
				    	idChk=1;
				    	$("#register_id_error").html("중복검사를 실행해주세요.");
				    } else {idChk=1;}
    });
    });
	
	$("#idOverlapBtn").click(function(){
		if(idChk==0){
			alert("아이디는 영문과 숫자를 포함하여 6~16자로 입력해주세요.");
		} else{
		$.ajax({
			url : "/overlap",
			type : "get",
			dataType : "json",
			data : {id : $("#register_user_id").val()},
			success : function(data){
				if(data == 0){
					$("#register_id_error").html("사용중인 아이디입니다. 새로운 아이디를 입력해주세요.");
					alert("사용중인 아이디입니다. 새로운 아이디를 입력해주세요.");
					idOverlap = 0;
				}else if(data == 1){
					$("#register_id_error").html("");
					alert("사용 가능한 아이디입니다.");
					idOverlap = 1;
					}
				}
			})
		}
	});

    //회원가입 페스워드 유효성 검사
    $("#register_user_pw").focus(function(){
    	pwChk1=0;
    $("#register_user_pw").blur(function(){
        if($("#register_user_pw").val()==""){
            $("#register_pw_error").html("필수 기입 사항입니다.");
        } else if(!valPw.test($("#register_user_pw").val())){
            $("#register_pw_error").html("비밀번호는 영문과 숫자, 특수문자를 포함하여 10~16자로 입력해주세요..");
            } else {$("#register_pw_error").html(""); pwChk1=1;}
    });
    });
    
    //회원가입 페스워드 확인 유효성 검사
    $("#register_user_pwval").focus(function(){
    	pwChk2=0;
    $("#register_user_pwval").blur(function(){
    	pwChk2=0;
        if ($("#register_user_pwval").val()==""){
        	$("#register_pwval_error").html("필수 기입 사항압니다.")
        } else if($("#register_user_pwval").val()!=$("#register_user_pw").val()){
            $("#register_pwval_error").html("동일한 비밀번호를 입력해주세요.");
        } else {$("#register_pwval_error").html(""); pwChk2=1;}
    });
    });

    //회원가입 이름 유효성 검사
    $("#register_user_name").focus(function(){
    	nameChk=0;
    $("#register_user_name").blur(function(){
        if($("#register_user_name").val()==""){
            $("#register_name_error").html("이름를 입력해주세요");
        } else if(!valName.test($("#register_user_name").val())){
            $("#register_name_error").html("올바른 이름를 입력해주세요.");
            } else {$("#register_name_error").html(""); nameChk=1;}
        });
    });

    //회원가입 이메일 유효성 검사
    $("#register_user_email").focus(function(){
    	emailChk=0;
    $("#register_user_email").blur(function(){
        if($("#register_user_email").val()==""){
            $("#register_email_error").html("이메일 입력해주세요.");
        } else if(!valEmail.test($("#register_user_email").val())){
            $("#register_email_error").html("올바른 이메일을 입력해주세요.");
            } else {$("#register_email_error").html(""); emailChk=1;}
        });
    });
    
    //회원가입 이메일 중복 검사
    $("#emailOverlapBtn").click(function(){
    	if(emailChk==0){
			alert("유효한 이메일를 입력해주세요");
		} else{
			$.ajax({
				url : "/email",
				type : "get",
				dataType : "json",
				data : {email : $("#register_user_email").val()},
				success : function(data){
					if(data == 0){
						$("#register_email_error").html("사용중인 이메일입니다. 새로운 이메일을 입력해주세요.");
						alert("사용중인 이메일입니다. 새로운 이메일을 입력해주세요.");
						emailOverlap=0;
					}else if(data == 1){
						$("#register_email_error").html("");
						alert("사용 가능한 이메일입니다.");
						emailOverlap=1;
						}
					}
				})
		}

    });
    
    //회원가입 휴대폰 유효성 검사
    $("#register_user_phone").focus(function(){
    	phoneChk=0;
    $("#register_user_phone").blur(function(){
        if($("#register_user_phone").val()==""){
            $("#register_phone_error").html("휴대폰 번호를 입력해주세요.");
        } else if(!valPhone.test($("#register_user_phone").val())){
            $("#register_phone_error").html("올바른 휴대폰 번호를 입력해주세요.");
            } else {$("#register_phone_error").html(""); phoneChk=1;}
        });
    });
    
    //회원가입 인증번호받기 클릭 시 번호 중복 검사
    $("#phoneOverlapBtn").click(function(){
    	if(phoneChk==0){
			alert("유효한 번호를 입력해주세요");
		} else{
			$.ajax({
				url : "/phone",
				type : "get",
				dataType : "json",
				data : {phone : $("#register_user_phone").val()},
				success : function(data){
					if(data == 0){
						$("#register_phone_error").html("사용중인 번호입니다. 새로운 번호를 입력해주세요.");
						alert("사용중인 번호입니다. 새로운 번호를 입력해주세요.");
						phoneOverlap=0;
					}else if(data == 1){
						$("#register_phone_error").html("");
						/* $("#phoneBtn").prop("disabled", true); */
						$("#register_user_phone").attr("readonly",true);
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
    
    //회원가입 인증번호 날리기 버튼
    //인증번호 담을 그릇 (code2)
     var code2 = "";
    $("#codeBtn").click(function(){
    		alert("인증번호 발송이 완료되었습니다. 휴대폰에서 인증번호 확인을 해주십시오.");
    		var phone = $("#register_user_phone").val();
    		console.log("aaaaaa");
    		console.log(phone);
    		$.ajax({
    	        type:"GET",
    	        url:"/phoneCheck?phone="+phone,
    	        cache : false,
    	        success:function(data){
	        		$("#register_phone_code").css({
	        			"display":""
	        		});
	        		$("#codeChkBtn").css({
	        			"display":""
	        		});
    	        	code2 = data;
    	        	}
    	        })
    	    });
    
    //회원가입 인증번호 유효성검사
    $("#register_phone_code").focus(function(){
    	phoneCodeChk1=0;
    $("#register_phone_code").blur(function(){
        if($("#register_phone_code").val()==""){
            $("#register_code_error").html("인증번호를 입력해주세요. ");
        } else if(!valCode.test($("#register_phone_code").val())){
            $("#register_code_error").html("올바른 인증번호를 입력해주세요.");
            } else {$("#register_code_error").html(""); phoneCodeChk1=1;}
        });
    });
    
    //회원가입 인증번호 맞는지 확인하기버튼
    $("#codeChkBtn").click(function(){
    	if($("#register_phone_code").val() == code2){
    		alert("인증에 성공하였습니다.");
    		phoneCodeChk2=1;
    		$("#register_phone_code").attr("readonly",true);
    	} else {
    		alert("인증번호가 다릅니다. 확인 후 다시 시도해주세요.");
    		}
    });
    
    //회원가입 주소 유효성 검사
    $("#register_sub_address").focus(function(){
    	searchChk=0
    	subChk=0;
    $("#register_sub_address").blur(function(){
    	if ($("#register_address_code").val()!=""){
    		searchChk=1;
    	} 
        if($("#register_sub_address").val()=="" && $("#register_address_code").val()==""){
            $("#register_address_error").html("주소검색과 나머지 주소를 입력해주세요.");
        } else if ($("#register_address_code").val()==""){
        	$("#register_address_error").html("주소검색을 해주세요.");
        } else if ($("#register_sub_address").val()==""){
        	$("#register_address_error").html("나머지 주소를 입력해주세요.");
        } else {$("#register_address_error").html(""); subChk=1;}
        });
    });
    
    //회원가입 버튼 유효성 최종 검사
    $("#registerBtn").click(function(){
               if(idChk == 0 
            		   || idOverlap == 0 
            		   || pwChk1 == 0 
            		   || pwChk2== 0 
            		   || nameChk == 0 
            		   || emailChk == 0 
             		   || emailOverlap == 0 
            		   || phoneChk == 0 
            		   || phoneOverlap == 0 
            		   || searchChk == 0 
            		   || subChk == 0  ){
                $("#register_btn_error").html("유효하지 않은 기입사항이 존재합니다.");
                return false;
            } else {alert("회원이 추가되었습니다.");$("#registerForm").submit();}   

    });
	//@@@@@@@@@@ 유효성검사 끝 @@@@@@@@@@//

	
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
                document.getElementById('register_address_code').value = data.zonecode;
                document.getElementById("register_address").value = addr;
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
<body class="sb-nav-fixed">

		
<!-- HEAD BAR -->
  	<script>loadHTML("headNav");</script>
  	
   <div id="layoutSidenav"> 
   
   	<!-- SIDE BAR -->
   	<script>loadHTML("sideNav");</script>
       
       <div id="layoutSidenav_content">
           <main>
               <div class="container-fluid px-4">
	<div class="tit_page">
		<h2 class="tit">회원추가</h2>
		<div align="right">
			<button type="button" onclick="location.href='./userlist'"class="btn btn-primary" style="background-color:#5f0080;border-color:#5f0080;">목록으로</button>
        </div>
	</div>
	<div class="type_form member_join ">
		<form id="registerForm" name="frmMember" method="post" action="./addMember">
			<p class="page_sub"><span class="ico">*</span>전부 기입해주세요</p>
			<table class="tbl_comm">
				<tbody>
				<tr class="fst">
					<th>
					아이디
					</th>
					<td>
						<input type="text" id="register_user_id" name="user_id" maxlength="16" placeholder="아이디를 입력해주세요">
						<input type="button" id="idOverlapBtn" name="idOverlapBtn" class="btn default" value="중복확인">
						<p class="error_msg" id="register_id_error"></p>
                        <p class="txt_guide square">
                        <span class="txt txt_case1">6자 이상 입력</span>
                        <span class="txt txt_case3">영문(소문자)/숫자만 사용가능</span>
                        <span class="txt txt_case2">영문(소문자)/숫자 두가지가 모두 입력 되어야합니다.</span>
                        </p>  
					</td>
				</tr>
                <tr>
                    <th>
                    비밀번호
                    </th>
                    <td>
                        <input type="password" id="register_user_pw" name="user_pw" name="password" fld_esssential="" option="regPass" label="비밀번호" maxlength="16" class="reg_pw" placeholder="비밀번호를 입력해주세요">
                        <p class="error_msg" id="register_pw_error"></p>
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
                        <input type="password" id="register_user_pwval" name="password2" fld_esssential="" option="regPass" label="비밀번호" maxlength="16" class="confirm_pw" placeholder="비밀번호를 한번 더 입력해주세요">
                        <p class="error_msg" id="register_pwval_error"></p>
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
                        <input type="text" id="register_user_name" name="user_name" maxlength="40" value="" placeholder="이름을 입력해주세요">
                    	<p class="error_msg" id="register_name_error"></p>
                    </td>
                </tr>
                <tr>
                    <th>
                    이메일
                    </th>
                    <td>
                        <input type="text" id="register_user_email" name="user_email" name="email" maxlength="40" value="" data-email="" fld_esssential="" option="regEmail" label="이메일" placeholder="예: marketkurly@kurly.com">
                        <input type="button" id="emailOverlapBtn" name="emailOverlapBtn" class="btn default" value="중복검사">
                        <p class="error_msg" id="register_email_error"></p>
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
                            <input id="register_user_phone"type="text" value="" pattern="[0-9]*" name="user_phone" maxlength="11"name="mobileInp" placeholder="숫자만 입력해주세요" class="inp">
                            <input type="button" id="phoneOverlapBtn" name="phoneOverlapBtn" class="btn default" value="중복검사">
                        	<input type="button" id="codeBtn" name="codeBtn" class="btn default" value="인증번호받기" style="display:none">
                        	<p class="error_msg" id="register_phone_error"></p>
                        </div>
                        <div >
                        <input id="register_phone_code" type="text" name="register_phone_code" maxlength="4" name="mobileInp" class="inp" style="display:none">
                        <input type="button" id="codeChkBtn" name="codeChkBtn" class="btn default" value="인증번호검사" style="display:none">
                        <p class="error_msg" id="register_code_error"></p>
                        </div>
<!--                         <div id="codeNum" class="code_num">
                       </div> -->
                    </td>
                </tr>
                <tr>
                    <th>
                    주소
                    </th>
                    <td class="field_address">
                        <a href='javascript:void(0);' id="addressSearch" class="search">
                        <span id="addressNo" class="address_no">주소검색</span>
                        </a>
                         <!-- 받아온 주소 -->
                        <input type="text"  id="register_address_code" name="user_address_code" value="" readonly="readonly" label="우편번호" placeholder="우편번호">
                        <input type="text"  id="register_address" name="user_address" value="" readonly="readonly" label="지번 주소 또는 도로명 주소" placeholder="지번 주소 또는 도로명 주소">
                       	<input type="text" id="register_sub_address" name="user_sub_address" value="" class="byteTotext" placeholder="나머지 주소를 입력해주세요">
                        <p class="txt_guide">
                        <p class="error_msg" id="register_address_error"></p>
                        <p class="txt_guide square">
                        <span class="txt txt_case1">나머지 주소를 입력해주세요.</span>
                        </p>
                    </td>
                </tr>
                
                <tr>
                    <th>
                    권한
                    </th>
                    <td>
                 		<c:forEach items="${grant}" var="grant">
		                    <label style="padding:10px 52px 10px 0">
								<input type="radio" name="user_auth" value="${grant.code }" checked="checked">
								<span class="ico"></span>${grant.name }
							</label>
                        </c:forEach>
                    </td>
                </tr>
                <tr>
                    <th>
                    사용 여부
                    </th>
                    <td>
		                <label style="padding:10px 52px 10px 0">
                 			<input type="checkbox" value="Y" checked name="abled" style="opacity:1">
                 		</label>
                    </td>
                </tr>
                </tbody>
            </table>
        <div id="formSubmit" class="form_footer">
            <p class="error_msg" id="register_btn_error"></p>
            <button type="submit" id="registerBtn" class="btn active btn_join">추가하기</button>
        	<input name="${_csrf.parameterName}" type="hidden" value="${_csrf.token}">
        </div>
        </form>
    </div>
 </div>
        </main>
        <!-- FOOTER -->
		<script>loadHTML("footer");</script>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/scripts.js"></script>
<script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest"></script>
<script src="${pageContext.request.contextPath}/resources/js/datatables-simple-demo.js"></script>
</body>
</html>