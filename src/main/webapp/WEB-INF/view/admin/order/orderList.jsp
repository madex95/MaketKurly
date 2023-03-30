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
                    	<!-- 메뉴 이름 -->
        				<script>loadHTML("menuName?address=${address}");</script>
        				
                        <div class="card mb-4">
                            <div class="card-header">
                                <i class="fas fa-table me-1"></i>
                                주문내역
                            </div>
                            <div class="card-body">
                                <table id="datatablesSimple">
                                    <thead>
                                        <tr>
                                            <th>주문날짜</th>
                                            <th>주문코드</th>
                                            <th>상품코드</th>
                                            <th>상품이름</th>
                                            <th>주문자</th>
                                            <th>배송지</th>
                                            <th>개수</th>
                                            <th>가격</th>
                                            <th>총 금액</th>
                                            <th>배송상태</th>
                                            <th>주문취소</th>
                                        </tr>
                                    </thead>
                                    <tfoot>
                                        <tr>
                                            <th>주문날짜</th>
                                            <th>주문코드</th>
                                            <th>상품코드</th>
                                            <th>상품이름</th>
                                            <th>주문자</th>
                                            <th>배송지</th>
                                            <th>가격</th>
                                            <th>개수</th>
                                            <th>총 금액</th>
                                            <th>배송상태</th>
                                            <th>주문취소</th>
                                        </tr>
                                    </tfoot>
                                    <tbody>
                                        <c:forEach items="${orderList}" var="Order">
                                           <tr>
                                               <td><fmt:formatDate value="${Order.order_date}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                                               <td>${Order.order_code}</td>
                                               <td>${Order.item_code}</td>
                                               <td>${Order.item_name}</td>
                                               <td>${Order.user_id}</td>
                                               <td>${Order.address}</td>
                                               <td>${Order.order_count}</td>
                                               <td>${Order.price}</td>
                                               <td>${Order.price * Order.order_count}</td>
                                               <td>${Order.order_state}</td>
                                               <td><a href="./orderCancel?order_code=${Order.order_code}&item_code=${Order.item_code}">주문취소</a></td>
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
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" ></script>
        <script src="${pageContext.request.contextPath}/resources/js/scripts.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" ></script>
        <script src="${pageContext.request.contextPath}/resources/js/datatables-simple-demo.js"></script>
    </body>
</html>
