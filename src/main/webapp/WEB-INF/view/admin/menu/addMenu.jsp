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
        <script>	//카테고리 추가 유효성검사
			function checkAll() {
        				if (!checkCode(form.menu_code.value)) {
            				return false;
        				}
        				if (!checkName(form.menu_name.value)) {
            				return false;
        				}
 			}

			function checkCode(menu_code) { //메뉴 코드 검사
        				//메뉴 코드가 입력되었는지 확인하기
       				 if (!checkExistData(menu_code,"메뉴 코드를")){
          				form.menu_code.focus();
      					 return false;
       				 }
     				if(!byteCheck(menu_code,"메뉴 코드가",10)){
        				form.menu_code.focus();
    					return false;
    				}
        				return true; //확인이 완료되었을 때
    			}

			function checkName(menu_name) { //메뉴 이름 검사
        				//메뉴 이름이 입력되었는지 확인하기
        				if (!checkExistData(menu_name, "메뉴 이름을")){
            				return false;
        				}
         				if(!byteCheck(menu_name,"메뉴 이름이",50)){
            				form.menu_name.focus();
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
        				<button type="button" onclick="location.href='./menu'"class="btn btn-primary" style="background-color:#5f0080;border-color:#5f0080;float:right;">목록으로</button>
                        </div>
                        <h1 class="mt-4">메뉴 추가</h1><br>
                        <div class="card mb-4">
                            <div class="card-header">
                                <i class="fas fa-table me-1"></i>
                                메뉴 추가
                            </div>
                            <div class="card-body">
                            	<form name="form" action="./insertMenu" method="post" onsubmit="return checkAll()">
					                <!-- MENU CODE -->
					                <div>
					                    <h3 class="join_title">
					                        <label for="id">메뉴 코드</label>
					                    </h3>
					                    <span class="box int_id">
					                        <input type="text" name="menu_code" class="int" maxlength="10">
					                    </span>
					                    <span class="error_next_box"></span>
					                </div>
					
					                <!-- MENU NAME -->
					                <div>
					                    <h3 class="join_title"><label for="pswd1">메뉴 이름</label></h3>
					                    <span class="box int_pass">
					                        <input type="text" name="menu_name" class="int" maxlength="30">
					                    </span>
					                    <span class="error_next_box"></span>
					                </div>
					                
					                <!-- UPDATE ABLED -->
					                <div>
					                    <h3 class="join_title"><label for="pswd2">수정, 삭제 가능 여부</label>
					                    <input type="checkbox" name="update_abled" value="Y" checked>
					                    </h3>
					                </div>
					
					                <!-- ABLED -->
					                <div>
					                    <h3 class="join_title"><label for="pswd2">사용여부</label>
					                    <input type="checkbox" name="abled" value="Y" checked>
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
