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
        <link href="${pageContext.request.contextPath}/resources/css/styles.css" rel="stylesheet" />
        <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js"></script>
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
        				<button type="button" onclick="location.href='./addCategory'"class="btn btn-primary" style="background-color:#5f0080;border-color:#5f0080;float:right;">카테고리 추가</button>
                        </div>
                    	
                    	<!-- 메뉴 이름 -->
        				<script>loadHTML("menuName?address=${address}");</script>
        				
                        <div class="card mb-4">
                            <div class="card-header">
                                <i class="fas fa-table me-1"></i>
                                카테고리 목록
                            </div>
                            <div class="card-body">
                                <table id="datatablesSimple">
                                    <thead>
                                        <tr>
                                            <th>카테고리 코드</th>
                                            <th>카테고리 이름</th>
                                            <th>카테고리 수정</th>
                                            <th>사용여부</th>
                                            <th>상세보기</th>
                                        </tr>
                                    </thead>
                                    <tfoot>
                                        <tr>
                                            <th>카테고리 코드</th>
                                            <th>카테고리 이름</th>
                                            <th>카테고리 수정</th>
                                            <th>사용여부</th>
                                            <th>상세보기</th>
                                        </tr>
                                    </tfoot>
                                    <tbody>
                                        <c:forEach items="${categoryList}" var="Category">
                                           <tr>
                                               <td>${Category.code}</td>
                                               <td>${Category.name}</td>
                                               <td><a href="./modifyCategory?code=${Category.code}">수정</a></td>
                                               <td><a href="./updateCategoryAbled?code=${Category.code}&abled=${Category.abled}">${Category.abled}</a></td>
                                               <td><a href="./detailCategory?code=${Category.code}">상세 보기</a></td>
                                           </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>
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
