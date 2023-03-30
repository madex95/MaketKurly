<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
        <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/loadHTML.js"></script>
    </head>
    <body class="sb-nav-fixed">
		
		<!-- HEAD BAR -->
       	<script>loadHTML("headNav");</script>
       	<script>
       	function checkAll() {
			checkStartDate(form.startDate.value);
			checkEndDate(form.endDate.value) ;
			}
		
		function checkStartDate(startDate) { 
				 if (startDate==""){
					form.startDate.value="1111-01-01"; 
				 }
			}
		
		function checkEndDate(endDate) { 
			 if (endDate==""){
					form.endDate.value="9999-12-31"; 
				 }
			 }
       	</script>
       	
        <div id="layoutSidenav"> 
        
        	<!-- SIDE BAR -->
        	<script>loadHTML("sideNav");</script>
            <div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid px-4">
        				<div>
        				<button type="button" onclick="location.href='./category'"class="btn btn-primary" style="background-color:#5f0080;border-color:#5f0080;float:right;">목록으로</button>
                        </div>
                        <h1 class="mt-4">카테고리 상세</h1><br>
                        <div class="card mb-4">
                            <div class="card-header">
                                <i class="fas fa-table me-1"></i>
                                카테고리 상세
                            </div>
                            
                            <!-- 상세 정보 -->
                            <div class="card-body">
				                <!-- CATEGORY CODE -->
				                <div>
				                    <h3 class="join_title">
				                        <label for="id">카테고리 코드</label>
				                    </h3>
				                    <span class="box int_id">
				                        <label for="id">${category.code}</label>
				                    </span>
				                    <span class="error_next_box"></span>
				                </div>
				
				                <!-- CATEGORY NAME -->
				                <div>
				                    <h3 class="join_title"><label for="pswd1">카테고리 이름</label></h3>
				                    <span class="box int_pass">
				                        <label for="id">${category.name}</label>
				                    </span>
				                    <span class="error_next_box"></span>
				                </div>
				
				                <!-- ABLED -->
				                <div>
				                    <h3 class="join_title"><label for="pswd2">사용여부</label>
				                    <c:choose>
					                    <c:when test="${category.abled eq 'Y' }">
					                    	<input type="checkbox" name="abled" value="Y" checked disabled>
					                    </c:when>
					                    <c:otherwise>
					                    	<input type="checkbox" name="abled" value="Y" disabled>
					                    </c:otherwise>
				                    </c:choose>
				                    </h3>
				                </div>
					        </div>
                        </div><br>
                        <!-- 이력 정보 -->
					        <div class="card mb-4">
                            <div class="card-header">
                                <i class="fas fa-table me-1"></i>
                                카테고리 이력 정보
                            </div>
                            <div class="card-body">
								<form name="form" action="./searchCGHistory" method="post"onsubmit="return checkAll()" >
								<input type="hidden" name="code" value="${category.code}">
				                
                            <!-- DATE -->
				                <div>
				                    <h3 class="join_title"><label for="pswd2" style="margin:20px">일자</label>
				                    <span class="box int_pass"style="display:inline;">
				                        <input type="date" name="startDate" class="int" maxlength="20" style="display:inline; width:39%;padding-right:20px">
				                    </span><label for="pswd2" style="margin:21px">~</label>
				                    <span class="box int_pass"style="display:inline;">
				                        <input type="date" name="endDate" class="int" maxlength="20" style="display:inline; width:39%;padding-right:20px;">
				                    </span>
				                    </h3>
				                </div>
				
				                
				                <!-- SEARCH BTN-->
				                <div class="btn_area" style="float:right; padding-right:60px">
				                    <button type="submit" id="btnJoin" style="width:100px; height:40px; padding: 0px;">
				                        <span>조회하기</span>
				                    </button>
				                </div><br><br>
				                
				                </form>
               
				                <!-- RESULT -->
				                <div>
				                    <h3 class="join_title"><label for="pswd2">검색 결과</label></h3>
				                </div>
                                <table id="datatablesSimple">
                                    <thead>
                                        <tr>
                                            <th>카테고리 코드</th>
                                            <th>카테고리 이름</th>
                                            <th>시작 일자</th>
                                            <th>종료 일자</th>
                                        </tr>
                                    </thead>
                                    <tfoot>
                                        <tr>
                                            <th>카테고리 코드</th>
                                            <th>카테고리 이름</th>
                                            <th>시작 일자</th>
                                            <th>종료 일자</th>
                                        </tr>
                                    </tfoot>
                                    <tbody>
                                        <c:forEach items="${categoryHistoryList}" var="category">
                                        	<tr>
                                        		<td>${category.code }</td>
                                        		<td>${category.name }</td>
                                        		<td><fmt:formatDate value="${category.startDate}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                                        		<td><fmt:formatDate value="${category.endDate}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                                        	</tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
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
