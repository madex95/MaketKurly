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
        <script src="${pageContext.request.contextPath}/resources/js/fileUpload.js?ver=1.0"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/check.js"></script>
        <script>	//회원가입 유효성검사
			function checkAll() {
        				if (!checkItemCode(form.item_code.value)) {
            				return false;
        				}
        				if (!checkItemName(form.item_name.value)) {
            				return false;
        				}
        				
        				if (!checkPrice(form.item_price.value)) {
            				return false;
        				}
        				if (!checkStock(form.item_stock.value)) {
            				return false;
        				}
        				if (!checkItemDetail(form.item_detail.value)) {
            				return false;
        				}
        				if (!checkImage(form.board_images.value)) {
            				return false;
        				}
 			}

			function checkImage(image) { //이미지 검사
        				//이미지가 선택되었는지 확인하기
					if (image == "") {
						alert("이미지는 적어도 한 장 이상 선택해주세요");
						return false;
					}
       				return true; //확인이 완료되었을 때
    			}

			function checkItemCode(itemCode) { //상품 코드 검사
        				//상품 코드가 입력되었는지 확인하기
       				 if (!checkExistData(itemCode,"상품 코드를")){
          				form.item_code.focus();
      					 return false;
       				 }
 					if(!byteCheck(itemCode,"상품 코드가",10)){
        				form.item_code.focus();
						return false;
					}
 
        				return true; //확인이 완료되었을 때
    			}

			function checkItemName(itemName) { //상품 이름 검사
        				//상품 이름이 입력되었는지 확인하기
        				if (!checkExistData(itemName, "상품 이름을")){
            				form.item_name.focus();
            				return false;
        				}
     					if(!byteCheck(itemName,"상품 이름이",100)){
            				form.item_name.focus();
    						return false;
    					}
        				return true; //확인이 완료되었을 때
   			 }

			function checkPrice(price) {			//가격 검사
        				//가격이 입력되었는지 확인하기
       		 		if (!checkExistData(price, "가격을")){
        				form.item_price.focus();
        				return false;
       		 		}
 
	       		 	if (price<0 || price>2147483647){
						alert("유효하지 않은 가격입니다.");
	            				form.item_price.focus();
	            				return false;
					}
        				return true; //확인이 완료되었을 때
    			}

			function checkStock(stock) {			//가격 검사
				//가격이 입력되었는지 확인하기
		 		if (!checkExistData(stock, "재고를")){
    				form.item_stock.focus();
    				return false;
		 		}
   		 	if (stock<0 || stock>2147483647){
				alert("유효하지 않은 재고입니다.");
        				form.item_stock.focus();
        				return false;
				}
					return true; //확인이 완료되었을 때
			}	
			function checkItemDetail(itemDetail) {
   	 			if (!checkExistData(itemDetail, "상품 설명을")){
    				form.item_detail.focus();
    				return false;
    	 			}
				if(!byteCheck(itemDetail,"상품 설명이",2000)){
    				form.item_detail.focus();
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
        				<button type="button" onclick="location.href='./itemlist'"class="btn btn-primary" style="background-color:#5f0080;border-color:#5f0080;float:right;">목록으로</button>
                        </div>
                        <h1 class="mt-4">상품 추가</h1><br>
                        <div class="card mb-4">
                            <div class="card-header">
                                <i class="fas fa-table me-1"></i>
                                상품 추가
                            </div>
                            <div class="card-body">
                            	<form name="form" action="./insertItem" method="post" onsubmit="return checkAll()" enctype="multipart/form-data">
					                <!-- ITEMCODE -->
					                <div>
					                    <h3 class="join_title">
					                        <label for="id">상품 코드</label>
					                    </h3>
					                    <span class="box int_id">
					                        <input type="text" name="item_code" class="int" maxlength="10">
					                    </span>
					                    <span class="error_next_box"></span>
					                </div>
					
					                <!-- ITEMNAME -->
					                <div>
					                    <h3 class="join_title"><label for="pswd1">상품 이름</label></h3>
					                    <span class="box int_pass">
					                        <input type="text" name="item_name" class="int" maxlength="50">
					                    </span>
					                    <span class="error_next_box"></span>
					                </div>
					
					                <!-- PRICE -->
					                <div>
					                    <h3 class="join_title"><label for="pswd2">가격</label></h3>
					                    <span class="box int_pass_check">
					                        <input type="number" name="item_price" class="int">
					                    </span>
					                    <span class="error_next_box"></span>
					                </div>
					                
					                <!-- CATEGORY -->
					                <div>
					                    <h3 class="join_title"><label for="pswd2">카테고리</label></h3>
					                    <span class="box int_pass_check">
					                        <select name="item_cgcode">
					                        	<c:forEach items="${categoryNameList}" var="Category">
					                        		<option value="${Category.code}">
					                        			${Category.name}
					                        			<c:if test="${Category.abled eq 'N'}">(사용안함)</c:if>
					                        		</option>
		                                        </c:forEach>
					                        </select>
					                    </span>
					                    <span class="error_next_box"></span>
					                </div>
					
					                <!-- STOCK -->
					                <div>
					                    <h3 class="join_title"><label for="name">재고</label></h3>
					                    <span class="box int_name">
					                        <input type="number" name="item_stock" class="int" maxlength="20">
					                    </span>
					                    <span class="error_next_box"></span>
					                </div>
					
					                <!-- DETAIL -->
					                <div>
					                    <h3 class="join_title"><label for="name">상품 설명</label></h3>
					                    <span class="box int_name"style="height:300px;">
					                        <textarea name="item_detail" class="int" style="height:280px;"></textarea>
					                    </span>
					                    <span class="error_next_box"></span>
					                </div>
					                
					                <!-- IMAGE -->
									<div class="filebox">
										<h3 class="join_title">상품 이미지</h3>
									  <span class="filetype">
									            <input type="hidden" id="board_image" name="board_images" class="file-text">
				            					<span id="board_image_id" class="file-text"></span>
									  <label for="input_file" style="border-radius:0.25rem">파일 찾기</label> 
									  <input multiple type="file" id="input_file" name="files"class="file_hidden"onchange="uploadChange(this);"> 
									  </span>
        							  <button type="button" onclick="deleteImage();'./community'"class="btn btn-primary" style="background-color:#5f0080;border-color:#5f0080;">이미지 삭제</button>
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
					                        <span>상품 올리기</span>
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
