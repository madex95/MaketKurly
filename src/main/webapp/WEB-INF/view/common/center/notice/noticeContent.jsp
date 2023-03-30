<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="shortcut icon" href="https://res.kurly.com/images/marketkurly/logo/favicon_v2.png" type="image/x-icon">
<link rel="styleSheet" href="${path}/resources/css/normalize.css">
<link rel="styleSheet" href="${path}/resources/css/section1.css">
<link rel="styleSheet" href="${path}/resources/css/common.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/loadHTML.js"></script>
</head>
<body>
<script>loadHTML("/header");</script>
<c:set var="var" value="${varReply}" />
<c:set var="part" value="${noticeContent.board_part}" />

<div class="tit_page">
	<c:choose>
	<c:when test="${part eq 'notice'}">
	  <h2 class="tit">공지사항</h2>
	  <p class="sub">컬리의 새로운 소식들과 유용한 정보들을 한곳에서 확인하세요.</p>
 	</c:when>
	<c:when test="${part eq 'question'}">
	  <h2 class="tit">1:1 문의</h2>
	  <p class="sub">직접 묻고 싶은 궁금한 사항들을 이 곳에서 해결하세요.</p>
 	</c:when>
	<c:when test="${part eq 'faq'}">
	  <h2 class="tit">자주 묻는 질문</h2>
	  <p class="sub">자주 묻는 질문들을 이 곳에서 빠르게 확인하세요.</p>
 	</c:when>
 	</c:choose>
</div>
<div id="main">
  <div id="content">
    <div class="layout-wrapper">
      <div class="xans-element- xans-myshop xans-myshop-couponserial ">
      	
        <table width="100%" align="center" cellpadding="0" cellspacing="0">
        <tbody>
          <tr>
            <td>
            <table width="100%">
            <tbody>
              <tr>
                <td>
                <form role="form" method="post" autocomplete="off">
                <input type="hidden" name="board_code" value="${noticeContent.board_code}" />
                </form>
                <table class="boardView" width="100%">
                <tbody>
                  <tr>
                    <th scope="row" style="border:none;">제목</th>
                    <td>${noticeContent.board_title}</td>
                  </tr>
                  <tr>
                    <th scope="row">작성자</th>
                    <td>${noticeContent.board_id}</td>
                  </tr>
                  <tr class="etcArea">
                    <td colspan="2">
                      <ul>
                        <li class="date ">
                          <strong class="th">작성일</strong> <span class="td"><fmt:formatDate value="${noticeContent.board_date}" pattern="yyyy-MM-dd"/></span>
                        </li>
                      </ul>
                    </td>
                  </tr>
                </tbody>
                </table>
                </td>
              </tr>
              <tr>
                <td align="right" class="eng" style="padding:5px;">
                </td>
              </tr>
              <tr>
                <td style="padding:10px;" height="200" valign="top" id="contents">
                <table width="100%" style="table-layout:fixed">
                <tbody>
                  <tr>
                    <td class="board_view_content" style="word-wrap:break-word;word-break:break-all" id="contents_1282" valign="top">
                      <c:set var="asd" value="${noticeContent.board_image}"/>
                      <c:choose>
	                      <c:when test="${empty asd}"></c:when>
	                      
	                      <c:otherwise>
	                      <c:set var="image" value="${fn:split(noticeContent.board_image,':')}"/>
		                      <c:forEach items="${image}" var="image">
			                      <div>
			                      	<img src="${path}/resources/image/center/notice/<fmt:formatDate value="${noticeContent.board_date}" pattern="yyyy-MM-dd" />\<c:out value="${noticeContent.board_code}"/>-${image}">
			                      </div>
		                      </c:forEach>
	                      </c:otherwise>
                      </c:choose>
                      ${noticeContent.board_content}
                  </tr>
                </tbody>
                </table>
               </td>
              </tr>
              <c:if test="${part ne 'question'}">
              <tr>
                <td height="1" bgcolor="#f4f4f4"></td>
              </tr>
              </c:if>
	        </tbody>
	        </table>
	        <c:choose>
	        <c:when test="${part eq 'notice' || part eq 'faq'}">
			<table width="100%" style="table-layout:fixed" cellpadding="0" cellspacing="0">
			<tbody>
			  <tr>
			    <td align="center" style="padding-top:10px;">
			      <table width="100%">
			      <tbody>
			        <tr>
			          <td align="right">
			            <a href="https://www.kurly.com/shop/board/list.php?id=notice&amp;page=1"><span class="bhs_button yb" style="float:none;">목록</span></a>
			          </td>
			        </tr>
			      </tbody>
			      </table>
			    </td>
			  </tr>
			</tbody>
			</table>
			</c:when>
			
			<c:otherwise>
			</c:otherwise>
			</c:choose>
		</td>
		</tr>
	</tbody>
	</table>
		
	   </div>
	</div>
	
	<!------------------ 답변 폼 ----------------->
	<!------------------ 답변 폼 ----------------->
	<!------------------ 답변 폼 ----------------->
	<c:if test="${part eq 'question'}">
	    <div class="layout-wrapper">
      <div class="xans-element- xans-myshop xans-myshop-couponserial ">
      	
        <table width="100%" align="center" cellpadding="0" cellspacing="0">
        <tbody>
          <tr>
            <td>
            <table width="100%">
            <tbody>
              <tr>
                <td>
                <form role="form" method="post" autocomplete="off">
                <input type="hidden" name="board_code" value="${noticeContent.board_code}" />
                <input type="hidden" name="board_part" value="${noticeContent.board_part}" />
                </form>
                <table class="boardView" width="100%">
                <tbody>
                  <tr>
                    <th scope="row">작성자</th>
                    <td>
                    <c:if test="${var >= 1}">
                    ${readReply.reply_author}
                    </c:if>
                    <c:if test="${var < 1}">
                    </c:if>
                    </td>
                  </tr>
                  <tr class="etcArea">
                    <td colspan="2">
                      <ul>
                        <li class="date ">
                          <strong class="th">작성일</strong>
                          <span class="td">
                          <c:if test="${var >= 1}">
                          <fmt:formatDate value="${readReply.reply_date}" pattern="yyyy-MM-dd"/>
                          </c:if>
                          <c:if test="${var < 1}">
                          </c:if>
                          </span>
                        </li>
                      </ul>
                    </td>
                  </tr>
                </tbody>
                </table>
                </td>
              </tr>
              <tr>
                <td align="right" class="eng" style="padding:5px;">
                </td>
              </tr>
              <tr>
                <td style="padding:10px;" height="200" valign="top" id="contents">
                <table width="100%" style="table-layout:fixed">
                <tbody>
                  <tr>
                  <c:if test="${var >= 1}">
                    <td class="board_view_content" style="word-wrap:break-word;word-break:break-all" id="contents_1282" valign="top">
                      ${readReply.reply_content}
                    </td>
                  </c:if>
                  <c:if test="${var < 1}">
                  <td class="board_view_content" style="word-wrap:break-word;word-break:break-all;text-align: center;" id="contents_1282" valign="top">
                  	답변이 아직 작성되지 않았습니다. 상담원이 확인 후 답변을 작성 할 때까지 기다려주세요.
                  </td>
                  </c:if>
                  </tr>
                </tbody>
                </table>
                </td>
              </tr>
              <tr>
                <td height="1" bgcolor="#f4f4f4"></td>
              </tr>
	        </tbody>
	        </table><br>
			<table width="100%" style="table-layout:fixed" cellpadding="0" cellspacing="0">
			<tbody>
			  <tr>
			    <td align="center" style="padding-top:10px;">
			    	<c:if test="${var < 1}">
			      <table width="100%">
			      <tbody>
			        <tr>
			          <td align="right">
			            <input id="modifyBtn" type="submit" class="bhs_button yb" style="float:none;" value="수정">
			          </td>
			        </tr>
			      </tbody>
			      </table>
			      <br>
			      <table width="100%">
			      <tbody>
			        <tr>
			          <td align="right">
			            <input id="deleteBtn" type="submit" class="bhs_button yb btn_open" style="float:none;" value="삭제">
			          </td>
			        </tr>
			      </tbody>
			      </table>
			      <br>
			      </c:if>
			      <table width="100%">
			      <tbody>
			        <tr>
			          <td align="right">
			            <a href="https://www.kurly.com/shop/board/list.php?id=notice&amp;page=1"><span class="bhs_button yb" style="float:none;">목록</span></a>
			          </td>
			        </tr>
			      </tbody>
			      </table>
			    </td>
			  </tr>
			</tbody>
			</table>
			</td>
		  </tr>
		</tbody>
		</table>
		
	   </div>
	</div>
	</c:if>
	
	
	
	
	
	
	
	
	
	
	
	
	
	
</div>
</div>
 
 
 
  <!--  
 <sec:authorize access="hasRole('ADMIN')">
 <table width="100%">
 <tbody>
   <tr>
     <td align="right">
       <input id="modifyBtn" type="submit" class="bhs_button yb" style="float:none;" value="수정">
     </td>
   </tr>
 </tbody>
 </table><br>
 <table width="100%">
 <tbody>
   <tr>
     <td align="right">
       <input id="deleteBtn" type="submit" class="bhs_button yb btn_open" style="float:none;" value="삭제">
     </td>
   </tr>
 </tbody>
 </table>
 </sec:authorize>
  -->


<script>loadHTML("/footer");</script>
 <script>
 
 // 폼을 변수에 저장
 var formObj = $("form[role='form']");
 
 // 수정 버튼 클릭
 $("#modifyBtn").click(function(){
  
  formObj.attr("action", "/center/noticemodify");
  formObj.attr("method", "get");  
  formObj.submit();     
  
 });
 
 
 // 삭제 버튼 클릭
 $("#deleteBtn").click(function(){
  	
	 var conf = confirm("정말로 공지사항을 삭제하시겠습니까?");
	 
	 if(conf==true){
     formObj.attr("action", "/center/noticedelete");
     formObj.attr("method", "get");  
     formObj.submit();
     alert("성공적으로 삭제되었습니다. 목록으로 이동합니다.");
	 }
	 
	 
 });
 
 </script>
</body>
</html>