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
        				
                        <div class="row">
                            <div class="col-xl-6">
                                <div class="card mb-4">
                                    <div class="card-header">
                                        <i class="fas fa-chart-area me-1"></i>
                                        최근 20일 간 일별 매출액
                                    </div>
                                    <div class="card-body"><canvas id="myAreaChart" width="100%" height="40"></canvas><br>
                                    <a href="./daySales">자세히 보기</a>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xl-6">
                                <div class="card mb-4">
                                    <div class="card-header">
                                        <i class="fas fa-chart-bar me-1"></i>
                                        최근 6개월 간 월별 매출액
                                    </div>
                                    <div class="card-body"><canvas id="myBarChart" width="100%" height="40"></canvas><br>
                                    <a href="./monthSales">자세히 보기</a></div>
                                </div>
                            </div>
                        </div>
                        <div class="card mb-4">
                            <div class="card-header">
                                <i class="fas fa-table me-1"></i>
                                금월 상품별 판매 개수
                            </div>
                            <div class="card-body">
                                <table id="datatablesSimple">
                                    <thead>
                                        <tr>
                                            <th>상품코드</th>
                                            <th>상품이름</th>
                                            <th>가격</th>
                                            <th>개수</th>
                                        </tr>
                                    </thead>
                                    <tfoot>
                                        <tr>
                                            <th>상품코드</th>
                                            <th>상품이름</th>
                                            <th>가격</th>
                                            <th>개수</th>
                                        </tr>
                                    </tfoot>
                                    <tbody>
                                        <c:forEach items="${salesList}" var="Sales">
                                           <tr>
                                               <td>${Sales.item_code}</td>
                                               <td>${Sales.item_name}</td>
                                               <td>${Sales.price}</td>
                                               <td>${Sales.total_count}</td>
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
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js"></script>
        <%-- <script src="${pageContext.request.contextPath}/resources/assets/demo/chart-area-demo.js?ver=1.0"></script>
        <script src="${pageContext.request.contextPath}/resources/assets/demo/chart-bar-demo.js?ver=1.0"></script> --%>
        <script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest"></script>
        <script src="${pageContext.request.contextPath}/resources/js/datatables-simple-demo.js"></script>
        <script>
	     	var salesDay = [];
	     	var salesDayValue = [];
	     	<c:forEach items="${dateList}" var="date">
		     	salesDay.push("${date.dates}");
		     	salesDayValue.push("${date.value}")
	     	</c:forEach>
	        var ctx = document.getElementById("myAreaChart");
	        var myLineChart = new Chart(ctx, {
	          type: 'line',
	          data: {
	            labels: salesDay,
	            /* labels: ["Mar 1", "Mar 2", "Mar 3", "Mar 4", "Mar 5", "Mar 6", "Mar 7", "Mar 8", "Mar 9", "Mar 10", "Mar 11", "Mar 12", "Mar 13"], */
	            datasets: [{
	              label: "Sessions",
	              lineTension: 0.3,
	              backgroundColor: "rgba(95, 0, 128,0.2)",
	              borderColor: "rgba(95, 0, 128,1)",
	              pointRadius: 5,
	              pointBackgroundColor: "rgba(95, 0, 128,1)",
	              pointBorderColor: "rgba(255,255,255,0.8)",
	              pointHoverRadius: 5,
	              pointHoverBackgroundColor: "rgba(95, 0, 128,1)",
	              pointHitRadius: 50,
	              pointBorderWidth: 2,
	              data: salesDayValue,
	              /* data: [10000, 30162, 26263, 18394, 18287, 28682, 31274, 33259, 25849, 24159, 32651, 31984, 38451], */
	            }],
	          },
	          options: {
	            scales: {
	              xAxes: [{
	                time: {
	                  unit: 'date'
	                },
	                gridLines: {
	                  display: false
	                },
	                ticks: {
	                  maxTicksLimit: 7
	                }
	              }],
	              yAxes: [{
	                ticks: {
	                  min: 0,
	                  maxTicksLimit: 5
	                },
	                gridLines: {
	                  color: "rgba(0, 0, 0, .125)",
	                }
	              }],
	            },
	            legend: {
	              display: false
	            }
	          }
	        });
        </script>
    	<script>
	     	var salesDay = [];
	     	var salesDayValue = [];
	     	<c:forEach items="${monthList}" var="date">
		     	salesDay.push("${date.dates}");
		     	salesDayValue.push("${date.value}")
	     	</c:forEach>
	        var ctx = document.getElementById("myBarChart");
	        var myLineChart = new Chart(ctx, {
	          type: 'bar',
	          data: {
        	  labels: salesDay,
	            /* labels: ["January", "February", "March", "April", "May", "June"], */
	            datasets: [{
	              label: "Revenue",
	              backgroundColor: "rgba(95, 0, 128,1)",
	              borderColor: "rgba(95, 0, 128,1)",
	              data: salesDayValue,
	              /* data: [4215, 5312, 6251, 7841, 9821, 14984], */
	            }],
	          },
	          options: {
	            scales: {
	              xAxes: [{
	                time: {
	                  unit: 'month'
	                },
	                gridLines: {
	                  display: false
	                },
	                ticks: {
	                  maxTicksLimit: 6
	                }
	              }],
	              yAxes: [{
	                ticks: {
	                  min: 0,
	                  maxTicksLimit: 5
	                },
	                gridLines: {
	                  display: true
	                }
	              }],
	            },
	            legend: {
	              display: false
	            }
	          }
	        });
        </script> 
    </body>
</html>
