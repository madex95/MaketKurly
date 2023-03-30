<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page import="org.springframework.security.core.context.SecurityContextHolder" %>
<%@ page import="org.springframework.security.core.Authentication" %>
 <sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal" var="principal"/>
</sec:authorize> 
<!DOCTYPE html>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>
$(function(){
$("#btn_cart").click(function(){
	   var cart_id = $("#user_id").val();
	   
	   $.ajax({
	    url : "/enterCart",
	    type : "get",
	    data : {cart_id : cart_id},
	    success : function(data){
	        if (data == 0){
	        	alert("로그인 한 후 장바구니를 이용할 수 있습니다.");
	        	window.location.href = '/common/loginpage';
	        	return false;
	        } else {
	        	window.location.href = '/common/mypage/mycart';
	    	}
	    },
	    error : function(){
	     alert("에러에러");
	    }
	   });
	   
	
});
});
</script>
<div id="userMenu">
	<ul class="list_menu">
		<!-- 비로그인일 경우 -->
		<sec:authorize access="!isAuthenticated()">
			<li class="menu none_sub menu_join">
				<a href="/common/register" class="link_menu">회원가입</a>
			</li> 
			<li class="menu none_sub menu_login">
				<a href="/common/loginpage" class="link_menu">로그인</a> <!---->
			</li> <!----> 
			<li class="menu lst">
				<a href="/shop/board/list.php?id=notice" class="link_menu">고객센터</a> 
				<ul class="sub">
					<li><a href="#none" onclick="KurlyTrackerLink('/shop/board/list.php?id=notice', 'select_my_kurly_notice_list')">공지사항</a></li> 
					<li><a href="#none" onclick="KurlyTrackerLink('/shop/service/faq.php', 'select_my_kurly_frequently_qna')">자주하는 질문</a></li> 
					<li><a href="#none" onclick="KurlyTrackerLink('/shop/mypage/mypage_qna.php', 'select_my_kurly_personal_inquiry_history')">1:1 문의</a></li> 
					<li><a href="#none" onclick="KurlyTrackerLink('/shop/main/html.php?htmid=mypage/bulk_order.htm', 'select_my_kurly_bulk_order')">대량주문 문의</a></li> 
					<li><a href="#none" onclick="KurlyTrackerLink('/shop/mypage/offer.php', 'select_my_kurly_product_offer')">상품 제안</a></li> 
					<li><a href="#none" onclick="KurlyTrackerLink('/shop/mypage/echo_packing.php', 'select_my_kurly_eco_packing_feedback')">에코포장 피드백</a></li>
				</ul>
			</li>
		</sec:authorize>
		<!-- 로그인일경우 -->
		<sec:authorize access="isAuthenticated()">
			<li class="menu none_sub menu_join">
				<a href="#" class="link_menu" onclick="document.getElementById('logout-form').submit();">로그아웃</a>
				<form id="logout-form" action=/logout method="POST">
				<input id="user_id" name="user_id" name="cart_id" type="hidden" value="${principal.vo.user_id}">
				<input name="${_csrf.parameterName}" type="hidden" value="${_csrf.token}"/>
				</form>
			</li> 
			<li class="menu none_sub menu_login">
				<a href="/common/mypage/myinfo" class="link_menu"><span class="txt">마이페이지</span></a>
			</li>
			<li class="menu lst">
				<a href="/shop/board/list.php?id=notice" class="link_menu">고객센터</a> 
				<ul class="sub">
					<li><a href="#none" onclick="KurlyTrackerLink('/shop/board/list.php?id=notice', 'select_my_kurly_notice_list')">공지사항</a></li> 
					<li><a href="#none" onclick="KurlyTrackerLink('/shop/service/faq.php', 'select_my_kurly_frequently_qna')">자주하는 질문</a></li> 
					<li><a href="#none" onclick="KurlyTrackerLink('/shop/mypage/mypage_qna.php', 'select_my_kurly_personal_inquiry_history')">1:1 문의</a></li> 
					<li><a href="#none" onclick="KurlyTrackerLink('/shop/main/html.php?htmid=mypage/bulk_order.htm', 'select_my_kurly_bulk_order')">대량주문 문의</a></li> 
					<li><a href="#none" onclick="KurlyTrackerLink('/shop/mypage/offer.php', 'select_my_kurly_product_offer')">상품 제안</a></li> 
					<li><a href="#none" onclick="KurlyTrackerLink('/shop/mypage/echo_packing.php', 'select_my_kurly_eco_packing_feedback')">에코포장 피드백</a></li>
				</ul>
			</li>
		</sec:authorize> 
	</ul>
</div>


<style>
  #headerLogo{position:relative;width:1050px;height:63px;margin:0 auto}
  #headerLogo .bnr_delivery{position:absolute;left:-1px;top:-28px;margin:auto;height:22px}
  #headerLogo .logo{position:absolute;left:0;bottom:6px;width:100%;height:79px;text-align:center}
  #headerLogo .logo .link_main{display:inline-block;height:79px}
  #headerLogo .logo img{display:block;width:103px;height:79px;margin:0 auto}
  #headerLogo .logo #gnbLogoContainer {margin:0 auto}
  #gnb.gnb_stop {height: 56px}
  #gnb.gnb_stop .fixed_container{position:fixed;z-index:300;left:0;top:0;width:100%}
  #gnb .gnb_kurly{position:relative;z-index:300;min-width:1050px;background-color:#fff;font-family:'Noto Sans';letter-spacing:-0.3px}
  #gnb .gnb_kurly:after{content:"";position:absolute;z-index:299;left:0;top:56px;width:100%;height:9px;background:url(https://res.kurly.com/pc/service/common/1902/bg_1x9.png) repeat-x 0 100%}
  #gnb .inner_gnbkurly{position:relative;width:1050px;height:56px;margin:0 auto}
  /* 검색창 */
  #gnb .gnb_search{position:absolute;right:174px;top:10px;width:242px}
  #gnb .gnb_search .inp_search{width:242px;height:36px;padding:0 60px 0 14px;border:1px solid #f7f7f6;border-radius:18px;background-color:#f7f7f7;font-family: 'Noto Sans';font-weight:400;font-size:12px;color:#666;line-height:16px;outline:none}
  #gnb .gnb_search .inp_search.focus{background-color:#fff;color:#333}
  #gnb .gnb_search .btn_search{position:absolute;right:5px;top:3px;width:30px;height:30px}
  /* 장바구니 */
  #gnb .cart_count{position:absolute;right:-5px;top:10px}
  #gnb .cart_count .inner_cartcount{text-align:center;font-weight:400}
  #gnb .cart_count .btn_cart{display:block;width:36px;height:36px;background:url(https://res.kurly.com/pc/service/common/2011/ico_cart.svg) no-repeat 50% 50%}
  #gnb .cart_count .btn_cart:hover{background:url(https://res.kurly.com/pc/service/common/2011/ico_cart_on.svg?v=1) no-repeat 50% 50%}
  #gnb .cart_count .num{display:none;position:absolute;left:19px;top:-1px;min-width:20px;height:20px;padding:0 5px;border:2px solid #fff;border-radius:10px;background-color:#5f0080;font-size:9px;color:#fff;line-height:15px;text-align:center;white-space:nowrap}
  #gnb .cart_count img{display:block;width:36px;height:36px;margin:0 auto}
  #gnb .cart_count .msg_cart{display:none;position:absolute;right:-7px;top:61px;width:348px;border:1px solid #ddd;background-color:#fff;/* opacity:0; */}
  #gnb .cart_count .inner_msgcart{display:block;overflow:hidden;padding:20px 0 20px 20px}
  #gnb .cart_count .msg_cart .thumb{float:left;width:46px;height:60px}
  #gnb .cart_count .msg_cart .desc{float:left;width:260px;padding:8px 0 0 20px;font-weight:700;font-size:14px;line-height:21px}
  #gnb .cart_count .msg_cart .desc.add{padding-top:0;margin-top:-5px;}
  #gnb .cart_count .msg_cart .tit{display:block;overflow:hidden;width:100%;color:#999;white-space:nowrap;text-overflow:ellipsis}
  #gnb .cart_count .msg_cart .name{overflow:hidden;float:left;max-width:178px;text-overflow:ellipsis}
  #gnb .cart_count .msg_cart .txt{display:block;padding-top:3px;color:#333}
  #gnb .cart_count .msg_cart .point{position:absolute;right:13px;top:-14px;width:20px;height:14px;background:url(https://res.kurly.com/pc/ico/1903/ico_layer_point.png) no-repeat 0 0}
  #gnb .cart_count .msg_cart .repeat{display:none}
  #gnb .cart_count .msg_cart .add .repeat{display:block}
  /* GNB메인 */
  #gnb .gnb_main{overflow:hidden;width:1050px;margin:0 auto}
  #gnb .gnb_main .gnb{float:left;width:100%}
  #gnb .gnb_main .gnb li{float:left}
  #gnb .gnb_main .gnb .lst{background:none}
  #gnb .gnb_main .gnb a{overflow:hidden;float:left;width:124px;height:55px;padding:16px 0 0;font-size:16px;color:#333;line-height:20px;text-align:center}
  #gnb .gnb_main .gnb a .txt{font-weight:700}
  #gnb .gnb_main .gnb a:hover,
  #gnb .gnb_main .gnb a.on{font-weight:700;color:#5f0080}
  #gnb .gnb_main .gnb a:hover .txt{border-bottom:1px solid #5f0080}
  #gnb .gnb_main .menu1 a{width:148px}
  #gnb .gnb_main .menu1 .ico{float:left;width:16px;height:14px;margin:5px 14px 0 0;background:url(https://res.kurly.com/pc/service/common/1908/ico_gnb_all_off.png) no-repeat}
  #gnb .gnb_main .menu1 a.on .ico,
  #gnb .gnb_main .menu1 a:hover .ico{background:url(https://res.kurly.com/pc/service/common/1908/ico_gnb_all.png) no-repeat 0 0}
  #gnb .gnb_main .menu1 a.on .txt,
  #gnb .gnb_main .menu1 a:hover .txt,
  #gnb .gnb_main .menu1 .txt{float:left;font-weight:700;border-bottom:0}
  #gnb .gnb_main .menu3 a{width:116px}
  #gnb .gnb_main .lst a{width:116px}
  #gnb .btn_location{overflow:hidden;position:absolute;right:107px;top:10px;width:36px;height:36px;border:0 none;background:url(https://res.kurly.com/pc/ico/2008/ico_delivery_setting_done.svg) no-repeat 50% 50%;font-size:0;text-indent:-9999px}
  #gnb .btn_location.on{background-image:url(https://res.kurly.com/pc/ico/2008/ico_delivery_setting.svg?ver=1)}
  #gnb .layer_location{display:none;position:absolute;z-index:300;right:41px;top:56px;width:315px;padding:18px 18px 19px 20px;border:1px solid #ddd;background-color:#fff}
  #gnb .layer_location:after{content:"";position:absolute;right:66px;top:-50px;width:36px;height:50px;background:url(https://res.kurly.com/pc/ico/2011/ico_point_up_18x12.svg) no-repeat 50% 100%}
  #gnb .layer_location *{font-weight:500;font-size:16px;color:#333;line-height:24px;letter-spacing:-0.34px}
  #gnb .layer_location .delivery{display:inline-block;padding-top:8px;font-size:14px;font-weight:normal;letter-spacing:-0.2px;line-height:normal;}
  #gnb .layer_location .courierTime{display:inline-block;margin-left:6px;display:inline-block;font-size:14px;font-weight:normal;line-height:normal;color:#666;letter-spacing:-0.2px;}
  #gnb .layer_location .star{color:#5f0080}
  #gnb .layer_location .regular{color:#666}
  #gnb .layer_location .none{color:#999}
  #gnb .layer_location .btn{display:block;width:100%;height:36px;margin-top:17px;padding-bottom:2px;border-radius:3px;font-size:12px;line-height:32px;letter-spacing:0;text-align:center}
  #gnb .layer_location a.btn{padding-top:0}
  #gnb .layer_location .btn.default{border:1px solid #5f0080;background-color:#fff;color:#5f0080}
  #gnb .layer_location .btn.active{border:1px solid #5f0081;background-color:#5f0080;color:#fff}
  #gnb .layer_location .btn .ico{display:inline-block;width:20px;height:20px;margin:6px 0 0 -6px;background:url(https://res.kurly.com/pc/ico/2008/ico_search_40x40.png) no-repeat 50% 50%;background-size:20px 20px;vertical-align:top}
  #gnb .layer_location .group_button{display:block;overflow:hidden}
  #gnb .layer_location .double .default{float:left;width:110px}
  #gnb .layer_location .double .active{float:right;width:159px}
  #gnb .layer_location .double .btn {margin-left: 0; margin-right:0;}
  #gnb .layer_location .emph{color:#5f0080}
  #gnb .location_set:hover .btn_location.on{background-image:url(https://res.kurly.com/pc/ico/2010/ico_delivery_setting_on.svg)}
  #gnb .location_set.show .layer_location,
  #gnb .location_set:hover .layer_location{display:block}
  #gnb .location_set .btn_location.off,
  #gnb .location_set .btn_location.off:hover{background-image:url(https://res.kurly.com/pc/ico/2008/ico_delivery_off.svg?ver=1);cursor:default}
  #gnb .location_set.off .layer_location,
  #gnb .location_set.off:hover .layer_location{display:none}
  #gnb .gnbPick{
    display: inline-block;
    position: absolute;
    right: 51px;
    top: 10px;
    width: 36px;
    height: 36px;
    font-size: 0px;
  }
  #gnb .gnbPick .btn_pick{
    display: inline-block;
    width: 36px;
    height: 36px;
    border: none;
    color: transparent;
    background: url(https://res.kurly.com/pc/service/pick/btn-heart-off.svg) no-repeat 50% 50%;
    cursor: pointer;
  }
  #gnb .gnbPick .btn_pick:hover{
    background: url(https://res.kurly.com/pc/service/pick/btn-heart-hover.svg) no-repeat 50% 50%;
  }
</style>

<div id="headerLogo" class="layout-wrapper">
<h1 class="logo">
<a href="/" class="link_main">
<span id="gnbLogoContainer"></span>
<img src="https://res.kurly.com/images/marketkurly/logo/logo_x2.png" alt="마켓컬리 로고" style="display: block;">
</a>
</h1>

</div>
<div id="gnb" class="">
<div class="fixed_container">
<h2 class="screen_out">메뉴</h2>
<div id="gnbMenu" class="gnb_kurly"><div class="inner_gnbkurly">
<div class="gnb_main">
<ul class="gnb">
<c:forEach items="${cate1}" var="cate"> 
<li class="menu2"><a href="/itemlist/category?type=C&code=${cate.code}" class="link new "><span class="txt">${cate.name}</span></a></li> 
</c:forEach>
</ul> 
<div id="side_search" class="gnb_search">
<form action="/search" >
 <input name="keyword" type="text" id="sword" value="<c:out value="${pageMaker.cri.keyword}"/>" required="required" label="검색어" placeholder="검색어를 입력해주세요." class="inp_search"> 
 <input type="image" src="https://res.kurly.com/pc/service/common/1908/ico_search_x2.png" class="btn_search"> 
 </form>
 </div>

<div class="cart_count">
	<div class="inner_cartcount">
		<a href="" id="btn_cart" class="btn_cart">
		<span class="screen_out">장바구니</span> 
		</a>
	</div> 
	<div id="addMsgCart" class="msg_cart">
		<span class="point"></span> 
		<div class="inner_msgcart"><img src="https://res.kurly.com/images/common/bg_1_1.gif" alt="" class="thumb"> 
		<p id="msgReaddedItem" class="desc"><span class="tit"></span> <span class="txt">
		장바구니에 상품을 담았습니다.
		</span></p>
	</div></div>
</div> 

</div> 
</div>
</div>
</div>