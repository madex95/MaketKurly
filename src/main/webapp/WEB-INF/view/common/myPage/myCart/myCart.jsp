<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
 <sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal" var="principal"/>
</sec:authorize> 
<!DOCTYPE html>
<!-- saved from url=(0042)https://www.kurly.com/shop/member/join.php -->
<html lang="ko"><head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>마켓컬리 :: 내일의 장보기, 마켓컬리</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0">


<link rel="shortcut icon" href="https://res.kurly.com/images/marketkurly/logo/favicon_v2.png" type="image/x-icon">
<link rel="styleSheet" href="${path}/resources/css/normalize.css">
<link rel="styleSheet" href="${path}/resources/css/section1.css">
<link rel="styleSheet" href="${path}/resources/css/common.css">
<link rel="stylesheet" type="text/css" href="${path}/resources/css/list.bundle.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/loadHTML.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<script>
function order_onclick(){
	
	<c:if test="${empty cartList}">
	alert('장바구니에 상품이 없습니다.');
	return false;
	</c:if>
	return true;
}

</script>





<style>
	#main{min-height: 100vh}
	
	.addr{
	    display: block;
	    width: 100%;
	    height: 36px;
	    font-weight: 700;
	    font-size: 12px;
	    line-height: 34px;
	    }
</style>
</head>
<script>loadHTML("/header");</script>
<!-- 장바구니 시작 -->
<div class="tit_page">
  <h2 class="tit">장바구니</h2>
</div>
<div id="main">
<div id="content">
<form method="post" action="/common/order" onsubmit="return order_onclick()">
<input type="hidden" id="form_id" name="form_id" value="${principal.vo.user_id}">
<div id="cartItemList" class="only_pc" style="min-height: 651px;">
  <div class="">
    <!-- 장바구니 목록 시작 -->
    <div class="cart_item ">
      <div class="cart_select">
        <div class="inner_select">
          <label class="check">
	          <input type="checkbox" name="checkAll" checked="">
	          <span class="ico"></span>전체선택
          </label>
          <a href="javascript:void(0)" class="btn_delete select_delete">선택삭제</a>

        </div>
      </div>
      <div class="box cold">
        <ul class="list ">
        <c:forEach items="${cartList}" var="cartList" >
        <input type="number" name="cart_num" value="${cartList.cart_num}" style="display:none">
        <input type="text" id="itemCode" name="itemCode" value="${cartList.cart_itemcode}" style="display:none">
          <li>
            <div class="item">
              <label class="check">	
                <input type="checkbox" name="chkItem" data-cart_itemcode="${cartList.cart_itemcode}" data-price="" data-seller_id="${cartList.seller_id}" checked="" onClick="itemSum(this.form);" value="${cartList.cart_num}" >
                <span class="ico"></span>
              </label>
              <div class="name">
                <div class="inner_name">
                  <a href="/itemdetail/<c:out value="${cartList.cart_itemcode}"/>" class="package ">${cartList.item_name}</a>
                  <div class="info">
                  </div>
                </div>
              </div>
              <input type="number" name="cart_num" value="${cartList.cart_num}" style="display:none">
              <div class="goods">
                <a href="" class="thumb " style="background-image: url(${pageContext.request.contextPath}/resources/image/market/item/<fmt:formatDate value="${cartList.ori_date}" pattern="yyyy-MM-dd" />/<c:out value="${cartList.cart_itemcode}"/><c:out value="${fn:split(cartList.item_image,':')[0]}"/>);">상품이미지</a>
                <div class="price">
                  <div class="in_price">
                    <span name="price" class="selling">${cartList.item_price}<span class="won">원</span></span><p class="noti"></p>
                    <input type="number" class="selling" name="origin" style="display:none;" value="${cartList.ori_price}">
                  </div>
                  <div class="stamper count">
                    <button type="button" class="btn minus"  name="stackM" onClick="stackMinus(this.value);" data-cart_itemcode="${cartList.cart_itemcode}" value="${cartList.cart_num}">감소</button>
                    <input type="number" id="stepperCounter" name="cnt" class="num" readonly="" value="${cartList.cart_count}">
                    <button type="button" class="btn plus" name="stackP"  onClick="stackPlus(this.value);" data-cart_itemcode="${cartList.cart_itemcode}" value="${cartList.cart_num}">추가</button>
                  </div>
                </div>
              </div>
              <button type="button" class="btn_delete delete_code_${cartList.cart_itemcode}" data-cart_itemcode="${cartList.cart_itemcode}">상품 삭제</button>
              <script>
			
			  $(".delete_code_${cartList.cart_itemcode}").click(function(){
			  var confirm_val = confirm("해당 상품을 장바구니에서 삭제하시겠습니까?");
			  var cart_id = $("#user_id").val();
			  
			  if(confirm_val) {
			   var checkArr = new Array();
			   
			   checkArr.push($(this).attr("data-cart_itemcode"));
			   $.ajax({
			    url : "/deleteCart",
			    type : "post",
			    data : { cart_id : cart_id, 
			    		 chkItem : checkArr },
			    success : function(result){
			     if(result == 1) {            
			    	 alert("해당 상품이 장바구니에서 삭제됐습니다");
			    	 window.location.reload();
			     } else {
			      alert("삭제 실패");
			     }
			    }
			   });
			  } 
			 });
			 
			</script>
            </div>
          </li>
          </c:forEach>
        </ul>
      </div>
      <div class="cart_select">
        <div class="inner_select">
          <label class="check">
            <input type="checkbox" name="checkAll" checked="">
            <span class="ico"></span>전체선택
          </label>
          <a href="javascript:void(0)" class="btn_delete select_delete">선택삭제</a>
        </div>
      </div>
    </div>
    <!-- 장바구니 목록 끝 -->

    <!-- 오른쪽 결제정보 창 시작 -->
    <div class="cart_result">
      <div class="inner_result" style="top: 60px;">
        <div class="cart_delivery">
          <h3 class="tit">배송지</h3>
          <div class="address">
            <a href="javascript:void(0)" class="btn default">배송지 변경하기</a>
            <input id="address_code" class="addr" name="address_code" type="text" value="${principal.vo.user_address_code}" readonly="">
			<input id="address" class="addr" name="address" type="text" value="${principal.vo.user_address}" readonly="">
			<input id="address_sub" class="addr" name="address_sub" value="${principal.vo.user_sub_address}" type="text" readonly="" placeholder="상세주소를 입력해주세요">
          </div>
        </div>
        <div class="amount_view">
          <dl class="amount">
            <dt class="tit">상품금액</dt>
            <dd class="price"><span id="sum" class="num"></span><span class="won">원</span></dd>
          </dl>
          <dl class="amount">
            <dt class="tit">배송비</dt>
            <dd class="price"><span id="deli" class="num"></span><span class="won">원</span>
            <input id="nowDeli" name="nowDeli" type="hidden" value="${nowDeli}">
            <input id="payDeli" name="payDeli" type="hidden" value="">
            </dd>
          </dl>
          <dl class="amount lst">
            <dt class="tit">결제예정금액</dt>
            <dd class="price"><span id="pay" class="num" ></span><span class="won">원</span>
            <input id="payy" name="payy" type="hidden">
            </dd>
          </dl>
        </div>
        		
        <div class="btn_submit">
          <button type="submit" id="orderBtn" class="btn active" >주문하기</button>
          
        </div>

        <div class="notice">
          <span class="txt"><span class="ico">·</span>쿠폰/적립금은 주문서에서 사용 가능합니다</span>
          <span class="txt"><span class="ico">·</span>‘입금확인’ 상태일 때는 주문 내역 상세에서 직접 주문취소가 가능합니다.</span>
          <span class="txt"><span class="ico">·</span>‘입금확인’ 이후 상태에는 고객센터로 문의해주세요.</span>
        </div>
      </div>
    </div>
    <!-- 오른쪽 결제정보 창 끝 -->
  </div>
</div>
<input type="text" id="chkParam" name="chkParam" style="display:none"/>
</form>
<!-- 장바구니 끝 -->
</div>
</div>


<script>
$(function(){
	var i;
	var len = $("input[name=chkItem]").length;
	var pArray = new Array(len);
	var sellerArray = new Array();
	var chkArray = new Array();
	var sum = 0;
	var sellerCnt = 0;
    var nowDeli = $("#nowDeli").val();
    nowDeli = parseInt(nowDeli);
	
	
	for(i=0; i<len; i++){
		var origin = $("input[name=origin]").eq(i).val();
		var count =  $("input[name=cnt]").eq(i).val();
		
		sellerArray[i] = $("input[name=chkItem]").eq(i).attr("data-seller_id")
		
		pArray[i] = origin*count;
		$("input[name=chkItem]").eq(i).val(pArray[i]);
		
		//chkArray에 값 넣기
		chkArray.push($("input[name=chkItem]").eq(i).attr("data-cart_itemcode"));
		
		sum += pArray[i];
		
		console.log("ca는 "+chkArray[i]);
		
		if(document.getElementsByName("cnt")[i].value==1){
			document.getElementsByName("stackM")[i].className += ' off';
		}
	}
	
	//chkParam에 값 넣기
	$("#chkParam").val(chkArray);
	
	var CleanArray = [...new Set(sellerArray)];
	sellerCnt = CleanArray.length;

	var deli = nowDeli*sellerCnt;
	 $("#sum").html(sum);
	 $("#deli").html(deli);
	 $("#payDeli").val(deli);
	 $("#pay").html(sum+deli);
	 	
	 //위쪽 누르면 아래쪽도 바뀌게
	 $("input[name=checkAll]").eq(0).click(function(){
		 if($("input[name=checkAll]").eq(0).is(":checked")){
			 $("input[name=checkAll]").eq(1).prop("checked", true); 
		 } else {$("input[name=checkAll]").eq(1).prop("checked", false);}
	 });
	 
	 //아래쪽 누르면 위쪽도 바뀌게
	 $("input[name=checkAll]").eq(1).click(function(){
		 if($("input[name=checkAll]").eq(1).is(":checked")){
			 $("input[name=checkAll]").eq(0).prop("checked", true); 
		 } else {$("input[name=checkAll]").eq(0).prop("checked", false); }
	 });
 
	 
	 $("input[name=checkAll]").click(function(){
		 var chkArray = new Array();
		//전체선택 체크
		if($("input[name=checkAll]").is(":checked")) {
			$("input[name=chkItem]").prop("checked", true);
			sum=0;
			for(i=0; i<len; i++){
				var origin = $("input[name=origin]").eq(i).val();
				var count =  $("input[name=cnt]").eq(i).val();
				
				pArray[i] = origin*count;
				$("input[name=chkItem]").eq(i).val(pArray[i]);
				
				sum += pArray[i];
				
				//chkArray에 값 넣기
				chkArray.push($("input[name=chkItem]").eq(i).attr("data-cart_itemcode"));
				
			}
			
			//출력
			 $("#sum").html(sum);
			 $("#deli").html(deli);
			 $("#pay").html(sum+deli);
			 $("#payDeli").val(deli);
			 $("#chkParam").val(chkArray);
			 
			 document.getElementById('orderBtn').className = 'btn active';
			 $("#orderBtn").html("주문하기");
			 $('#orderBtn').prop('disabled', false);
			 
		} else {
			//전체선택 체크 해제
			$("input[name=chkItem]").prop("checked", false);
			$("input[name=checkAll]").prop("checked", false);
			
			$("#sum").html(0);
			$("#deli").html(0);
			$("#pay").html(0);
			$("#payDeli").val(0);
			$("#chkParam").val(null);
			
		 	
		  	document.getElementById('orderBtn').className = 'btn disabled';
		  	$("#orderBtn").html("주문불가");
		  	$('#orderBtn').prop('disabled', true);

		}

		
	});
 
	$("input[name=chkItem]").click(function() {
		var total = $("input[name=chkItem]").length;
		var checked = $("input[name=chkItem]:checked").length;
		
		if(total != checked) $("input[name=checkAll]").prop("checked", false);
		else $("input[name=checkAll]").prop("checked", true); 
	});
		 
	
  	//선택 삭제
	 $(".select_delete").click(function(){
		  var confirm_val = confirm("선택하신 상품을 장바구니에서 삭제하시겠습니까?");
		  var cart_id = $("#user_id").val(); 
		  
		  if(confirm_val) {
			  
		   var checkArr = new Array();
		   for(i=0; i<len; i++){
			   if($("input[name=chkItem]").eq(i).is(":checked")){
				   
					checkArr.push($("input[name=chkItem]").eq(i).attr("data-cart_itemcode"));
					
			   } 
		   }
		   
		   $.ajax({
		    url : "/deleteCart",
		    type : "post",
		    data : { chkItem : checkArr,
		    		 cart_id : cart_id},
		    success : function(){
		    	alert("선택하신 상품이 장바구니에서 삭제되었습니다");
		    	window.location.reload();
		    }
		   });
		   
		   
		  } 
		 });
  	
  	
  	
  	
		//@@@@@@@@@@ 카카오 주소 검색 API 시작 @@@@@@@@@@//
	    $(".default").click(function(){
	    	var oldCode = $("#oldCode").val();
	    	var nowCode = $("#address_code").val();
	        new daum.Postcode({
	            oncomplete: function(data) {
	                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

	                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
	                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	                var addr = ''; // 주소 변수
	                var extraAddr = ''; // 참고항목 변수

	                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
	                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
	                    addr = data.roadAddress;
	                } else { // 사용자가 지번 주소를 선택했을 경우(J)
	                    addr = data.jibunAddress;
	                }

	                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
	                if(data.userSelectedType === 'R'){
	                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
	                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
	                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
	                        extraAddr += data.bname;
	                    }
	                    // 건물명이 있고, 공동주택일 경우 추가한다.
	                    if(data.buildingName !== '' && data.apartment === 'Y'){
	                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	                    }
	                
	                } 
	                // 우편번호와 주소 정보를 해당 필드에 넣는다.
	                //var sub = prompt("상세 주소를 입력해주세요 (미입력시 배송지가 변경되지 않습니다)");
					
	                document.getElementById("address_code").value = data.zonecode;
	                document.getElementById("address").value = addr;
	                
	                var adr1 = data.zonecode;
	                var adr2 = addr
	                
	                nowCode = adr1;
	                
	                $("#address_code").val(adr1);
	                $("#address").val(adr2);
	                $("#address_sub").val("");
	                
	            }
	    }).open();
		alert("상세주소를 입력해주세요");
		$("#address_sub").attr("readonly",false);
		$("#address_sub").focus();
		
	    });
	  //@@@@@@@@@@ 카카오 주소 검색 API 끝 @@@@@@@@@@//


  	
});
</script>



<script>

//체크박스 체크 상태에 따라 계산 다시
function itemSum(frm)
{
   var summ = 0;
   var sellerCnt = 0;
   var chkArray = new Array();
   var len = frm.chkItem.length;
   var sellerArray = new Array();
   var nowDeli = $("#nowDeli").val();
   nowDeli = parseInt(nowDeli);
   
   for(var i=0; i < len; i++ ){
	   
       if( frm.chkItem[i].checked == true ){
	    summ += parseInt(frm.chkItem[i].value);
	    
	    sellerArray.push($("input[name=chkItem]").eq(i).attr("data-seller_id"));
	    chkArray.push($("input[name=chkItem]").eq(i).attr("data-cart_itemcode"));
       } 
   }
   
	var CleanArray = [...new Set(sellerArray)];
	sellerCnt = CleanArray.length;
   
	var deli = nowDeli*sellerCnt;
   $("#sum").html(summ);
   $("#deli").html(deli);
   $("#payDeli").val(deli);
   $("#pay").html(summ+deli);
   $("#chkParam").val(chkArray);
   
 	if($("#sum").html()=="0"){
  		document.getElementById('orderBtn').className = 'btn disabled';
  		$("#orderBtn").html("주문불가");
  		$('#orderBtn').prop('disabled', true);
  	} else {
  		document.getElementById('orderBtn').className = 'btn active';
  		$("#orderBtn").html("주문하기");
  		$('#orderBtn').prop('disabled', false);
  		}
}
</script>


<script>
// 수량 증가에 대한 스크립트
function stackPlus(val)
{

	var sum = 0;
   var i;
   var len = $("input[name=chkItem]").length;
   var nArray = new Array(len);
   // document.getElementsByName("cnt")[0].value
   var chk = $("input[name=chkItem]").eq(val).is(":checked");
	
	   var nowDeli = $("#nowDeli").val();
	   nowDeli = parseInt(nowDeli);
   
   for(i = val; i<len; i++){
	   var stack2 = document.getElementsByName("cnt")[val].value;
		var origin2 = document.getElementsByName("origin")[val].value;
		
		//$("#html_test").html("change");
		
	   stack2 = parseInt(stack2);
	   stack2 = stack2 + 1;
	   
		//체크박스 값 바꾸기
		$("input[name=chkItem]").eq(val).val(stack2 * origin2);
		
		document.getElementsByName("price")[val].innerHTML = stack2 * origin2 + "원";
	   
	   //수량이 1보다 크면 off 없애기
	   if(stack2>1){
		   document.getElementsByName("stackM")[i].classList.remove('off');
		}
	   
	   document.getElementsByName("cnt")[val].value=stack2;
	   i=len;
   }
   
   //수량 증가에 대한 가격 새로 출력
   for(i=0; i<len; i++){
		var origin1 = $("input[name=origin]").eq(i).val();
		var count1 =  $("input[name=cnt]").eq(i).val();
		
	   nArray[i]=$("input[name=cnt]").eq(i).val();
	   nArray[i]=parseInt(nArray[i]);
	   
		nArray[i] = origin1 * count1;
		
		sum += nArray[i];
		
		//체크가 되어야만 합계 출력
		if(chk){
		$("#sum").html(sum);
		$("#pay").html(sum+nowDeli);
		}
  }

   //바뀐 수량 저장
   $.ajax({
	    url : "/modifycount",
	    type : "post",
	    data : {cart_count : $("#stepperCounter").val(),
	    		cart_itemcode : $("input[name=chkItem]").eq(val).attr("data-cart_itemcode"),
	    		cart_id : $("#user_id").val()
	    		},
	    success : function(){
	    },
	    error : function(){
	    }
	   });
	
}
</script>

  
<script>
// 수량 감소에대한 스크립트
function stackMinus(val)
{
	var sum = 0;
   var i;
   var len = $("input[name=chkItem]").length;
   var nArray = new Array(len);
   // document.getElementsByName("cnt")[0].value
   var chk = $("input[name=chkItem]").eq(val).is(":checked");
   var nowDeli = $("#nowDeli").val();
   nowDeli = parseInt(nowDeli);

   
   for(i = val; i<len; i++){
	   var origin2 = document.getElementsByName("origin")[val].value;
	   var stack2 = document.getElementsByName("cnt")[val].value;

	   stack2 = parseInt(stack2);
	   stack2 = stack2 - 1;

	   //수량이 1에서 더 작아질수없음
	   if(stack2 < 1){
		   return false;
		}
	   
		//체크박스 값 바꾸기
		$("input[name=chkItem]").eq(val).val(stack2 * origin2);
		
		document.getElementsByName("price")[val].innerHTML = stack2 * origin2 + "원";
	    document.getElementsByName("cnt")[val].value=stack2;
	   
	   //수량이 1이면 off 넣어서 비활성화
	   if(stack2 == 1){
		   document.getElementsByName("stackM")[i].className += ' off';
		}
	   
	   i=len;
   }
   
   //수량 감소에 대한 가격 새로 출력
   for(i=0; i<len; i++){
		var origin1 = $("input[name=origin]").eq(i).val();
		var count1 =  $("input[name=cnt]").eq(i).val();
		
	   nArray[i]=$("input[name=cnt]").eq(i).val();
	   nArray[i]=parseInt(nArray[i]);
	   
		nArray[i] = origin1 * count1;
		
		sum += nArray[i];
		
		//체크가 되어야만 출력
		if(chk){
			$("#sum").html(sum);
			$("#pay").html(sum+nowDeli);
			}
 	}
   
   //바뀐 수량 저장
   $.ajax({
	    url : "/modifycount",
	    type : "post",
	    data : {cart_count : $("#stepperCounter").val(),
	    		cart_itemcode : $("input[name=chkItem]").eq(val).attr("data-cart_itemcode"),
	    		cart_id : $("#user_id").val()
	    		},
	    success : function(){
	    },
	    error : function(){
	    }
	   });
   
   
}
</script>

<script>loadHTML("/footer");</script>
</body></html>