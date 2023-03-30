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
        <script>
        	function changeInputBox(){
        		var view = document.getElementById("view");
        		var update = document.getElementById("update");
        		view.style.display = "none";
        		update.style.display = "block";
        	}
        	
        	function check(){
        		var price = document.getElementById("deliveryPrice").value;
        		console.log(price);
        		if(price<0 || price=="" || price>2147483647){
        			alert("잘못된 배송비입니다.");
        			return false;
	        	}
        	}
        </script>
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
                        
                    	<!-- 메뉴 이름 -->
        				<script>loadHTML("./menuName?address=${address}");</script>
        				
                        <div class="card mb-4">
                            <div class="card-header">
                                <i class="fas fa-table me-1"></i>
                                배송비 조회
                            </div>
                            <div class="card-body">
                            	<div id="view">
	                            	배송비 : ${deliveryPrice }
                            	</div>
                                
	                            <div align="right">
	                            	<strong>금월 총 배송비 : ${nowDelivery}</strong>
	                            </div>
                            	<br><br>
                                <table id="datatablesSimple">
                                    <thead>
                                        <tr>
                                            <th>판매자</th>
                                            <th>총 건수</th>
                                            <th>배송비</th>
                                        </tr>
                                    </thead>
                                    <tfoot>
                                        <tr>
                                            <th>판매자</th>
                                            <th>총 건수</th>
                                            <th>배송비</th>
                                        </tr>
                                    </tfoot>
                                    <tbody>
                                    	<c:forEach items="${deliveryList}" var="delivery">
                                    		<tr>
                                    			<td>${delivery.seller }</td>
                                    			<td>${delivery.seller_count }건</td>
                                    			<td>${delivery.price }</td>
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
