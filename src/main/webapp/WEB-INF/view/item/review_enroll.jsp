<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.4.1.js"
	integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
	crossorigin="anonymous"></script>
<link rel="stylesheet" href="/resources/css/itemdetail.css">
<meta charset="UTF-8">
<title>리뷰등록</title>

</head>

<body>

	<script>
		/* 취소 버튼 */
		$(document).ready(function() {
			$("button[name='cancel']").click(function(e) {
				window.close();
			})
		});

		/* 등록 버튼 */
				$(document).ready(function() {
			$("button[name='enroll']").click(function(e) {
			const item_code = '${list3.item_code}';
			//const memberId = '${memberId}';
			const review_grade = $("select").val();
			const review_content = $("textarea").val();
			const data = {
					review_itemcode : item_code,
					///memberId : memberId,
					review_grade : review_grade,
					review_content :review_content
							}
			$.ajax({
				data : data,
				type : 'POST',
				url : '/reply/enroll',
				success : function(result){
					/* 댓글 초기화 */
					$(opener.location).attr("href", "javascript:replyListInit();");
	 
					alert('리뷰가 등록되었습니다.');
					window.close();
				}
				
			});
			
			})
		});
	</script>
	<div class="wrapper_div">
		<div class="subject_div">리뷰 등록</div>

	</div>

	<div class="input_wrap">
		<div class="itemname_div">
			<h2>${list3.item_name}</h2>
		</div>
			<input type="hidden" value="${list3.item_code}"
				name="review_itemcode">

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
				<textarea name="review_content"></textarea>
			</div>

			<div class="btn_wrap">
				<a class="cancel_btn"><button name="cancel">취소</button></a> <a
					class="enroll_btn"><button type="submit" name="enroll">등록</button></a>
			</div>
	</div>

</body>
</html>