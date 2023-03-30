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
        <link href="${pageContext.request.contextPath}/resources/css/styles.css?ver1.3" rel="stylesheet"/>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/loadHTML.js?ver=1.0"></script>
    </head>
    <body class="sb-nav-fixed">
	    <script>
		  var preContent;
		
		  function view_content(obj)
		  {
		    var div = obj.parentNode;
		    for (var i=1, m=div.childNodes.length;i<m;i++) {
		      if (div.childNodes[i].nodeType != 1) continue;	// text node.
		      else if (obj == div.childNodes[ i ]) continue;
		
		      obj = div.childNodes[ i ];
		      break;
		    }
		
		    if (preContent && obj!=preContent){
		      obj.style.display = "block";
		      preContent.style.display = "none";
		    }
		    else if (preContent && obj==preContent) preContent.style.display = ( preContent.style.display == "none" ? "block" : "none" );
		    else if (preContent == null ) obj.style.display = "block";
		
		    preContent = obj;
		  }
		
		   { // 초기출력
		    var no = "faq_";
		    if ( document.getElementById( no ) ) view_content( document.getElementById( no ) );
		  } 
		</script>
    <body class="sb-nav-fixed">
		
		<!-- HEAD BAR -->
       	<script>loadHTML("./headNav");</script>
       	
        <div id="layoutSidenav"> 
        
        	<!-- SIDE BAR -->
        	<script>loadHTML("./sideNav");</script>
            
            <div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid px-4">
        				<div>
        				<button type="button" onclick="location.href='./addMenu'"class="btn btn-primary" style="background-color:#5f0080;border-color:#5f0080;float:right;">메뉴 추가</button>
                        </div>
                    	<!-- 메뉴 이름 -->
        				<script>loadHTML("./menuName?address=${address}");</script>
        				
                        <div class="card mb-4">
                            <div class="card-header">
                                <i class="fas fa-table me-1"></i>
                                메뉴 목록
                            </div>
                            <div class="card-body">
                                <div>
                                	<div>
										<table class="table table-fixed">
											<tbody>
												<tr>
													<th class="input_txt">메뉴 코드</th>
													<th class="input_txt">메뉴 이름</th>
													<th class="input_txt">메뉴 주소</th>
													<th class="input_txt">수정, 삭제 가능 여부</th>
													<th class="input_txt">사용 여부</th>
													<th class="input_txt">소메뉴 추가</th>
													<th class="input_txt">메뉴 변경</th>
													<th class="input_txt">메뉴 삭제</th>
												</tr>
											</tbody>
										</table>
									</div> 
                                	<c:forEach items="${menuList}" var="Menu">
                                		<div>
											<table class="table table-hover table-fixed" class="table_faq" onclick="view_content(this)" id="faq_166">
												<tbody>
													<tr>
														<td style="cursor:pointer">${Menu.menu_code}</td>
														<td style="cursor:pointer">${Menu.menu_name}</td>
														<td></td>
														<td style="cursor:pointer">${Menu.update_abled }</td>
														<td style="cursor:pointer"><a href="./updateMenuAbled?menu_code=${Menu.menu_code}">${Menu.abled}</a></td>
														<td><a href='./addSubMenu?menu_code=${Menu.menu_code}'>소메뉴 추가</a></td>
														<td><a href='./modifyMenu?menu_code=${Menu.menu_code}'>수정</a></td>
														<td><a href='./deleteMenu?menu_code=${Menu.menu_code}'>삭제</a></td>
													</tr>
												</tbody>
											</table>
											<div style="display:none; border-top:1px solid #e6e6e6">
												<table class="table table-active table-fixed" >
													<tbody>
													<c:forEach items="${subMenuMap.get(Menu.menu_code)}" var="SubMenu">
													<tr class="table-active" valign="top">
													<td> ${SubMenu.menu_code}</td>
													<td> ${SubMenu.menu_name}</td>
													<td> ${SubMenu.menu_address}</td>
													<td> ${SubMenu.update_abled}</td>
													<td> <a href="./updateSubMenuAbled?menu_code=${SubMenu.menu_code}">${SubMenu.abled}</a></td>
													<td></td>
													<td><a href='./modifySubMenu?menu_code=${SubMenu.menu_code}'>수정</a></td>
													<td><a href='./deleteSubMenu?menu_code=${SubMenu.menu_code}'>삭제</a></td>
													</tr>
													</c:forEach>
													</tbody>
												</table>
											</div>
										</div>
                                	</c:forEach>
								</div>
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
