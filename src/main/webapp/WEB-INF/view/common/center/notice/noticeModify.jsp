<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
 <sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal" var="principal"/>
</sec:authorize> 
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
<style>
#main{min-height: 100vh}
</style>
</head>
<body>
<script>loadHTML("/header");</script>
<div id="qnb" class="quick-navigation" style="top: 70px;"></div>
<div class="page_aticle aticle_type2">
  <div id="snb" class="snb_cc">
  	        <h2 class="tit_snb">고객센터</h2>
        <div class="inner_snb">
            <ul class="list_menu">
            <li class="on">
            <a href="/center/noticepage" onclick="">공지사항</a>
            </li>
            <li>
            <a href="https://www.kurly.com/shop/board/list.php?id=notice&amp;page=1#none" onclick="">1:1 문의하기</a>
            </li>
            <li>
            <a href="https://www.kurly.com/shop/board/list.php?id=notice&amp;page=1#none" onclick="">자주하는 질문</a>
            </li>
            </ul>
        </div>
    </div>
    <div id="main">
    <div id="content">
  </div>
  <div class="page_section section_qna">
            <div class="head_aticle">
            <h2 class="tit">글쓰기</h2>
        </div>
    <div class="xans-board-write">
      <form name="fm" id="modifyForm" method="post" action="/center/noticemodify" style="height: 100%;" enctype="multipart/form-data">
        <input type="hidden" name="mode" value="add_qna">
        <input type="hidden" name="itemcd" value="">
        <input type="hidden" name="sno" value="0">
        <input type="hidden" name="board_part" id="board_part" value="${noticeModify.board_part}">
        <table id="table_after" class="boardWrite2" width="100%">
          <colgroup><col width="14%" align="right"></colgroup>
          <tbody>
            <tr>
              <th class="input_txt">제목</th>
              <td>
                <input type="text" id="board_title" name="board_title" style="width:100%" required="" fld_esssential="" label="제목" value="${noticeModify.board_title}">
               </td>
            </tr>
            <tr>
              <th class="input_txt">작성자</th>
              <td>
                <input type="text" id="board_id" name="board_id" readonly="" value="${noticeModify.board_id}">
                <input type="hidden" id="board_name" name="board_name" value="${principal.vo.user_name}">
                <input type="hidden" id="board_code" name="board_code" value="${noticeModify.board_code}">
              </td>
            </tr>
            <tr>
              <th class="input_txt">내용</th>
              <td class="edit_area" style="position: relative;">
                <style>
                    #qnaNotice .qna_goods{display:none}
                </style>
                <div id="qnaNotice">
                  <div class="inner_qnaNotice">
                    <div class="notice_qna"><!--
                1:1문의하기에 들어가는 class="qna_public"
                상품문의하기에 들어가는 class="qna_goods"
                -->
                    </div>
                  </div>
                </div>

              <textarea id="board_content" name="board_content" style="width:100%;height:474px;" class="editing_area"  fld_esssential="" label="내용">${noticeModify.board_content}</textarea>
              </td>
            </tr>
            <tr>
              <th class="input_txt">이미지</th>
              <td>
                <table width="95%" id="table" cellpadding="0" cellspacing="0" border="0" style="border:solid 1px #f4f4f4; border-collapse:collapse; display:none;">
                  <tbody>
                    <tr id="tr_0">
                      <td width="20" nowrap="" align="center">1</td>
                      <td width="100%">
                        <input type="file" id="" name="file" name="files[]" style="width:50%" class="linebg" accept="image/gif, image/jpeg, image/png" onchange="fileCheck(this)">
                        <a href="javascript:add()"><img src="${path}/resources/image/btn_upload_plus.webp" align="absmiddle"></a>
                      </td>
                    </tr>
                  </tbody>
                </table>
                <table>
                  <tbody>
                    <tr>
                      <td height="2">
                      	<div class="type_form">
                    		<label class="label_block">
				              <input type="button" id="conf" name="conf" value="첨부 파일 변경">
				              <input type="hidden" id="up" name="up" value="1">
				            </label>
                      	</div>
                      </td>
                    </tr>
                  </tbody>
                </table>
                <div width="100%" style="padding:5px;">
                - 이미지 파일만 업로드 가능하며, 최대 5개까지 업로드가 지원됩니다.<br>
                </div>
              </td>
            </tr>
          </tbody>
        </table>
      </form>
        <table width="100%">
          <tbody>
            <tr>
              <td align="right" style="padding-top:5px; border:none;" id="avoidDbl">
              <input onclick="lastCheck(this)" type="button"  class="bhs_button yb" value="수정완료" style="float:none;">
              </td>
            </tr>
          </tbody>
        </table>
    </div>
  </div>
  </div>
  </div>
  <script>loadHTML("/footer");</script>
  <script>
  $(function(){
	  
	  $("#conf").click(function(){
		  var con = confirm("기존에 업로드한 파일들은 초기화됩니다. 진행하시겠습니까?");
		  
		  if(con==true){
			  $("#up").val("2");
			  $("#table").show();
			  $("#conf").hide();
		  } else {
			  $("#up").val("1");
			  }
	  });

	  
  });
  </script>
  <!-- 
  <script>
  function fn_boardRegi(){
	    var id = $("#board_id").val();
		var title = $("#board_title").val();
		var content = $("#board_content").val();
		var file = $('input[name=file]').val();
		
		$.ajax({
			type : "POST",
			url : "/regi",
			data : {id : id, title : title, content : content, file : file},
			success: function(data){
				if(data == "Y"){
					location.href = "/center/noticepage";		
				}
			},
			error: function(data){
				console.log(data+"fail");
			}
		});
	};
  </script>
   -->
  <script>
  var fchk=0;

  
  function fileCheck(obj) {
	    pathpoint = obj.value.lastIndexOf('.');
	    filepoint = obj.value.substring(pathpoint+1,obj.length);
	    filetype = filepoint.toLowerCase();
	    if(filetype=='jpg' || filetype=='gif' || filetype=='png' || filetype=='jpeg' || filetype=='bmp') {

	        // 정상적인 이미지 확장자 파일일 경우 ...

	    } else {
	        alert('이미지 파일이 아닙니다. 이미지 파일을 업로드해주세요.');

	        parentObj  = obj.parentNode
	        node = parentObj.replaceChild(obj.cloneNode(true),obj);

	        return false;
	    }
	}
  
  
  function lastCheck() {
	  var num = 0;
	  var files = document.getElementsByName("file");
	  
		for(i=0; i<files.length; i++){
		    pathpoint = files[i].value.lastIndexOf('.');
		    filepoint = files[i].value.substring(pathpoint+1,files[i].length);
		    filetype = filepoint.toLowerCase();
		    if(pathpoint=-1 || filetype=='jpg' || filetype=='gif' || filetype=='png' || filetype=='jpeg' || filetype=='bmp') {
		    	
		    } else {
		    	num=num+1;
		    	}
		}
		
		if(num>0){
			alert("업로드 한 파일 중 이미지가 아닌 파일이 존재합니다.");
			return false;
		} else {
			document.getElementById('modifyForm').submit();
		}
  }

  </script>
  <script type="text/javascript">

      function add(){
          var table = document.getElementById('table');
          var reviewFileNum = "5";
          if (table.rows.length>=parseInt(reviewFileNum)){
              alert("업로드는 최대 "+reviewFileNum+"개만 지원합니다");
              return;
          }
          var tr_num = table.rows.length;
          oTr		= table.insertRow( table.rows.length );
          oTr.id	= "tr_"+(tr_num);
          oTd1		= oTr.insertCell(0);
          oTd1.style.textAlign = "center";
          oTd2		= oTr.insertCell(1);
          tmpHTML = "<input type=file name='file' name='files[]' style='width:50%' class=line accept='image/gif, image/jpeg, image/png' onchange='fileCheck(this)'> <a href=\"javascript:del('"+"tr_"+(tr_num)+"')\"><img src='${path}/resources/image/btn_upload_minus.webp' align=absmiddle></a>";
          oTd2.innerHTML = tmpHTML;
          calcul();
      }
      function del(index,ncode)
      {
          var table = document.getElementById('table');
          for (i=0;i<table.rows.length;i++) if (index==table.rows[i].id) table.deleteRow(i);
          calcul();
      }
      function calcul()
      {
          var table = document.getElementById('table');
          for (var i=0;i<table.rows.length;i++){
              table.rows[i].cells[0].innerHTML = i+1;
          }
      }

  </script>

</body>
</html>