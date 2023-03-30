<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page import="org.springframework.security.core.context.SecurityContextHolder" %>
<%@ page import="org.springframework.security.core.Authentication" %>
<script src="//code.jquery.com/jquery-1.10.2.min.js"></script> 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<html>

<head>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/loadHTML.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
 <link rel="stylesheet" href="/resources/css/itemdetail.css">
<meta name="title" content="[Everyday] 무생채">
<meta name="description" content="아삭아삭 맛깔스러운 밥도둑 (100g당 가격 : 1750원) :: Love Food, Love Life. 마켓컬리! 당일 수확 채소, 과일, 맛집 음식까지 내일 아침 문 앞에서 만나요!">
<meta property="og:title" content="[Everyday] 무생채">
<meta property="og:description" content="아삭아삭 맛깔스러운 밥도둑 (100g당 가격 : 1750원) :: 잠들기 전 주문해도 아침이면 문 앞에! 당일 수확 채소, 과일부터 맛집 음식까지 매일 아침 만나보세요.">
<meta property="og:image" content="http://img-cf.kurly.com/shop/data/goods/">
<meta property="og:url" content="https://www.kurly.com/shop/goods/goods_view.php?goodsno=5968">
<meta property="og:type" content="website">
<meta property="og:site_name" content="www.kurly.com">
<meta name="keywords" content="다이어트, 식단, 닭가슴살, 요리, 치아바타, 레시피, 요리, 상차림, 다이어트음식, 이유식, 건강이유식">
<title>마켓컬리 :: 내일의 장보기, 마켓컬리</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0">
<meta name="naver-site-verification" content="58ff7c242d41178131208256bfec0c2f93426a1d">
<meta name="facebook-domain-verification" content="tyur3wmoos7t63tpkb7zosur6p98m1">
<script src="${pageContext.request.contextPath}/resources/mkdetail/526625657540055" async=""></script>
<script async="" src="${pageContext.request.contextPath}/resources/mkdetail/fbevents.js.다운로드"></script><script async="" src="${pageContext.request.contextPath}/resources/mkdetail/branch-latest.min.js.다운로드"></script><script type="text/javascript" integrity="sha384-vYYnQ3LPdp/RkQjoKBTGSq0X5F73gXU3G2QopHaIfna0Ct1JRWzwrmEz115NzOta" crossorigin="anonymous" async="" src="${pageContext.request.contextPath}/resources/mkdetail/amplitude-5.8.0-min.gz.js.다운로드"></script><script async="" src="${pageContext.request.contextPath}/resources/mkdetail/analytics.js.다운로드"></script><script src="${pageContext.request.contextPath}/resources/mkdetail/c1f07ee4a3fd45d5aa2ef4983ca9ad43.min.js.다운로드" crossorigin="anonymous"></script>

<script src="${pageContext.request.contextPath}/resources/mkdetail/common.bundle.js.다운로드"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/mkdetail/jquery-1.10.2.min.js.다운로드"></script>
<link rel="shortcut icon" href="https://res.kurly.com/images/marketkurly/logo/favicon_v2.png" type="image/x-icon">
<link rel="apple-touch-icon" sizes="57x57" href="https://res.kurly.com/images/marketkurly/logo/ico_57.png">
<link rel="apple-touch-icon" sizes="60x60" href="https://res.kurly.com/images/marketkurly/logo/ico_60.png">
<link rel="apple-touch-icon" sizes="72x72" href="https://res.kurly.com/images/marketkurly/logo/ico_72.png">
<link rel="apple-touch-icon" sizes="76x76" href="https://res.kurly.com/images/marketkurly/logo/ico_76.png">
<link rel="apple-touch-icon" sizes="114x114" href="https://res.kurly.com/images/marketkurly/logo/ico_114.png">
<link rel="apple-touch-icon" sizes="120x120" href="https://res.kurly.com/images/marketkurly/logo/ico_120.png">
<link rel="apple-touch-icon" sizes="144x144" href="https://res.kurly.com/images/marketkurly/logo/ico_144.png">
<link rel="apple-touch-icon" sizes="152x152" href="https://res.kurly.com/images/marketkurly/logo/ico_152.png">
<link rel="apple-touch-icon" sizes="180x180" href="https://res.kurly.com/images/marketkurly/logo/ico_180.png">
<link rel="icon" type="image/png" sizes="32x32" href="https://res.kurly.com/images/marketkurly/logo/ico_32.png">
<link rel="icon" type="image/png" sizes="192x192" href="https://res.kurly.com/images/marketkurly/logo/ico_192.png">
<link rel="icon" type="image/png" sizes="16x16" href="https://res.kurly.com/images/marketkurly/logo/ico_16.png">

<script src="${pageContext.request.contextPath}/resources/mkdetail/postcode.v2.js.다운로드"></script><script charset="UTF-8" type="text/javascript" src="${pageContext.request.contextPath}/resources/mkdetail/211103.js.다운로드"></script>
<script src="${pageContext.request.contextPath}/resources/mkdetail/thefarmers.js.다운로드"></script>
<script src="${pageContext.request.contextPath}/resources/mkdetail/common.js.다운로드"></script>
<script src="${pageContext.request.contextPath}/resources/mkdetail/polify.js.다운로드"></script>
<script src="${pageContext.request.contextPath}/resources/mkdetail/ui_v2.js.다운로드"></script>
<script src="${pageContext.request.contextPath}/resources/mkdetail/xdomain.min.js.다운로드" slave="https://api.kurly.com/xdomain?ver=1"></script>
<script src="${pageContext.request.contextPath}/resources/mkdetail/es6-promise.min.js.다운로드"></script>
<script src="${pageContext.request.contextPath}/resources/mkdetail/es6-promise.auto.min.js.다운로드"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/mkdetail/axios.min.js.다운로드"></script>
<script src="${pageContext.request.contextPath}/resources/mkdetail/vue.min.js.다운로드"></script>
<script src="${pageContext.request.contextPath}/resources/mkdetail/axios.js.다운로드"></script>
<link rel="styleSheet" href="${pageContext.request.contextPath}/resources/mkdetail/normalize.css">
<link rel="styleSheet" href="${pageContext.request.contextPath}/resources/mkdetail/section1.css">
<link rel="styleSheet" href="${pageContext.request.contextPath}/resources/mkdetail/common.css">

<script async="" src="${pageContext.request.contextPath}/resources/mkdetail/js"></script>

<style>.async-hide { opacity: 0 !important} </style>

<script src="${pageContext.request.contextPath}/resources/mkdetail/optimize.js.다운로드"></script>
<script src="${pageContext.request.contextPath}/resources/mkdetail/optimize.js(1).다운로드"></script>
<script src="${pageContext.request.contextPath}/resources/mkdetail/kurlytracker.js.다운로드"></script>
<script src="${pageContext.request.contextPath}/resources/mkdetail/facebookPixel.js.다운로드"></script>
<script src="${pageContext.request.contextPath}/resources/mkdetail/facebookConversions.js.다운로드"></script>
<script src="${pageContext.request.contextPath}/resources/mkdetail/kurlyAPI.bundle.js.다운로드"></script>
<script src="${pageContext.request.contextPath}/resources/mkdetail/identify-verification.js.다운로드"></script>
<script src="${pageContext.request.contextPath}/resources/mkdetail/eventApple.js.다운로드"></script>
<script src="${pageContext.request.contextPath}/resources/mkdetail/holiday-delivery.js.다운로드"></script>
<script>
    /*리뷰쓰기*/
   /* $(document).ready(function(){
      $("button[name='review']").click(function(e){
         console.log("aa");
            e.preventDefault();   
         const item_code = '${list3.item_code}';
         
         $.ajax({
            data : {
               item_code = item_code
            },
            url : '/reply/check',
            type : 'POST',
            success : function(result){
               if(result === '1'){
                  alert("이미 등록된 리뷰가 존재 합니다.")
               } else if(result === '0'){
                  let popUrl =  "/review_enroll/?item_code=" + item_code; 
                  console.log(popUrl);
                  let popOption = "width = 490px, height=490px, top=300px, left=300px, scrollbars=yes";
                  
                  window.open(popUrl,"리뷰 쓰기",popOption);                     
               }

            }
         }); */
         
      /*
         let popUrl = "/review_enroll/?item_code=" + item_code; 
         console.log(popUrl);
         let popOption = "width = 490px, height=490px, top=300px, left=300px, scrollbars=yes";
         
         window.open(popUrl,"리뷰 쓰기",popOption);
         */
      /* });
      
   }); */
   
   
    /*리뷰쓰기*/
   $(document).ready(function () {
        $("button[name='review']").click(function (e) {
          //console.log("bb");
            e.preventDefault();   
         const item_code = '${list3.item_code}';
   
          //console.log(item_code);
          $.ajax({
             data : {
                review_itemcode : item_code
      
            }, 
            url : '/reply/check',
            type : 'POST',
            success : function(result){
               if(result === '1'){
                  alert("이미 등록된 리뷰가 존재 합니다.")
               } else if(result === '0'){
                  let popUrl =  "/review_enroll/?item_code=" + item_code; 
                  console.log(popUrl);
                  let popOption = "width = 490px, height=490px, top=300px, left=300px, scrollbars=yes";
                  
                  window.open(popUrl,"리뷰 쓰기",popOption);                     
               }

            } 
         });   
         /* $.ajax({
               
             data : { type1 : type1, // data 옵션
                    type2 : type2,
             },   // 끝에 컴마(,)를 주의해야됨
             url : "/ajax/ajaxController", // url 필수
             success:function(data){ // success option
             console.log(data.length);
             }
             
             }); */
        });
      });

   
   // 수량 버튼 조작
<!--
   $(document).ready(function () {
    $("button[name='btn up on']").click(function (e){
      console.log("aaaaaa");
      let inp1 = $(".inp").val();
      $(".inp").val(++inp1);
      });
   }); 
   
   $(document).ready(function () {
    $("button[name='btn down on']").click(function (e){
      console.log("bbbbbb");
      let inp1 = $(".inp").val();
      if(inp1 > 1){
      $(".inp").val(--inp1);
      }
   });
   });
   -->
   // 서버로 전송할 데이터
   /*const form = {
         //memberId : '${member.memberId}',
         item_code : '${list3.item_code}',
         itemCount : ''
            // 장바구니 추가 버튼
            $(".base_button full").on("click", function(e){
               form.itemCount = $(".inp").val();
               $.ajax({
                  url: '/cart/add',
                  type: 'POST',
                  data: form,
                  success: function(result){
                     cartAlert(result);
                  }
               })
            });
   }*/
   
   var sell_price;
   var amount;

   function init () {
      sell_price = document.form.sell_price.value;
      amount = document.form.amount.value;
      document.form.sum.value = sell_price;
      change();
   }

   function add () {
      hm = document.form.amount;
      sum = document.form.sum;
      hm.value ++ ;

      sum.value = parseInt(hm.value) * sell_price;
   }

   function del () {
      hm = document.form.amount;
      sum = document.form.sum;
         if (hm.value > 1) {
            hm.value -- ;
            sum.value = parseInt(hm.value) * sell_price;
         }
   }

   function change () {
      hm = document.form.amount;
      sum = document.form.sum;

         if (hm.value < 0) {
            hm.value = 0;
         }
      sum.value = parseInt(hm.value) * sell_price;
   }  

   // 숫자 3자리 콤마찍기

   function formatNumber(number){
      
    number = number.toFixed(2) + '';
    x = number.split('.');
    x1 = x[0];
    x2 = x.length > 1 ? '.' + x[1] : '';
    var rgx = /(\d+)(\d{3})/;
    while (rgx.test(x1)) {
        x1 = x1.replace(rgx, '$1' + ',' + '$2');
    }
    return x1 + x2;
}
   
   
   function addCart(val){
         
         var cart_id = $("#user_id").val();
         var cart_itemcode = val;
         var cart_count = $("#cart_count").val();
         var data = {
               cart_id : cart_id,
               cart_itemcode : val,
               cart_count : cart_count
           };
         
         $.ajax({
          url : "/addCart",
          type : "post",
          data : data,
          success : function(data){
              if (data == 1){
                 alert("로그인 한 후 장바구니에 상품을 담아주세요");
              } else if (data == 2){
                alert("수량은 0개 이상이여야합니다");
             } else if (data == 3){
                alert("상품이 장바구니에 추가되었습니다");
             } else {
                alert("상품이 이미 장바구니에 담겨있어서 수량을 추가했습니다.");
             }
          },
          error : function(){
           alert("수량을 선택 후 장바구니에 담아주세요");
          }
         });
   }
   
</script>
<style>.swal2-popup.swal2-toast{flex-direction:column;align-items:stretch;width:auto;padding:1.25em;overflow-y:hidden;background:#fff;box-shadow:0 0 .625em #d9d9d9}.swal2-popup.swal2-toast .swal2-header{flex-direction:row;padding:0}.swal2-popup.swal2-toast .swal2-title{flex-grow:1;justify-content:flex-start;margin:0 .625em;font-size:1em}.swal2-popup.swal2-toast .swal2-loading{justify-content:center}.swal2-popup.swal2-toast .swal2-input{height:2em;margin:.3125em auto;font-size:1em}.swal2-popup.swal2-toast .swal2-validation-message{font-size:1em}.swal2-popup.swal2-toast .swal2-footer{margin:.5em 0 0;padding:.5em 0 0;font-size:.8em}.swal2-popup.swal2-toast .swal2-close{position:static;width:.8em;height:.8em;line-height:.8}.swal2-popup.swal2-toast .swal2-content{justify-content:flex-start;margin:0 .625em;padding:0;font-size:1em;text-align:initial}.swal2-popup.swal2-toast .swal2-html-container{padding:.625em 0 0}.swal2-popup.swal2-toast .swal2-html-container:empty{padding:0}.swal2-popup.swal2-toast .swal2-icon{width:2em;min-width:2em;height:2em;margin:0 .5em 0 0}.swal2-popup.swal2-toast .swal2-icon .swal2-icon-content{display:flex;align-items:center;font-size:1.8em;font-weight:700}@media all and (-ms-high-contrast:none),(-ms-high-contrast:active){.swal2-popup.swal2-toast .swal2-icon .swal2-icon-content{font-size:.25em}}.swal2-popup.swal2-toast .swal2-icon.swal2-success .swal2-success-ring{width:2em;height:2em}.swal2-popup.swal2-toast .swal2-icon.swal2-error [class^=swal2-x-mark-line]{top:.875em;width:1.375em}.swal2-popup.swal2-toast .swal2-icon.swal2-error [class^=swal2-x-mark-line][class$=left]{left:.3125em}.swal2-popup.swal2-toast .swal2-icon.swal2-error [class^=swal2-x-mark-line][class$=right]{right:.3125em}.swal2-popup.swal2-toast .swal2-actions{flex:1;flex-basis:auto!important;align-self:stretch;width:auto;height:2.2em;height:auto;margin:0 .3125em;margin-top:.3125em;padding:0}.swal2-popup.swal2-toast .swal2-styled{margin:.125em .3125em;padding:.3125em .625em;font-size:1em}.swal2-popup.swal2-toast .swal2-styled:focus{box-shadow:0 0 0 1px #fff,0 0 0 3px rgba(100,150,200,.5)}.swal2-popup.swal2-toast .swal2-success{border-color:#a5dc86}.swal2-popup.swal2-toast .swal2-success [class^=swal2-success-circular-line]{position:absolute;width:1.6em;height:3em;transform:rotate(45deg);border-radius:50%}.swal2-popup.swal2-toast .swal2-success [class^=swal2-success-circular-line][class$=left]{top:-.8em;left:-.5em;transform:rotate(-45deg);transform-origin:2em 2em;border-radius:4em 0 0 4em}.swal2-popup.swal2-toast .swal2-success [class^=swal2-success-circular-line][class$=right]{top:-.25em;left:.9375em;transform-origin:0 1.5em;border-radius:0 4em 4em 0}.swal2-popup.swal2-toast .swal2-success .swal2-success-ring{width:2em;height:2em}.swal2-popup.swal2-toast .swal2-success .swal2-success-fix{top:0;left:.4375em;width:.4375em;height:2.6875em}.swal2-popup.swal2-toast .swal2-success [class^=swal2-success-line]{height:.3125em}.swal2-popup.swal2-toast .swal2-success [class^=swal2-success-line][class$=tip]{top:1.125em;left:.1875em;width:.75em}.swal2-popup.swal2-toast .swal2-success [class^=swal2-success-line][class$=long]{top:.9375em;right:.1875em;width:1.375em}.swal2-popup.swal2-toast .swal2-success.swal2-icon-show .swal2-success-line-tip{-webkit-animation:swal2-toast-animate-success-line-tip .75s;animation:swal2-toast-animate-success-line-tip .75s}.swal2-popup.swal2-toast .swal2-success.swal2-icon-show .swal2-success-line-long{-webkit-animation:swal2-toast-animate-success-line-long .75s;animation:swal2-toast-animate-success-line-long .75s}.swal2-popup.swal2-toast.swal2-show{-webkit-animation:swal2-toast-show .5s;animation:swal2-toast-show .5s}.swal2-popup.swal2-toast.swal2-hide{-webkit-animation:swal2-toast-hide .1s forwards;animation:swal2-toast-hide .1s forwards}.swal2-container{display:flex;position:fixed;z-index:1060;top:0;right:0;bottom:0;left:0;flex-direction:row;align-items:center;justify-content:center;padding:.625em;overflow-x:hidden;transition:background-color .1s;-webkit-overflow-scrolling:touch}.swal2-container.swal2-backdrop-show,.swal2-container.swal2-noanimation{background:rgba(0,0,0,.4)}.swal2-container.swal2-backdrop-hide{background:0 0!important}.swal2-container.swal2-top{align-items:flex-start}.swal2-container.swal2-top-left,.swal2-container.swal2-top-start{align-items:flex-start;justify-content:flex-start}.swal2-container.swal2-top-end,.swal2-container.swal2-top-right{align-items:flex-start;justify-content:flex-end}.swal2-container.swal2-center{align-items:center}.swal2-container.swal2-center-left,.swal2-container.swal2-center-start{align-items:center;justify-content:flex-start}.swal2-container.swal2-center-end,.swal2-container.swal2-center-right{align-items:center;justify-content:flex-end}.swal2-container.swal2-bottom{align-items:flex-end}.swal2-container.swal2-bottom-left,.swal2-container.swal2-bottom-start{align-items:flex-end;justify-content:flex-start}.swal2-container.swal2-bottom-end,.swal2-container.swal2-bottom-right{align-items:flex-end;justify-content:flex-end}.swal2-container.swal2-bottom-end>:first-child,.swal2-container.swal2-bottom-left>:first-child,.swal2-container.swal2-bottom-right>:first-child,.swal2-container.swal2-bottom-start>:first-child,.swal2-container.swal2-bottom>:first-child{margin-top:auto}.swal2-container.swal2-grow-fullscreen>.swal2-modal{display:flex!important;flex:1;align-self:stretch;justify-content:center}.swal2-container.swal2-grow-row>.swal2-modal{display:flex!important;flex:1;align-content:center;justify-content:center}.swal2-container.swal2-grow-column{flex:1;flex-direction:column}.swal2-container.swal2-grow-column.swal2-bottom,.swal2-container.swal2-grow-column.swal2-center,.swal2-container.swal2-grow-column.swal2-top{align-items:center}.swal2-container.swal2-grow-column.swal2-bottom-left,.swal2-container.swal2-grow-column.swal2-bottom-start,.swal2-container.swal2-grow-column.swal2-center-left,.swal2-container.swal2-grow-column.swal2-center-start,.swal2-container.swal2-grow-column.swal2-top-left,.swal2-container.swal2-grow-column.swal2-top-start{align-items:flex-start}.swal2-container.swal2-grow-column.swal2-bottom-end,.swal2-container.swal2-grow-column.swal2-bottom-right,.swal2-container.swal2-grow-column.swal2-center-end,.swal2-container.swal2-grow-column.swal2-center-right,.swal2-container.swal2-grow-column.swal2-top-end,.swal2-container.swal2-grow-column.swal2-top-right{align-items:flex-end}.swal2-container.swal2-grow-column>.swal2-modal{display:flex!important;flex:1;align-content:center;justify-content:center}.swal2-container.swal2-no-transition{transition:none!important}.swal2-container:not(.swal2-top):not(.swal2-top-start):not(.swal2-top-end):not(.swal2-top-left):not(.swal2-top-right):not(.swal2-center-start):not(.swal2-center-end):not(.swal2-center-left):not(.swal2-center-right):not(.swal2-bottom):not(.swal2-bottom-start):not(.swal2-bottom-end):not(.swal2-bottom-left):not(.swal2-bottom-right):not(.swal2-grow-fullscreen)>.swal2-modal{margin:auto}@media all and (-ms-high-contrast:none),(-ms-high-contrast:active){.swal2-container .swal2-modal{margin:0!important}}.swal2-popup{display:none;position:relative;box-sizing:border-box;flex-direction:column;justify-content:center;width:32em;max-width:100%;padding:1.25em;border:none;border-radius:5px;background:#fff;font-family:inherit;font-size:1rem}.swal2-popup:focus{outline:0}.swal2-popup.swal2-loading{overflow-y:hidden}.swal2-header{display:flex;flex-direction:column;align-items:center;padding:0 1.8em}.swal2-title{position:relative;max-width:100%;margin:0 0 .4em;padding:0;color:#595959;font-size:1.875em;font-weight:600;text-align:center;text-transform:none;word-wrap:break-word}.swal2-actions{display:flex;z-index:1;box-sizing:border-box;flex-wrap:wrap;align-items:center;justify-content:center;width:100%;margin:1.25em auto 0;padding:0 1.6em}.swal2-actions:not(.swal2-loading) .swal2-styled[disabled]{opacity:.4}.swal2-actions:not(.swal2-loading) .swal2-styled:hover{background-image:linear-gradient(rgba(0,0,0,.1),rgba(0,0,0,.1))}.swal2-actions:not(.swal2-loading) .swal2-styled:active{background-image:linear-gradient(rgba(0,0,0,.2),rgba(0,0,0,.2))}.swal2-loader{display:none;align-items:center;justify-content:center;width:2.2em;height:2.2em;margin:0 1.875em;-webkit-animation:swal2-rotate-loading 1.5s linear 0s infinite normal;animation:swal2-rotate-loading 1.5s linear 0s infinite normal;border-width:.25em;border-style:solid;border-radius:100%;border-color:#2778c4 transparent #2778c4 transparent}.swal2-styled{margin:.3125em;padding:.625em 1.1em;box-shadow:none;font-weight:500}.swal2-styled:not([disabled]){cursor:pointer}.swal2-styled.swal2-confirm{border:0;border-radius:.25em;background:initial;background-color:#2778c4;color:#fff;font-size:1.0625em}.swal2-styled.swal2-deny{border:0;border-radius:.25em;background:initial;background-color:#d14529;color:#fff;font-size:1.0625em}.swal2-styled.swal2-cancel{border:0;border-radius:.25em;background:initial;background-color:#757575;color:#fff;font-size:1.0625em}.swal2-styled:focus{outline:0;box-shadow:0 0 0 3px rgba(100,150,200,.5)}.swal2-styled::-moz-focus-inner{border:0}.swal2-footer{justify-content:center;margin:1.25em 0 0;padding:1em 0 0;border-top:1px solid #eee;color:#545454;font-size:1em}.swal2-timer-progress-bar-container{position:absolute;right:0;bottom:0;left:0;height:.25em;overflow:hidden;border-bottom-right-radius:5px;border-bottom-left-radius:5px}.swal2-timer-progress-bar{width:100%;height:.25em;background:rgba(0,0,0,.2)}.swal2-image{max-width:100%;margin:1.25em auto}.swal2-close{position:absolute;z-index:2;top:0;right:0;align-items:center;justify-content:center;width:1.2em;height:1.2em;padding:0;overflow:hidden;transition:color .1s ease-out;border:none;border-radius:5px;background:0 0;color:#ccc;font-family:serif;font-size:2.5em;line-height:1.2;cursor:pointer}.swal2-close:hover{transform:none;background:0 0;color:#f27474}.swal2-close:focus{outline:0;box-shadow:inset 0 0 0 3px rgba(100,150,200,.5)}.swal2-close::-moz-focus-inner{border:0}.swal2-content{z-index:1;justify-content:center;margin:0;padding:0 1.6em;color:#545454;font-size:1.125em;font-weight:400;line-height:normal;text-align:center;word-wrap:break-word}.swal2-checkbox,.swal2-file,.swal2-input,.swal2-radio,.swal2-select,.swal2-textarea{margin:1em auto}.swal2-file,.swal2-input,.swal2-textarea{box-sizing:border-box;width:100%;transition:border-color .3s,box-shadow .3s;border:1px solid #d9d9d9;border-radius:.1875em;background:inherit;box-shadow:inset 0 1px 1px rgba(0,0,0,.06);color:inherit;font-size:1.125em}.swal2-file.swal2-inputerror,.swal2-input.swal2-inputerror,.swal2-textarea.swal2-inputerror{border-color:#f27474!important;box-shadow:0 0 2px #f27474!important}.swal2-file:focus,.swal2-input:focus,.swal2-textarea:focus{border:1px solid #b4dbed;outline:0;box-shadow:0 0 0 3px rgba(100,150,200,.5)}.swal2-file::-moz-placeholder,.swal2-input::-moz-placeholder,.swal2-textarea::-moz-placeholder{color:#ccc}.swal2-file:-ms-input-placeholder,.swal2-input:-ms-input-placeholder,.swal2-textarea:-ms-input-placeholder{color:#ccc}.swal2-file::placeholder,.swal2-input::placeholder,.swal2-textarea::placeholder{color:#ccc}.swal2-range{margin:1em auto;background:#fff}.swal2-range input{width:80%}.swal2-range output{width:20%;color:inherit;font-weight:600;text-align:center}.swal2-range input,.swal2-range output{height:2.625em;padding:0;font-size:1.125em;line-height:2.625em}.swal2-input{height:2.625em;padding:0 .75em}.swal2-input[type=number]{max-width:10em}.swal2-file{background:inherit;font-size:1.125em}.swal2-textarea{height:6.75em;padding:.75em}.swal2-select{min-width:50%;max-width:100%;padding:.375em .625em;background:inherit;color:inherit;font-size:1.125em}.swal2-checkbox,.swal2-radio{align-items:center;justify-content:center;background:#fff;color:inherit}.swal2-checkbox label,.swal2-radio label{margin:0 .6em;font-size:1.125em}.swal2-checkbox input,.swal2-radio input{margin:0 .4em}.swal2-input-label{display:flex;justify-content:center;margin:1em auto}.swal2-validation-message{align-items:center;justify-content:center;margin:0 -2.7em;padding:.625em;overflow:hidden;background:#f0f0f0;color:#666;font-size:1em;font-weight:300}.swal2-validation-message::before{content:"!";display:inline-block;width:1.5em;min-width:1.5em;height:1.5em;margin:0 .625em;border-radius:50%;background-color:#f27474;color:#fff;font-weight:600;line-height:1.5em;text-align:center}.swal2-icon{position:relative;box-sizing:content-box;justify-content:center;width:5em;height:5em;margin:1.25em auto 1.875em;border:.25em solid transparent;border-radius:50%;border-color:#000;font-family:inherit;line-height:5em;cursor:default;-webkit-user-select:none;-moz-user-select:none;-ms-user-select:none;user-select:none}.swal2-icon .swal2-icon-content{display:flex;align-items:center;font-size:3.75em}.swal2-icon.swal2-error{border-color:#f27474;color:#f27474}.swal2-icon.swal2-error .swal2-x-mark{position:relative;flex-grow:1}.swal2-icon.swal2-error [class^=swal2-x-mark-line]{display:block;position:absolute;top:2.3125em;width:2.9375em;height:.3125em;border-radius:.125em;background-color:#f27474}.swal2-icon.swal2-error [class^=swal2-x-mark-line][class$=left]{left:1.0625em;transform:rotate(45deg)}.swal2-icon.swal2-error [class^=swal2-x-mark-line][class$=right]{right:1em;transform:rotate(-45deg)}.swal2-icon.swal2-error.swal2-icon-show{-webkit-animation:swal2-animate-error-icon .5s;animation:swal2-animate-error-icon .5s}.swal2-icon.swal2-error.swal2-icon-show .swal2-x-mark{-webkit-animation:swal2-animate-error-x-mark .5s;animation:swal2-animate-error-x-mark .5s}.swal2-icon.swal2-warning{border-color:#facea8;color:#f8bb86}.swal2-icon.swal2-info{border-color:#9de0f6;color:#3fc3ee}.swal2-icon.swal2-question{border-color:#c9dae1;color:#87adbd}.swal2-icon.swal2-success{border-color:#a5dc86;color:#a5dc86}.swal2-icon.swal2-success [class^=swal2-success-circular-line]{position:absolute;width:3.75em;height:7.5em;transform:rotate(45deg);border-radius:50%}.swal2-icon.swal2-success [class^=swal2-success-circular-line][class$=left]{top:-.4375em;left:-2.0635em;transform:rotate(-45deg);transform-origin:3.75em 3.75em;border-radius:7.5em 0 0 7.5em}.swal2-icon.swal2-success [class^=swal2-success-circular-line][class$=right]{top:-.6875em;left:1.875em;transform:rotate(-45deg);transform-origin:0 3.75em;border-radius:0 7.5em 7.5em 0}.swal2-icon.swal2-success .swal2-success-ring{position:absolute;z-index:2;top:-.25em;left:-.25em;box-sizing:content-box;width:100%;height:100%;border:.25em solid rgba(165,220,134,.3);border-radius:50%}.swal2-icon.swal2-success .swal2-success-fix{position:absolute;z-index:1;top:.5em;left:1.625em;width:.4375em;height:5.625em;transform:rotate(-45deg)}.swal2-icon.swal2-success [class^=swal2-success-line]{display:block;position:absolute;z-index:2;height:.3125em;border-radius:.125em;background-color:#a5dc86}.swal2-icon.swal2-success [class^=swal2-success-line][class$=tip]{top:2.875em;left:.8125em;width:1.5625em;transform:rotate(45deg)}.swal2-icon.swal2-success [class^=swal2-success-line][class$=long]{top:2.375em;right:.5em;width:2.9375em;transform:rotate(-45deg)}.swal2-icon.swal2-success.swal2-icon-show .swal2-success-line-tip{-webkit-animation:swal2-animate-success-line-tip .75s;animation:swal2-animate-success-line-tip .75s}.swal2-icon.swal2-success.swal2-icon-show .swal2-success-line-long{-webkit-animation:swal2-animate-success-line-long .75s;animation:swal2-animate-success-line-long .75s}.swal2-icon.swal2-success.swal2-icon-show .swal2-success-circular-line-right{-webkit-animation:swal2-rotate-success-circular-line 4.25s ease-in;animation:swal2-rotate-success-circular-line 4.25s ease-in}.swal2-progress-steps{flex-wrap:wrap;align-items:center;max-width:100%;margin:0 0 1.25em;padding:0;background:inherit;font-weight:600}.swal2-progress-steps li{display:inline-block;position:relative}.swal2-progress-steps .swal2-progress-step{z-index:20;flex-shrink:0;width:2em;height:2em;border-radius:2em;background:#2778c4;color:#fff;line-height:2em;text-align:center}.swal2-progress-steps .swal2-progress-step.swal2-active-progress-step{background:#2778c4}.swal2-progress-steps .swal2-progress-step.swal2-active-progress-step~.swal2-progress-step{background:#add8e6;color:#fff}.swal2-progress-steps .swal2-progress-step.swal2-active-progress-step~.swal2-progress-step-line{background:#add8e6}.swal2-progress-steps .swal2-progress-step-line{z-index:10;flex-shrink:0;width:2.5em;height:.4em;margin:0 -1px;background:#2778c4}[class^=swal2]{-webkit-tap-highlight-color:transparent}.swal2-show{-webkit-animation:swal2-show .3s;animation:swal2-show .3s}.swal2-hide{-webkit-animation:swal2-hide .15s forwards;animation:swal2-hide .15s forwards}.swal2-noanimation{transition:none}.swal2-scrollbar-measure{position:absolute;top:-9999px;width:50px;height:50px;overflow:scroll}.swal2-rtl .swal2-close{right:auto;left:0}.swal2-rtl .swal2-timer-progress-bar{right:0;left:auto}@supports (-ms-accelerator:true){.swal2-range input{width:100%!important}.swal2-range output{display:none}}@media all and (-ms-high-contrast:none),(-ms-high-contrast:active){.swal2-range input{width:100%!important}.swal2-range output{display:none}}@-webkit-keyframes swal2-toast-show{0%{transform:translateY(-.625em) rotateZ(2deg)}33%{transform:translateY(0) rotateZ(-2deg)}66%{transform:translateY(.3125em) rotateZ(2deg)}100%{transform:translateY(0) rotateZ(0)}}@keyframes swal2-toast-show{0%{transform:translateY(-.625em) rotateZ(2deg)}33%{transform:translateY(0) rotateZ(-2deg)}66%{transform:translateY(.3125em) rotateZ(2deg)}100%{transform:translateY(0) rotateZ(0)}}@-webkit-keyframes swal2-toast-hide{100%{transform:rotateZ(1deg);opacity:0}}@keyframes swal2-toast-hide{100%{transform:rotateZ(1deg);opacity:0}}@-webkit-keyframes swal2-toast-animate-success-line-tip{0%{top:.5625em;left:.0625em;width:0}54%{top:.125em;left:.125em;width:0}70%{top:.625em;left:-.25em;width:1.625em}84%{top:1.0625em;left:.75em;width:.5em}100%{top:1.125em;left:.1875em;width:.75em}}@keyframes swal2-toast-animate-success-line-tip{0%{top:.5625em;left:.0625em;width:0}54%{top:.125em;left:.125em;width:0}70%{top:.625em;left:-.25em;width:1.625em}84%{top:1.0625em;left:.75em;width:.5em}100%{top:1.125em;left:.1875em;width:.75em}}@-webkit-keyframes swal2-toast-animate-success-line-long{0%{top:1.625em;right:1.375em;width:0}65%{top:1.25em;right:.9375em;width:0}84%{top:.9375em;right:0;width:1.125em}100%{top:.9375em;right:.1875em;width:1.375em}}@keyframes swal2-toast-animate-success-line-long{0%{top:1.625em;right:1.375em;width:0}65%{top:1.25em;right:.9375em;width:0}84%{top:.9375em;right:0;width:1.125em}100%{top:.9375em;right:.1875em;width:1.375em}}@-webkit-keyframes swal2-show{0%{transform:scale(.7)}45%{transform:scale(1.05)}80%{transform:scale(.95)}100%{transform:scale(1)}}@keyframes swal2-show{0%{transform:scale(.7)}45%{transform:scale(1.05)}80%{transform:scale(.95)}100%{transform:scale(1)}}@-webkit-keyframes swal2-hide{0%{transform:scale(1);opacity:1}100%{transform:scale(.5);opacity:0}}@keyframes swal2-hide{0%{transform:scale(1);opacity:1}100%{transform:scale(.5);opacity:0}}@-webkit-keyframes swal2-animate-success-line-tip{0%{top:1.1875em;left:.0625em;width:0}54%{top:1.0625em;left:.125em;width:0}70%{top:2.1875em;left:-.375em;width:3.125em}84%{top:3em;left:1.3125em;width:1.0625em}100%{top:2.8125em;left:.8125em;width:1.5625em}}@keyframes swal2-animate-success-line-tip{0%{top:1.1875em;left:.0625em;width:0}54%{top:1.0625em;left:.125em;width:0}70%{top:2.1875em;left:-.375em;width:3.125em}84%{top:3em;left:1.3125em;width:1.0625em}100%{top:2.8125em;left:.8125em;width:1.5625em}}@-webkit-keyframes swal2-animate-success-line-long{0%{top:3.375em;right:2.875em;width:0}65%{top:3.375em;right:2.875em;width:0}84%{top:2.1875em;right:0;width:3.4375em}100%{top:2.375em;right:.5em;width:2.9375em}}@keyframes swal2-animate-success-line-long{0%{top:3.375em;right:2.875em;width:0}65%{top:3.375em;right:2.875em;width:0}84%{top:2.1875em;right:0;width:3.4375em}100%{top:2.375em;right:.5em;width:2.9375em}}@-webkit-keyframes swal2-rotate-success-circular-line{0%{transform:rotate(-45deg)}5%{transform:rotate(-45deg)}12%{transform:rotate(-405deg)}100%{transform:rotate(-405deg)}}@keyframes swal2-rotate-success-circular-line{0%{transform:rotate(-45deg)}5%{transform:rotate(-45deg)}12%{transform:rotate(-405deg)}100%{transform:rotate(-405deg)}}@-webkit-keyframes swal2-animate-error-x-mark{0%{margin-top:1.625em;transform:scale(.4);opacity:0}50%{margin-top:1.625em;transform:scale(.4);opacity:0}80%{margin-top:-.375em;transform:scale(1.15)}100%{margin-top:0;transform:scale(1);opacity:1}}@keyframes swal2-animate-error-x-mark{0%{margin-top:1.625em;transform:scale(.4);opacity:0}50%{margin-top:1.625em;transform:scale(.4);opacity:0}80%{margin-top:-.375em;transform:scale(1.15)}100%{margin-top:0;transform:scale(1);opacity:1}}@-webkit-keyframes swal2-animate-error-icon{0%{transform:rotateX(100deg);opacity:0}100%{transform:rotateX(0);opacity:1}}@keyframes swal2-animate-error-icon{0%{transform:rotateX(100deg);opacity:0}100%{transform:rotateX(0);opacity:1}}@-webkit-keyframes swal2-rotate-loading{0%{transform:rotate(0)}100%{transform:rotate(360deg)}}@keyframes swal2-rotate-loading{0%{transform:rotate(0)}100%{transform:rotate(360deg)}}body.swal2-shown:not(.swal2-no-backdrop):not(.swal2-toast-shown){overflow:hidden}body.swal2-height-auto{height:auto!important}body.swal2-no-backdrop .swal2-container{top:auto;right:auto;bottom:auto;left:auto;max-width:calc(100% - .625em * 2);background-color:transparent!important}body.swal2-no-backdrop .swal2-container>.swal2-modal{box-shadow:0 0 10px rgba(0,0,0,.4)}body.swal2-no-backdrop .swal2-container.swal2-top{top:0;left:50%;transform:translateX(-50%)}body.swal2-no-backdrop .swal2-container.swal2-top-left,body.swal2-no-backdrop .swal2-container.swal2-top-start{top:0;left:0}body.swal2-no-backdrop .swal2-container.swal2-top-end,body.swal2-no-backdrop .swal2-container.swal2-top-right{top:0;right:0}body.swal2-no-backdrop .swal2-container.swal2-center{top:50%;left:50%;transform:translate(-50%,-50%)}body.swal2-no-backdrop .swal2-container.swal2-center-left,body.swal2-no-backdrop .swal2-container.swal2-center-start{top:50%;left:0;transform:translateY(-50%)}body.swal2-no-backdrop .swal2-container.swal2-center-end,body.swal2-no-backdrop .swal2-container.swal2-center-right{top:50%;right:0;transform:translateY(-50%)}body.swal2-no-backdrop .swal2-container.swal2-bottom{bottom:0;left:50%;transform:translateX(-50%)}body.swal2-no-backdrop .swal2-container.swal2-bottom-left,body.swal2-no-backdrop .swal2-container.swal2-bottom-start{bottom:0;left:0}body.swal2-no-backdrop .swal2-container.swal2-bottom-end,body.swal2-no-backdrop .swal2-container.swal2-bottom-right{right:0;bottom:0}@media print{body.swal2-shown:not(.swal2-no-backdrop):not(.swal2-toast-shown){overflow-y:scroll!important}body.swal2-shown:not(.swal2-no-backdrop):not(.swal2-toast-shown)>[aria-hidden=true]{display:none}body.swal2-shown:not(.swal2-no-backdrop):not(.swal2-toast-shown) .swal2-container{position:static!important}}body.swal2-toast-shown .swal2-container{background-color:transparent}body.swal2-toast-shown .swal2-container.swal2-top{top:0;right:auto;bottom:auto;left:50%;transform:translateX(-50%)}body.swal2-toast-shown .swal2-container.swal2-top-end,body.swal2-toast-shown .swal2-container.swal2-top-right{top:0;right:0;bottom:auto;left:auto}body.swal2-toast-shown .swal2-container.swal2-top-left,body.swal2-toast-shown .swal2-container.swal2-top-start{top:0;right:auto;bottom:auto;left:0}body.swal2-toast-shown .swal2-container.swal2-center-left,body.swal2-toast-shown .swal2-container.swal2-center-start{top:50%;right:auto;bottom:auto;left:0;transform:translateY(-50%)}body.swal2-toast-shown .swal2-container.swal2-center{top:50%;right:auto;bottom:auto;left:50%;transform:translate(-50%,-50%)}body.swal2-toast-shown .swal2-container.swal2-center-end,body.swal2-toast-shown .swal2-container.swal2-center-right{top:50%;right:0;bottom:auto;left:auto;transform:translateY(-50%)}body.swal2-toast-shown .swal2-container.swal2-bottom-left,body.swal2-toast-shown .swal2-container.swal2-bottom-start{top:auto;right:auto;bottom:0;left:0}body.swal2-toast-shown .swal2-container.swal2-bottom{top:auto;right:auto;bottom:0;left:50%;transform:translateX(-50%)}body.swal2-toast-shown .swal2-container.swal2-bottom-end,body.swal2-toast-shown .swal2-container.swal2-bottom-right{top:auto;right:0;bottom:0;left:auto}</style></head>

<script>loadHTML("/header");</script>
  <body onload="init();">
<div class="section_view">
<meta charset="utf-8">
<div id="sectionView">
<div class="inner_view">
<%--  <c:forEach items="${list3}" var="detail" varStatus="status">  --%>
<div class="thumb" style="background-image: url(&quot;https://img-cf.kurly.com/shop/data/goods/1642054430352y0.jpg&quot;);">
<img src="\resources\image\market\item\<fmt:formatDate value="${list3.ori_date}" pattern="yyyy-MM-dd" />\<c:out value="${list3.item_code}"/><c:out value="${fn:split(list3.item_image,':')[0]}"/>" alt="상품 대표 이미지" class="bg"></div> <p class="goods_name"><span class="btn_share"></span> 
<strong class="name"><c:out value="${list3.item_name }"/></strong> </p>
 <p class="goods_dcinfo">회원할인가</p> <p class="goods_price"><span class="position">
 <span class="dc"><span class="dc_price"><fmt:formatNumber value="${list3.item_price}" pattern="#,### 원" /><span class="won">원</span></span> 
</span> 


    <div class="goods_info">
    <dl class="list fst"><dt class="tit">판매단위</dt> <dd class="desc">1팩</dd></dl> <dl class="list"><dt class="tit">중량/용량</dt> <dd class="desc">715g</dd></dl>
    <dl class="list"><dt class="tit">배송구분</dt> <dd class="desc">                  샛별배송/택배배송                </dd></dl> 
    <dl class="list"><dt class="tit">포장타입</dt> <dd class="desc">                    냉장/스티로폼                     
    <strong class="emph">                      택배배송은 에코포장이 스티로폼으로 대체됩니다.                    </strong></dd></dl> 

 <dl class="list"><dt class="tit">유통기한</dt> <dd class="desc">수령일 포함 3일 이상 남은 상품을 보내드립니다.</dd></dl></div>
<%-- </c:forEach> --%>
 </div>
 </div>


<div id="cartPut">
<div class="cart_option cartList cart_type2">
<div class="inner_option">
<!--  
<div class="in_option">
<div class="list_goods">
<ul class="list list_nopackage">
<li class="on"><span class="btn_position"><button type="button" class="btn_del"><span class="txt">삭제하기</span></button></span> 
<span class="name">                                      </span> 
 <span class="tit_item">
 구매수량 <input type=hidden name="sell-price" value="<fmt:formatNumber value="${list3.item_price}" pattern="#,###" />">
 </span> 
<div class="option">
<span class="count">
<button type="button" name="btn down on">-</button> 
<input type="number"  class="inp" value="1"> 
<button type="button" name="btn up on">+</button>
</span> 

</div>
</li>


</ul>
</div>
-->
 <form name="form" method="get">
수량 : <input type=hidden name="sell_price" value="${list3.item_price}">
<input type="text" name="amount" value="1" size="3" onchange="change();" id="cart_count" name="cart_count">
<input type="button" value=" + " onclick="add();"><input type="button" value=" - " onclick="del();"><br>

 <div class="total"><div class="price"><strong class="tit">총 상품금액 :</strong> 
 <span class="sum"><span class="num"><input type="number" name="sum" size="11" readonly> </span> <span class="won">원</span></span></div> </div>
 </div>
 </form>

 <div class="cart_footer off"> 
<div class="button_wrap">
<button type="button" class="base_button full" onclick="addCart(this.value)" value="${list3.item_code}">                      장바구니 담기  🛒               </button>
</div>
</div>
</div>
</div> 
</div>
</div>
<div class="layout-wrapper goods-view-area">
<div class="goods-view-infomation detail_wrap_outer" id="goods-view-infomation">
<div class="goods-view-tab">
<ul class="goods-view-infomation-tab-group">
<li class="goods-view-infomation-tab">
<a href="" class="goods-view-infomation-tab-anchor __active">💜 상품설명 & 리뷰 💜</a>
</li>


<script>
const cri = {
      item_code : '${list3.item_code}',
      pageNum : 1,
      amount : 5
   }
/* 댓글 페이지 이동 버튼 동작 */
$(document).on('click', '.pageMaker_btn a', function(e){
   e.preventDefault();
   
   let page = $(this).attr("href");
   cri.pageNum = page;      
   
   replyListInit();
      
 });
$(document).ready(function(){
   const item_code = '${list3.item_code}';   

   $.getJSON("/reply/list", {item_code :item_code}, function(obj){
      makeReplyContent(obj)
      
   });
});
/* 댓글 데이터 서버 요청 및 댓글 동적 생성 메서드 */
 

let replyListInit = function(){
   $.getJSON("/reply/list", cri , function(obj){
      
      makeReplyContent(obj);
      
   });
}

 
/* 리뷰 수정 버튼 */
    $(document).on('click', '.update_reply_btn', function(e){
         
         e.preventDefault();
             
         let popUrl = "/replyUpdate?item_code=" + '${list3.item_code}';   
         let popOption = "width = 490px, height=490px, top=300px, left=300px, scrollbars=yes"
         
         window.open(popUrl,"리뷰 수정",popOption);   
       
    });
      /* 리뷰 삭제 버튼 */
    $(document).on('click', '.delete_reply_btn', function(e){
         e.preventDefault();
         let replyId = $(this).attr("href");   
         
         $.ajax({
            data : {
               replyId : replyId,
               item_code : '${list3.item_code}'
                  },
            url : '/reply/delete',
            type : 'POST',
            success : function(result){
               
               alert('삭제가 완료되엇습니다.');
            }
         });      
         
         
    });

/* 댓글(리뷰) 동적 생성 메서드 */
function makeReplyContent(obj){
   //console.log("aa");
   //console.log("${id}");
   if(obj.list.length === 0){
      $(".reply_not_div").html('<span>리뷰가 없습니다.</span>');
      $(".reply_content_ul").html('');
      $(".pageMaker").html('');
   } else{
      
      $(".reply_not_div").html('');
      
      const list = obj.list;
      const pf = obj.pageinfo;
      //const review_id = '${reviewid.review_id}';
      /* list */
      let reply_list = '';         
      $(list).each(function(i,obj){
         reply_list += '<li>';
         reply_list += '<div class="comment_wrap">';
         reply_list += '<div class="reply_top">';
         /* 아이디 */
         reply_list += '<span class="id_span">'+ obj.review_id+'</span>';
         /* 날짜 */
         reply_list += '<span class="date_span">'+ obj.review_date +'</span>';
         /* 평점 */
         reply_list += '<span class="rating_span">평점 : <span class="rating_value_span">'+ obj.review_grade +'</span>점</span>';
         
         /*로그인 한 사용자와 리뷰 작성자가 동일한 경우에만 보이게*/
         <sec:authorize access="isAuthenticated()"> 
         if (obj.review_id =="${id}"){
         reply_list += '<a class="update_reply_btn" href="'+ obj.replyId +'">수정</a><a class="delete_reply_btn" href="'+ obj.replyId +'">삭제</a>';
         }
         </sec:authorize > 
         
         reply_list += '</div>'; //<div class="reply_top">
         reply_list += '<div class="reply_bottom">';
         reply_list += '<div class="reply_bottom_txt">'+ obj.review_content +'</div>';
         reply_list += '</div>';//<div class="reply_bottom">
         reply_list += '</div>';//<div class="comment_wrap">
         reply_list += '</li>';
      });
      $(".reply_content_ul").html(reply_list);
         
            /* 페이지 버튼 */
         let reply_pageMaker = '';   

         /* prev */
         if(pf.prev){
            let prev_num = pf.pageStart -1;
            reply_pageMaker += '<li class="pageMaker_btn prev">';
            reply_pageMaker += '<a href="'+ prev_num +'">이전</a>';
            reply_pageMaker += '</li>';   
         }
         /* numbre btn */
         for(let i = pf.pageStart; i < pf.pageEnd+1; i++){
            reply_pageMaker += '<li class="pageMaker_btn ';
            if(pf.cri.pageNum === i){
               reply_pageMaker += 'active';
            }
            reply_pageMaker += '">';
            reply_pageMaker += '<a href="'+i+'">'+i+'</a>';
            reply_pageMaker += '</li>';
         }
         /* next */
         if(pf.next){
            let next_num = pf.pageEnd +1;
            reply_pageMaker += '<li class="pageMaker_btn next">';
            reply_pageMaker += '<a href="'+ next_num +'">다음</a>';
            reply_pageMaker += '</li>';   
         }   
         $(".pageMaker").html(reply_pageMaker);            
         
   
   
   }

}


</script>


<sec:authorize access="isAuthenticated()">
   <div class="reply_button_wrap">
               <button name="review">리뷰 쓰기 </button>
         </div>

</sec:authorize>
</ul>
</div>

<div class="goods-view-infomation-content __active" id="goods-description">

<div id="giftNotice"></div>


<div class="goods_wrap">
<div class="goods_intro">
<div class="pic">
<img src="\resources\image\market\item\<fmt:formatDate value="${list3.ori_date}" pattern="yyyy-MM-dd" />\<c:out value="${list3.item_code}"/><c:out value="${fn:split(list3.item_image,':')[1]}"/>">
</div>
<div class="context last">

<p class="words">${list3.item_detail}</p>
</div>
<div class="goods_point">
<h3><span>Kurly's Check Point</span></h3>
<div class="context last">
<div class="pic">
<!-- kurly's check point 이미지 -->
<img src="${pageContext.request.contextPath}/resources/mkdetail/gv00000209717_1.webp">
</div>
</div>
</div><div class="goods_tip"><h3><span>Kurly’s Tip</span></h3><div class="tip_box"><div class="context">
<p class="words">
<strong>보관법</strong>
<b>&#12539;</b>0~10℃의 냉장고에 보관하세요.
</p>
</div></div></div></div>

</div>
<div class="goods-view-infomation-content" id="goods-infomation">
<div id="goods-image">
<div id="goods_pi">
<p class="pic">
<img src="">
</p>
</div>
</div>
<table width="100%" border="0" cellpadding="0" cellspacing="1" class="extra-information">
<tbody><tr>
<th scope="row" class="goods-view-form-table-heading">제품명</th><td>상품설명 및 상품이미지 참조</td> <th scope="row" class="goods-view-form-table-heading">식품의 유형</th><td>상품설명 및 상품이미지 참조</td> </tr>
<tr>
<th scope="row" class="goods-view-form-table-heading">생산자및소재지(수입품의경우생산자,수입자및제조국)</th><td>상품설명 및 상품이미지 참조</td> <th scope="row" class="goods-view-form-table-heading">제조연월일,유통기한또는품질유지기한</th><td>제품 별도 라벨 표기 참조</td> </tr>
<tr>
<th scope="row" class="goods-view-form-table-heading">포장단위별 내용물의 용량(중량), 수량</th><td>상품설명 및 상품이미지 참조</td> <th scope="row" class="goods-view-form-table-heading">원재료명및함량(농수산물의원산지표시에관한법률에따른원산지표시포함)</th><td>상품설명 및 상품이미지 참조</td> </tr>
<tr>
<th scope="row" class="goods-view-form-table-heading">영양성분(식품등의표시·광고에관한법률에 따른 영양성분 표시대상 식품에 한함)</th><td>상품설명 및 상품이미지 참조</td> <th scope="row" class="goods-view-form-table-heading">유전자변형식품에해당하는경우의표시</th><td>상품설명 및 상품이미지 참조</td> </tr>
<tr>
<th scope="row" class="goods-view-form-table-heading">소비자안전을 위한 주의사항</th><td>상품설명 및 상품이미지 참조</td> <th scope="row" class="goods-view-form-table-heading">수입식품에 해당하는 경우 “수입식품안전관리특별법에 따른 수입신고를 필함”의 문구</th><td>상품설명 및 상품이미지 참조</td> </tr>
<tr>
<th scope="row" class="goods-view-form-table-heading">소비자상담관련전화번호</th><td>마켓컬리 고객행복센터 (1644-1107)</td> <th scope="row" class="goods-view-form-table-heading"></th><td></td> </tr>
<tr>
</tr>
</tbody></table>

<div class="whykurly_area">
<div class="row">
<strong class="tit_whykurly">WHY KURLY</strong>
<div id="why_kurly" class="txt_area"><div class="why-kurly"><div class="col"><div class="icon"><img src="${pageContext.request.contextPath}/resources/mkdetail/01_check.svg"></div> <div class="info"><div class="title">깐깐한 상품위원회</div> <div class="desc"><p>나와 내 가족이 먹고 쓸 상품을 고르는<br>      마음으로 매주 상품을 직접 먹어보고,<br>      경험해보고 성분, 맛, 안정성 등 다각도의<br>      기준을 통과한 상품만을 판매합니다.</p> <!----></div></div></div><div class="col"><div class="icon"><img src="${pageContext.request.contextPath}/resources/mkdetail/02_only.svg"></div> <div class="info"><div class="title">차별화된 Kurly Only 상품</div> <div class="desc"><p>전국 각지와 해외의 훌륭한 생산자가<br>      믿고 선택하는 파트너, 마켓컬리.<br>      3천여 개가 넘는 컬리 단독 브랜드, 스펙의<br>      Kurly Only 상품을 믿고 만나보세요.</p> <span class="etc">(온라인 기준 / 자사몰, 직구 제외)</span></div></div></div><div class="col"><div class="icon"><img src="${pageContext.request.contextPath}/resources/mkdetail/03_cold.svg"></div> <div class="info"><div class="title">신선한 풀콜드체인 배송</div> <div class="desc"><p>온라인 업계 최초로 산지에서 문 앞까지<br>      상온, 냉장, 냉동 상품을 분리 포장 후<br>      최적의 온도를 유지하는 냉장 배송 시스템,<br>      풀콜드체인으로 상품을 신선하게 전해드립니다.</p> <span class="etc">(샛별배송에 한함)</span></div></div></div><div class="col"><div class="icon"><img src="${pageContext.request.contextPath}/resources/mkdetail/04_price.svg"></div> <div class="info"><div class="title">고객, 생산자를 위한 최선의 가격</div> <div class="desc"><p>매주 대형 마트와 주요 온라인 마트의 가격<br>      변동 상황을 확인해 신선식품은 품질을<br>      타협하지 않는 선에서 최선의 가격으로,<br>      가공식품은 언제나 합리적인 가격으로<br>      정기 조정합니다.</p> <!----></div></div></div><div class="col"><div class="icon"><img src="${pageContext.request.contextPath}/resources/mkdetail/05_eco.svg"></div> <div class="info"><div class="title">환경을 생각하는 지속 가능한 유통</div> <div class="desc"><p>친환경 포장재부터 생산자가 상품에만<br>      집중할 수 있는 직매입 유통구조까지,<br>      지속 가능한 유통을 고민하며 컬리를 있게<br>      하는 모든 환경(생산자, 커뮤니티, 직원)이<br>      더 나아질 수 있도록 노력합니다.</p> <!----></div></div></div></div></div>
</div>
</div>
<script src="${pageContext.request.contextPath}/resources/mkdetail/mk_goods.js.다운로드"></script>



   
            <h2 >PRODUCT REVIEW</h2>
            <div class="reply_not_div">
               
            </div>
            <ul class="reply_content_ul">
            <!-- 
                  <li>
                  <div class="comment_wrap">
                     <div class="reply_top">
                        <span class="id_span">sjinjin7</span>
                        <span class="date_span">2021-10-11</span>
                        <span class="rating_span">평점 : <span class="rating_value_span">4</span>점</span>
                        
                         <a class="update_reply_btn">수정</a><a class="delete_reply_btn">삭제</a>
                      
                     </div>
                     <div class="reply_bottom">
                        <div class="reply_bottom_txt">
                           사실 기대를 많이하고 읽기시작했는데 책장이 사실 안넘겨집니다.
                        </div>
                     </div>
                  </div>
               </li>
                -->
            </ul>
            <div class="reply_pageInfo_div">
                     <ul class="pageMaker">
                     <!-- 
                  <li class="pageMaker_btn prev">
                     <a>이전</a>
                  </li>
                  <li class="pageMaker_btn">
                     <a>1</a>
                  </li>
                  <li class="pageMaker_btn">
                     <a>2</a>
                  </li>
                  <li class="pageMaker_btn active">
                     <a>3</a>
                  </li>                                       
                  <li class="pageMaker_btn next">
                     <a>다음</a>
                  </li>
                   -->
               </ul>
               <input type="hidden" name="item_code" value="<c:out value="${pageMaker.cri.item_code}"/>">
            </div>
            

<script>loadHTML("/footer");</script>
<a href="https://www.kurly.com/shop/goods/goods_view.php?&amp;goodsno=106321#top" id="pageTop" class="" style="opacity: 0; bottom: -58px;">맨 위로가기</a>
<script src="${pageContext.request.contextPath}/resources/mkdetail/customeEvent.js.다운로드"></script>
 </body>
 </html>