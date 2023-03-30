<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fn" uri = "http://java.sun.com/jsp/jstl/functions" %>
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
        <script src="${pageContext.request.contextPath}/resources/js/fileUpload.js?ver=1.3"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/check.js"></script>
        <script>	// 유효성검사
        
			function checkAll() {
        				if (!checkBoardTitle(form.board_title.value)) {
            				return false;
        				}
        				if (!checkBoardContent(form.board_content.value)) {
            				return false;
        				}
 			}

			function checkBoardTitle(board_title) { //제목 검사
        				//제목이 입력되었는지 확인하기
       				 if (!checkExistData(board_title,"제목을")){
          				form.board_title.focus();
      					 return false;
       				 }
 					if(!byteCheck(board_title,"제목이",50)){
        				form.board_title.focus();
						return false;
					}
 
        				return true; //확인이 완료되었을 때
    			}

			function checkBoardContent(board_content) { //내용 검사
        				//내용이 입력되었는지 확인하기
        				if (!checkExistData(board_content, "내용을")){
            				form.board_content.focus();
            				return false;
        				}
     					if(!byteCheck(board_content,"내용이",2000)){
            				form.board_content.focus();
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
        				<button type="button" onclick="location.href='./community'"class="btn btn-primary" style="background-color:#5f0080;border-color:#5f0080;float:right;">목록으로</button>
                        </div>
                        <h1 class="mt-4">수정</h1><br>
                        <div class="card mb-4">
                            <div class="card-header">
                                <i class="fas fa-table me-1"></i>
                                수정
                            </div>
                            <div class="card-body">
                            	<form name="form" action="./updateBoard" method="post" onsubmit="return checkAll()" enctype="multipart/form-data">
                            		<input type="hidden" name="board_code" value="${code}">
                            		<input type="hidden" name="board_part" value="${board.board_part}">
					                <!-- BOARD_TITLE -->
					                <div>
					                    <h3 class="join_title">
					                        <label for="id">제목</label>
					                    </h3>
					                    <span class="box int_id">
					                        <input type="text" name="board_title" class="int" maxlength="50" value="${board.board_title}">
					                    </span>
					                </div>
					
					                <!-- BOARD_CONTENT -->
					                <div>
					                    <h3 class="join_title"><label for="name">내용</label></h3>
					                    <span class="box int_name"style="height:300px;">
					                        <textarea name="board_content" class="int" maxlength="800" style="height:280px;">${board.board_content}</textarea>
					                    </span>
					                </div>
					                
					                <!-- IMAGE -->
									<div class="filebox">
										<h3 class="join_title">이미지</h3>
									  <span class="filetype">
									            <input type="hidden" id="board_image" name="board_images" class="file-text" value="${fn:replace(board.board_image, ':', '  ')}">
				            					<span id="board_image_id" class="file-text">${fn:replace(board.board_image, ':', '  ')}</span>
									  <label for="input_file" style="border-radius:0.25rem">파일 찾기</label> 
									  <input multiple type="file" id="input_file" name="files"class="file_hidden"onchange="uploadChange(this);"> 
									  </span>
        								<button type="button" onclick="deleteImage();'./community'"class="btn btn-primary" style="background-color:#5f0080;border-color:#5f0080;">이미지 삭제</button>
									</div>
									
					                <!-- ADD BTN-->
					                <div class="btn_area">
					                    <button type="submit" id="btnJoin">
					                        <span>글쓰기</span>
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
