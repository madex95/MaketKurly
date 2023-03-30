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
		<style>
		.btn-group button {
		    background-color: white;
		    border: 1px solid #5f0080;
		    color: #5f0080;
		    padding: 10px 24px;
		    cursor: pointer;
		    float: left;
		}
		
		/* Clear floats (clearfix hack) */
		.btn-group:after {
		    content: "";
		    clear: both;
		    display: table;
		}
		
		.btn-group button:not(:last-child) {
		    border-right: none;
		}
		
		.btn-group button:hover {
		    background-color: #E8D9FF;
		    opacity:0.8;
		}
		</style>
    </head>
    <body class="sb-nav-fixed">
		
		<!-- HEAD BAR -->
       	<script>loadHTML("./headNav");</script>
       	
        <div id="layoutSidenav"> 
        
        	<!-- SIDE BAR -->
        	<script>loadHTML("./sideNav");</script>
            
            <div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid px-4">
                    	<c:if test='${(boardAbled ne null)&&(boardAbled.write_abled eq "Y")}'>
	        				<div>
	        				<button type="button" onclick="location.href='./writeboard?code=${boardAbled.menu_part}'"class="btn btn-primary" style="background-color:#5f0080;border-color:#5f0080;float:right;">글쓰기</button>
	                        </div>
                        </c:if>
								
						<c:if test="${important ne null }">
	        				<div>
	        				<button type="button" onclick="location.href='./unreadboard?code=${boardAbled.menu_part}'"class="btn btn-primary" style="background-color:#5f0080;border-color:#5f0080;float:right;">답변하지 않은 글</button>
	                        </div>
                        </c:if>
                    	<!-- 메뉴 이름 -->
        				<script>loadHTML("./menuName?address=${address}");</script>
        				
                        <div class="card mb-4">
                            <div class="card-header">
                                <i class="fas fa-table me-1"></i>
                                글 목록
                            </div>
                            <div class="card-body">
		                        <div class="btn-group" style="margin-bottom:10px">
								  <button type="button" onclick="location.href='./community'">전체</button>
								  <c:forEach items = "${board}" var="board">
								  	<button type="button" onclick="location.href='./community?code=${board.menu_code}'">${board.menu_name}</button>
								  </c:forEach> 
								</div>
                                <table id="datatablesSimple">
                                    <thead>
                                        <tr>
                                            <th>글번호</th>
                                            <th>제목</th>
                                            <th>글쓴이</th>
                                            <th>작성일자</th>
                                        </tr>
                                    </thead>
                                    <tfoot>
                                        <tr>
                                            <th>글번호</th>
                                            <th>제목</th>
                                            <th>글쓴이</th>
                                            <th>작성일자</th>
                                        </tr>
                                    </tfoot>
                                    <tbody>
                                    	<c:forEach items="${boardList}" var="board">
                                    		<tr>
                                    			<td>${board.board_code}</td>
                                    			<td><a href="./detailboard?code=${board.board_code}">${board.board_title}</a></td>
                                    			<td>${board.board_id}</td>
                                    			<td>${board.board_date}</td>
                                    		</tr>
                                    	</c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </main>
                <!-- FOOTER -->
        		<script>loadHTML("./footer");</script>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <script src="${pageContext.request.contextPath}/resources/js/scripts.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest"></script>
        <script src="${pageContext.request.contextPath}/resources/js/datatables-simple-demo.js"></script>
    </body>
</html>