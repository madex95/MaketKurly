<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>관리자 모드</title>
        <link rel="icon" type="image/png" href="https://res.kurly.com/images/marketkurly/logo/ico_16.png">
        <link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="${pageContext.request.contextPath}/resources/css/styles.css" rel="stylesheet"/> 
        <link href="${pageContext.request.contextPath}/resources/css/member_css.css" rel="stylesheet"/> 
        <link href="${pageContext.request.contextPath}/resources/css/fileUpload.css" rel="stylesheet"/> 
        <script src="${pageContext.request.contextPath}/resources/js/fileUpload.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/check.js"></script>
        <script>	//메뉴 추가 유효성검사
			function checkAll() {
        				if (!checkName(form.menu_name.value)) {
            				return false;
        				}
        				if (!checkAddress(form.menu_address.value)) {
            				return false;
        				}
 			}

			function checkName(menu_name) { //메뉴 이름 검사
        				//메뉴 이름이 입력되었는지 확인하기
        				if (!checkExistData(menu_name, "메뉴 이름을")){
            				form.menu_name.focus();
            				return false;
        				}
         				if(!byteCheck(menu_name,"메뉴 이름이",50)){
            				form.menu_name.focus();
        					return false;
        				}
        				return true; //확인이 완료되었을 때
   			 }
			function checkAddress(menu_address) { //메뉴 경로 검사
				//메뉴 이름이 입력되었는지 확인하기
				if (!checkExistData(menu_address, "메뉴 경로를")){
    				form.menu_address.focus();
    				return false;
				}
 				if(!byteCheck(menu_address,"메뉴 경로가",20)){
    				form.menu_address.focus();
					return false;
				}
				return true; //확인이 완료되었을 때
		 }
		</script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/loadHTML.js"></script>
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
        				<div>
        				<button type="button" onclick="location.href='./board'"class="btn btn-primary" style="background-color:#5f0080;border-color:#5f0080;float:right;">목록으로</button>
                        </div>
                        <h1 class="mt-4">게시판 메뉴 수정</h1><br>
                        <div class="card mb-4">
                            <div class="card-header">
                                <i class="fas fa-table me-1"></i>
                                게시판 메뉴 수정
                            </div>
                            <div class="card-body">
                            	<form name="form" action="./updateBoardMenu" method="post" onsubmit="return checkAll()">
					                <!-- BOARD CODE -->
					                <div>
					                    <h3 class="join_title">
					                        <label for="id">메뉴 코드</label>
					                    </h3>
					                    <span class="box int_id">
					                        <label for="id">${board.menu_code}</label>
					                        <input type="hidden" name="menu_code" value="${board.menu_code}">
					                    </span>
					                    <span class="error_next_box"></span>
					                </div>
					
					                <!-- BOARD NAME -->
					                <div>
					                    <h3 class="join_title"><label for="pswd1">메뉴 이름</label></h3>
					                    <span class="box int_pass">
					                        <input type="text" name="menu_name" class="int" maxlength="30" value="${board.menu_name}">
					                    </span>
					                    <span class="error_next_box"></span>
					                </div>
					                
					                <!-- BOARD PART -->
					                <div>
					                    <h3 class="join_title"><label for="pswd1">메뉴 구분자</label></h3>
					                    <span class="box int_pass">
					                        <input type="text" name="menu_part" class="int" maxlength="20" value="${board.menu_part }">
					                    </span>
					                    <span class="error_next_box"></span>
					                </div>
					
					                <!-- ABLED -->
					                <div>
					                    <h3 class="join_title"><label for="pswd2">사용여부</label>
					                    <c:choose>
						                    <c:when test="${board.abled eq 'Y' }">
						                    	<input type="checkbox" name="abled" value="Y" checked>
						                    </c:when>
						                    <c:otherwise>
						                    	<input type="checkbox" name="abled" value="Y">
						                    </c:otherwise>
					                    </c:choose>
					                    </h3>
					                </div>
					                
					                <!-- REPLY_ABLED -->
					                <div>
					                    <h3 class="join_title"><label for="pswd2">댓글 가능 여부</label>
					                    <c:choose>
						                    <c:when test="${board.reply_abled eq 'Y' }">
						                    	<input type="checkbox" name="reply_abled" value="Y" checked>
						                    </c:when>
						                    <c:otherwise>
						                    	<input type="checkbox" name="reply_abled" value="Y">
						                    </c:otherwise>
					                    </c:choose>
					                    </h3>
					                </div>
					                
					                <!-- WRITE_ABLED -->
					                <div>
					                    <h3 class="join_title"><label for="pswd2">쓰기 가능 여부</label>
					                    <c:choose>
						                    <c:when test="${board.write_abled eq 'Y' }">
						                    	<input type="checkbox" name="write_abled" value="Y" checked>
						                    </c:when>
						                    <c:otherwise>
						                    	<input type="checkbox" name="write_abled" value="Y">
						                    </c:otherwise>
					                    </c:choose>
					                    </h3>
					                </div>
					                
					                <!-- WRITE_ABLED -->
					                <div>
					                    <h3 class="join_title"><label for="pswd2">안 읽은 글 알림</label>
					                    <c:choose>
						                    <c:when test="${board.important eq 'Y' }">
						                    	<input type="checkbox" name="important" value="Y" checked>
						                    </c:when>
						                    <c:otherwise>
						                    	<input type="checkbox" name="important" value="Y">
						                    </c:otherwise>
					                    </c:choose>
					                    </h3>
					                </div>
					                
					                <!-- ADD BTN-->
					                <div class="btn_area">
					                    <button type="submit" id="btnJoin">
					                        <span>메뉴 추가</span>
					                    </button>
					                </div>
					        </form>
					        </div>
                        </div>
                    </div>
                </main>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest"></script>
        <script src="${pageContext.request.contextPath}/resources/js/scripts.js"></script>
        <script src="${pageContext.request.contextPath}/resources/js/datatables-simple-demo.js"></script>
    </body>
</html>
