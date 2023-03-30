<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.4.1.js"
	integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
	crossorigin="anonymous"></script>
<script>
$(document).ready(function(){
	let review_grade = '${replyInfo.review_grade}';	
	

	$("option").each(function(i,obj){
		if(review_grade === $(obj).val()){
			$(obj).attr("selected", "selected");
		}
	});	
});
</script>
<meta charset="UTF-8">
<title>리뷰수정</title>
<link rel="stylesheet" href="/resources/css/itemdetail.css">
</head>
<body>
	<div class="wrapper_div">
		<div class="subject_div">리뷰 수정</div>

	</div>

	<div class="input_wrap">
		<div class="bookName_div">
			<h2>${list3.item_name}</h2>
		</div>
		<form method="post" action="/reply/update">
			<input type="hidden" name ="review_id" value="${replyInfo.review_id}">
			<input type="hidden" value="${list3.item_code}" name="review_itemcode">

			<div class="rating_div">
				<h4>평점</h4>
				<select name="review_grade">

					<option value=1>1</option>
					<option value=2>2</option>
					<option value=3>3</option>
					<option value=4>4</option>
					<option value=5>5</option>
				</select>
			</div>
			<div class="content_div">
				<h4>리뷰</h4>
				<textarea name="review_content">${replyInfo.review_content}</textarea>
			</div>

			<div class="btn_wrap">
				<a class="cancel_btn"><button name="cancel">취소</button></a> <a
					class="update_btn"><button name="update">수정</button></a>
			</div>
		</form>
	</div>

<script>
/* 취소 버튼 */
$(".cancel_btn").on("click", function(e){
	window.close();
});
/* 등록 버튼 */

		$(document).ready(function() {
			$("button[name='update']").click(function(e) {
	//const review_itemcode = '${replyInfo.review_itemcode}';
	//const item_code = '${list3.item_code}';
	//const memberId = '${memberId}';
	const review_grade = $("select").val();
	const review_content = $("textarea").val();		
	
	const data = {
			//review_id : review_id,
			//review_itemcode : item_code,
			//memberId : memberId,
			review_grade : review_grade,
			review_content : review_content
	}	
	
	$.ajax({
		data : data,
		type : 'POST',
		url : '/reply/update',
		success : function(result){
			$(opener.location).attr("href", "javascript:replyListInit();");
			alert("수정이 완료되었습니다");
			window.close(); 
		}			
	});
			})
		});



</script>
</body>
</html>