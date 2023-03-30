<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fn" uri = "http://java.sun.com/jsp/jstl/functions" %>
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
        <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/check.js?ver=1.0"></script>
        <script>	//유효성검사
			function checkAll() {
				if (!checkReply_content(form.reply_content.value)) {
					return false;
				}
			}
			function checkAll2() {
				if (!checkReply_content2(document.getElementById("reply_content").value)) {
					return false;
				}
			}
		
			function checkReply_content(reply_content) { //답변 검사
					//답변이 입력되었는지 확인하기
					 if (!checkExistData(reply_content,"답변을")){
						form.reply_content.focus();
						 return false;
					 }
					if(!byteCheck(reply_content,"답변이",2000)){
					form.reply_content.focus();
					return false;
				}
		
					return true; //확인이 완료되었을 때
			}
			function checkReply_content2(reply_content) { //답변 검사
				//답변이 입력되었는지 확인하기
				 if (!checkExistData(reply_content,"답변을")){
					 document.getElementById("reply_content").focus();
					 return false;
				 }
				if(!byteCheck(reply_content,"답변이",2000)){
					document.getElementById("reply_content").focus();
					return false;
				}
			
				return true; //확인이 완료되었을 때
			}
		
			function add_textbox(reply_num){
		        var view = document.getElementById("view"+reply_num);
		        var input = document.getElementById("input"+reply_num);
		        view.style.display = 'none';
		        input.style.display='block';
			}
        
        </script>
        <style>
        	.spanBox{
        		padding-top:10px;
        		padding-bottom:10px;
        		border: solid 1px #dadada;
        		padding-left: 10px;
        	}
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
        				<div>
        				<button type="button" onclick="location.href='./community'"class="btn btn-primary" style="background-color:#5f0080;border-color:#5f0080;float:right;">목록으로</button>
                        </div>
                        <h1 class="mt-4">게시판 상세</h1><br>
                        <div class="card mb-4">
                            <div class="card-header">
                                <i class="fas fa-table me-1"></i>
                                게시판 상세
                            </div>
                            <div class="card-body">
		        				<div>
		        				<c:if test="${delete ne null }">
		        				<button type="button" onclick="location.href='./deletecommunity?code=${board.board_code}'"class="btn btn-primary" style="background-color:#5f0080;border-color:#5f0080;float:right;margin-left:20px">삭제</button>
		        				</c:if>
		        				<c:if test="${modify ne null }">
		        				<button type="button" onclick="location.href='./modifycommunity?code=${board.board_code}'"class="btn btn-primary" style="background-color:#5f0080;border-color:#5f0080;float:right;">수정</button>
		                        </c:if>
		                        </div>
                            	<div style="width:70%">
                            	<div>
	                            	<table style="width:100%">
	                            		<tr>
	                            			<td width="20%"><h3>제목</h3></td>
	                            			<td><h3 class="spanBox">${board.board_title}</h3></td>
	                            		</tr>
	                            		<tr>
	                            			<td width="20%"><h3>글쓴이</h3></td>
	                            			<td><h3 class="spanBox">${board.board_id}</h3></td>
	                           			</tr>
	                           			<tr>
	                            			<td width="20%"><h3>작성일자</h3></td>
	                            			<td><h3 class="spanBox">${board.board_date}</h3></td>
	                           			</tr>
	                           			<c:choose>
	                           			<c:when test="${board.board_ordercode ne null}">
		                           			<tr>
		                           				<td width="20%"><h3>주문내역</h3></td>
		                           				<td><h3 class="spanBox">${board.item_name}(주문코드: ${board.board_ordercode}, 상품코드: ${board.board_itemcode}, 수량: ${board.order_count})</h3></td>
		                           			</tr>
	                           			</c:when>
	                           			<c:when test="${board.board_itemcode ne null}">
		                           			<tr>
		                           				<td width="20%"><h3>문의 상품</h3></td>
		                           				<td><h3 class="spanBox">${board.item_name}(상품코드: ${board.board_itemcode})</h3></td>
		                           			</tr>
	                           			</c:when>
	                           			</c:choose>
	                           			<tr>
	                            			<td width="20%"><h3>내용</h3></td>
	                            			<td><pre class="spanBox" style="margin:19px 0 8px; font-size:14px; font-weight:700">${board.board_content}</pre></td>
	                           			</tr>
	                            	</table>
                            	</div>
                            	
				                <!-- IMAGE -->
					            <c:if test="${board.board_image ne null}">
									<div class="filebox">
										<h3 class="join_title">이미지</h3>
										<c:set var="image" value="${fn:split(board.board_image,':')}"/>
										<c:forEach items="${image}" var="image">
											<div style="margin:10px">
											<img style="width:60%" src="${pageContext.request.contextPath}/resources/image/center/${board.board_part}/<fmt:formatDate value="${board.board_date}" pattern="yyyy-MM-dd"/>/${image}">
											</div>
										</c:forEach>
									</div>
								</c:if>
								
								<!-- REPLY -->
								<c:if test="${boardAbled.reply_abled eq 'Y'}">
								<!-- REPLYWRITE -->
								<c:if test = "${replyList.size() eq 0 }">
									<h3>답변</h3>
					                <div style="margin-bottom:10px; margin-top:10px">
					                	<form name="form" method="post" action="./insertReply" onsubmit="return checkAll()">
					                		<input type="hidden" name="reply_boardNum" value="${board.board_code}">
					                		<table style="width:100%">
					                			<tr>
					                				<td style="width:90%"><textarea name="reply_content" class="int spanBox" maxlength="800" style="height:100px;"></textarea></td>
					                				<td><button type="submit" class="btn btn-primary" style="width:100%;padding:20px;background-color:#5f0080;border-color:#5f0080;height:100px">답변하기</button></td>
					                			</tr>
					                		</table>
				                        </form>
					                </div>
				                </c:if>
				                <!-- REPLYLIST -->
				                <div>
				                	<c:forEach items="${replyList}" var="reply">
						                <div id = "box" class="spanBox" style="margin-bottom:10px; padding:10px">
						                	<div id="view${reply.reply_num}">
						                		<c:if test="${delete ne null || reply.reply_author eq id }">
		        								<button type="button" onclick="location.href='./deleteReply?code=${reply.reply_num}&board_code=${board.board_code}'"class="btn btn-primary" style="background-color:#5f0080;border-color:#5f0080;float:right;">삭제</button>
		        								</c:if>
						                		<c:if test="${reply.reply_author eq id }">
		        								<button type="button" onclick="add_textbox(${reply.reply_num})" class="btn btn-primary" style="background-color:#5f0080;border-color:#5f0080;float:right; margin-right:10px">수정</button>
								                </c:if>
								                
							                	<h3>작성자	${reply.reply_author }</h3>
							                	<h3>작성일자	${reply.reply_date }</h3>
							                	<pre>${reply.reply_content }</pre>
							                </div>
						                	<div id="input${reply.reply_num}" style="display:none">
						                		<form name="form2" action="updateReply" method="post" onsubmit="return checkAll2()">
	        										<button type="submit" class="btn btn-primary" style="background-color:#5f0080;border-color:#5f0080;float:right;">수정</button>
								                	<input type="hidden" name="code" value="${board.board_code}">
								                	<input type="hidden" name="reply_code" value="${reply.reply_num }">
								                	<h3>작성자	${reply.reply_author }</h3>
								                	<h3>작성일자	${reply.reply_date }</h3>
							                		<textarea id="reply_content" style="height:100px;width:70%" name="reply_content"class="int spanBox" maxlength="800">${reply.reply_content}</textarea>
						                		</form>
						                	</div>
						                </div>
					                </c:forEach>
				                </div>
				                </c:if>
					        </div>
					        </div>
                        </div>
                    </div>
                </main>
            </div>
        </div>0
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest"></script>
        <script src="${pageContext.request.contextPath}/resources/js/scripts.js"></script>
        <script src="${pageContext.request.contextPath}/resources/js/datatables-simple-demo.js"></script>
    </body>
</html>
