// certification
jQuery(function () {
    jQuery('.showSingle').click(function () {
        var index = $(this).index(), newTarget = jQuery('.target_contents').eq(index);
        jQuery('.target_contents').not(newTarget).slideUp('fast');
        newTarget.delay('fast').slideToggle('fast');
        $('.showSingle').not(this).removeClass('selected');
        $(this).toggleClass('selected');
        return false;
    })

    // 제품상세_이벤트배너
    if($(".bnr_viewevent").length != 0) {
        var $eventCheck = false;
        $(".bnr_viewevent .btn").on("click", function (e) {
            e.preventDefault();
            if($eventCheck === true) return false;
            $eventCheck = true;
            if ($(this).hasClass("btn_close")) {
                $(this).removeClass("btn_close");
            } else {
                $(this).addClass("btn_close");
            }
            var target = $(this).parents(".bnr_viewevent").find(".view_event");
            var target_pos = target.parent(".bnr_viewevent").offset();
            if($('#qnb').length > 0){
                // pc
                target_pos = target_pos.top - $("#gnb").height();
            }else{
                // mWeb
                target_pos = target_pos.top -( $("#header").height() + $("#content-tab").height() );
            }
            if (target.css("display") === "none") {
                $('html, body').stop().animate({scrollTop: target_pos}, 400);
                target.stop().slideDown(400,function(){$eventCheck = false;});
            } else {
                target.stop().slideUp(400,function(){$eventCheck = false;});
            }
        });
    }


    // PD-811 장차석 : Kurly's Tip 동영상 들어갈시 사이즈조정 PC
    if($('.goods_tip .tip_box iframe').length > 0 && $('#qnb').length > 0){
        $('.goods_tip .tip_box iframe').css({
            width:'100%',
            'margin-bottom':'30px'
        }).css({
            height : $('.goods_tip .tip_box iframe').width()/1.75
        });
    }

    // PD-811 장차석 : 동영상 들어갈시 사이즈조정 mWeb
    if($('#goods-infomation iframe').length > 0 && $('#qnb').length === 0){
        $('#goods-infomation iframe').each(function(){
            var $self = $(this);
            $self.css({
                width:'100%'
            }).css({
                height : parseInt($self.width()/1.765)
            });
        });
    }

    // KM-590 장차석 : tip 바로 다음 배너추가 PC
    if($('#tipAfterPc').length > 0){
        var cloneTipAfter = $('#tipAfterPc').clone()
        var cloneAfter = $('#tipAfterPc').parents('.tip_box');
        $('#tipAfterPc').remove();
        cloneAfter.after(cloneTipAfter);
        cloneTipAfter.css('display','block');
        cloneTipAfter.find('br').remove();
    }
    // KM-590 장차석 : tip 바로 다음 배너추가 mWeb
    if($('#tipAfterM').length > 0){
        var cloneTipAfter = $('#tipAfterM').clone()
        var cloneAfter = $('#tipAfterM').parents('.tip_box');
        $('#tipAfterM').remove();
        cloneAfter.after(cloneTipAfter);
        cloneTipAfter.css('display','block');
        cloneTipAfter.find('br').remove();
    }
});

// send to SNS
// 2018-05-03 장차석 : 상품상세에서만 사용중  추후 동일기능 사용시 위치 이동필요
var shareSNS = function(){}
shareSNS.prototype= {
    clickPos:null,
    goodsTit:null, // 상품명
    goodsDesc:null, // 상품설명
    descDetail:null, // 상품설명상세
    bgUrl:null, // 배경 이미지
    thumbUrl:null, // 이미지URL
    thumbWidth:null, // 이미지가로사이즈
    thumbHeight:null, // 이미지세로사이즈
    pageUrl:null, // 페이지 URL
    tit_button:null, // 버튼제목
    goodsNo:null, // 상품번호
    appType:null,
    type:null,
    init:function(){
        // this.obj = obj,
        this.clickPos = 0,
        this.goodsTit = null,
        this.goodsDesc  = null,
        this.descDetail = null,
        this.bgUrl = null,
        this.thumbUrl = null,
        this.thumbWidth = null,
        this.thumbHeight = null,
        this.pageUrl = null,
        this.tit_button = null,
        this.goodsNo = null,
        this.appType = null,
        this.type = null;
    }, getShare:function(goodsno, type) {
        var $this = this;
        kurlyApi({
            method:'get',
            url:'/v1/share?product_no='+goodsno
        })
        .then(function(response){
            if(response.status != 200) return;
            var getData = response.data.data;
            $this.goodsTit = getData.title;
            $this.goodsDesc  = getData.content_title;
            $this.descDetail = getData.content_description;
            $this.bgUrl = getData.background_image_url;
            $this.thumbUrl = getData.image_url;
            $this.thumbWidth = getData.image_width;
            $this.thumbHeight = getData.image_height;
            $this.pageUrl = getData.url;
            $this.tit_button = getData.button_title;
            $this.goodsNo = getData.no;
            if(type === 'pc'){
                $('.layer_share .btn_url .inp').val($this.pageUrl);
            }
            $this.layerData(type);
        }.bind(this)).catch(function(e){
            this.errors.push(e);
            console.error(this.errors.code + this.errors.message);
        });
    }, layerData : function(deviceType){
        var $this = this;
        $this.type = deviceType;

        if($this.type === 'mobile'){
            if($('.layer_share').hasClass('share_ios')) $this.appType = 'I';
            if($('.layer_share').hasClass('share_and')) $this.appType = 'A';
        }
        if($this.appType != null){
            var dataPost = {
                'code':'',
                'product_no':'',
                'url':''
            };
            dataPost.code = "WVA1000";
            dataPost.product_no = $this.goodsNo;
            dataPost.url = $this.pageUrl;
            dataPost = JSON.stringify(dataPost);
            if($this.appType == 'I'){
                window.webkit.messageHandlers.action.postMessage(dataPost);
            }else{
                Android.postMessage(dataPost);
            }
            return;
        }else{
            $('.layer_share .name').html($this.goodsTit);
            $('.layer_share .info_share').attr('style', 'background-image:url(' + $this.bgUrl + ')');
            $('.layer_share .info_share .thumb').attr('style', 'background-image:url(' + $this.thumbUrl + ')');

            $('.layer_share .list_share a').on('click', function(e){
                e.preventDefault();
                snsName = $(this).data('sns');
                if(snsName === 'kakao'){
                    $this.shareKakao();
                }else if(snsName === 'copy'){
                    $this.copyClip();
                }else{
                    $this.toSns(snsName);
                }
                branchViewAction('sns');// KM-1238 branch 기능 추가

                // KM-2331 Amplitude 연동
                $this.amplitudeAction('click', $(this).data('snsName'));
            });
            $('.layer_share .btn_off').on('click', function(e){
                e.preventDefault();
                $this.layerClose();
            });
            $('.layer_share').hover(function(){
                $(this).show();
            }, function(){
                $(this).hide();
            });
        }
        $this.layerOpen();
    }, layerOpen : function(){
        var $this = this, $obj;
        $('.layer_share').show();
        if($this.type === 'mobile'){
            $this.clickPos = $(document).scrollTop();
            window.scrollTo(0, 0);
            $('#appStyle, #footer').hide();

            $obj = $('.layer_share .info_share');
            $obj.css({position:'fixed'});
            $('.layer_share .list_share').css({
                'padding-top': $obj.height()
            });
        }

        // KM-2331 Amplitude 연동
        $this.amplitudeAction('share')

    }, layerClose:function(){
        var $this = this;
        if($this.type === 'mobile'){
            $('#appStyle').show();
            if($this.appType === null){
                $('#footer').show();
            }
            window.scrollTo(0, $this.clickPos);
        }
        $('.layer_share').hide();

        // KM-2331 Amplitude 연동
        $this.amplitudeAction('product_detail_description')
    }, shareKakao:function(){
        var $this = this;
        Kakao.cleanup();
        Kakao.init('37a25ee08c7c7125675bdbc23a65b473');
        Kakao.Link.sendDefault({
            objectType:'feed',
            content:{
                title: $this.goodsDesc,
                imageUrl: $this.thumbUrl,
                imageWidth: $this.thumbWidth,
                imageHeight: $this.thumbHeight,
                link:{
                    mobileWebUrl: $this.pageUrl,
                    webUrl: $this.pageUrl
                }
            },
            buttons:[
                {
                    title:$this.tit_button,
                    link:{
                        mobileWebUrl: $this.pageUrl,
                        webUrl: $this.pageUrl
                    }
                }
            ],
            installTalk:true
        });
    }, shareKakaoStory:function(){
        var $this = this;
        Kakao.Story.share({
            url: $this.pageUrl,
            text: $this.goodsDesc
        });
    }, toSns:function(sns){
        var $this = this;
        var snsArray = new Array();
        snsArray['twitter'] = "https://twitter.com/intent/tweet?text=" + encodeURIComponent($this.goodsDesc) +'&url='+ encodeURIComponent($this.pageUrl);
        snsArray['facebook'] = "http://www.facebook.com/share.php?u=" + encodeURIComponent($this.pageUrl);
        snsArray['line'] = "http://line.me/R/msg/text/?" + encodeURIComponent($this.goodsDesc) + " " + encodeURIComponent($this.pageUrl);
        window.open(snsArray[sns]);
    }, copyClip:function(){
        var $this = this;
        var IE = (document.all) ? true : false;
        if(IE){
            window.disableSelection = false; // ie 11복사 지원
            window.clipboardData.setData("Text", $this.pageUrl);
            window.disableSelection = true;
            alert("이 글의 단축url이 클립보드에 복사되었습니다.");
            if($('.btn_copy')) $('.btn_copy').removeClass('off');
        }else{
            $('.btn_url .inp').select();
            var successful = document.execCommand('copy')
            alert("이 글의 단축url이 클립보드에 복사되었습니다.");
            if($('.btn_copy')) $('.btn_copy').removeClass('off');
        }
    },
    amplitudeAction: function(name, data){ // KM-2331 Amplitude 연동
        var _actionData = {};
        if(typeof data === 'undefined'){
            KurlyTracker.setScreenName(name);
        }else{
            // 상품상세페이지정보값 가져오기
            _actionData = {
                package_id: this.goodsNo,
                package_name: this.goodsTit,
                message: null,
                channel: data
            }
            KurlyTracker.setAction('share_product', _actionData).sendData();
        }
    }
}


// KM-433 장차석 : 인증서기능추가(mobile)
var showCertifyMobile = {
    eventCheck : false,
    $onBtn : $('#showCertify .tit_certify'),
    $thumbCertify : $('#showCertify .thumb_certify'),
    $thumb : $('#showCertify .view_certify .thumbZoom'), // 썸네일이미지들
    $paging : $('#showCertify .page_certify .list'), // 페이징영역
    $sliderBtn : $('#showCertify .page_certify .btn'), // 페이징슬라이더버튼
    appAndroidCheck : false, // 안드로이드앱 체크
    init : function(check){
        var $self = this;
        if(check){
            $self.appAndroidCheck = true;
        }
        $self.pageMake();
        $self.$onBtn.on('click', function(e){
            e.preventDefault();
            if($self.eventCheck) return;
            $self.eventCheck = true;
            if($(this).parent().hasClass('on')){
                $(this).parent().removeClass('on');
                $self.$thumbCertify.stop().slideUp(function(){$self.eventCheck = false;});
            }else{
                $(this).parent().addClass('on');
                $self.$thumbCertify.stop().slideDown(function(){$self.eventCheck = false;});
            }
        });
    },
    pageMake : function(){
        var $self = this;

        function class_add(target){
            target.addClass('swiper-container');
            target.find('.inner_viewcertify').addClass('swiper-wrapper');
            target.find('.thumb').addClass('swiper-slide').height(target.height());
        }

        function call_swiper(name, target){
            class_add(name);

            var loopBoolean = true;
            var touchMoveCheck = true;

            if($self.appAndroidCheck){ // 안드로이드 체크
                touchMoveCheck = false;
            }
            if($self.$thumb.length === 1){ // 이미지가 1개만 있는경우
                touchMoveCheck = false;
                loopBoolean = false;
            }

            name = new Swiper(target, {
                allowTouchMove : touchMoveCheck,
                loop : loopBoolean,
                spaceBetween : 0, // 아이템간격
                pagination : {
                    el :'.count',
                    type :'fraction'
                },
                navigation : {
                    nextEl : '.btn_next',
                    prevEl : '.btn_prev',
                }
                // autoHeight : true
            });
        }

        call_swiper($('.view_certify'), '.view_certify');
        $self.$thumbCertify.css({display:'none'});
    }
}
// PC
var showCertify = {
    eventCheck : false,
    $onBtn : $('#showCertify .tit_certify'),
    $thumbCertify : $('#showCertify .thumb_certify'),
    $thumb : $('#showCertify .view_certify img'), // 썸네일이미지들
    $paging : $('#showCertify .page_certify .list'), // 페이징영역
    $sliderBtn : $('#showCertify .page_certify .btn'), // 페이징슬라이더버튼
    heightCheck : 0,
    pagingHeight : 0,
    oldCurrent : null, // 현재 노출되어진 이미지
    init : function(){
        var $self = this;
        $self.$onBtn.on('click', function(e){
            e.preventDefault();
            if($self.eventCheck) return;
            $self.eventCheck = true;
            if($(this).parent().hasClass('on')){
                $(this).parent().removeClass('on');
                $self.$thumbCertify.stop().slideUp(function(){$self.eventCheck = false;});
            }else{
                $(this).parent().addClass('on');
                $self.$thumbCertify.stop().slideDown(function(){$self.eventCheck = false;});
            }
        });
    },
    pageMake : function(){
        var $self = this;
        $self.$thumb.each(function(idx){
            $self.$paging.append('<li><a href="#none"><img src="' +  $(this).attr('src') + '" alt="검사서 작은 이미지"></a></li>');
            if($self.heightCheck < $self.$thumb.eq(idx).height()){
                $self.heightCheck = $self.$thumb.eq(idx).height();
            }
            if(idx === 0){
                $self.changeAction(idx);
            }
            // 페이징용카운팅
            var size = Math.floor( $self.$paging.find('li').eq(idx).height() ) - 1;
            var $linkPos = $self.$paging.find('li').eq(idx);
            $linkPos.find('a').height(size);
            $linkPos.attr('data-top', Math.floor($linkPos.position().top));
            $linkPos.attr('data-bottom', Math.floor($linkPos.data('top') + $linkPos.height()));
            $self.pagingHeight += ( size + 12 );
        });

        $self.$thumb.eq(0).parent().height($self.heightCheck);
        $self.$paging.parent().height($self.heightCheck+4);

        // 페이징버튼노출
        if($self.pagingHeight > $self.$paging.parent().height()){
            $self.pageSlider();
        }

        $self.$thumbCertify.css({display:'none'});

        $self.$paging.find('a').on('click', function(e){
            e.preventDefault();
            if($(this).parent().hasClass('on')) return;
            var idx = $(this).parent().index()
            $self.changeAction(idx);
        });
    },
    pageSlider : function(){ // 페이징 이전,다음버튼생성
        var $self = this;
        $self.$sliderBtn.show();
        var pageCount = 0; // 움직여야 하는 높이값
        var currentHeight = []; //현재높이값
        // 이동이 필요한 횟수
        var totalPageCount = Math.ceil($self.$paging.height() / $self.$paging.parent().height()) -1;
        var checkResult = []; // 각각의 Top값 저장
        currentHeight.push(4);
        for(var i = 0; i < totalPageCount; i++){
            if(i === 0){
                checkResult[i] = $self.$paging.parent().height()*(i+1);
            }else{
                checkResult[i] = (currentHeight[i]*-1) + $self.$paging.parent().height();
            }
            $self.$paging.find('li').each(function(){
                if(($(this).data('top') <= checkResult[i] && $(this).data('bottom') + 11 > checkResult[i])){
                    currentHeight.push( ($(this).data('top') - 4) * -1 );
                }
            });
        }

        $self.$sliderBtn.on('click', function(e){
            if($(this).hasClass('btn_prev')){
                pageCount--;
                if(pageCount < 0){
                    pageCount = 0;
                    return;
                }
            }else{
                pageCount++;
                if(pageCount > totalPageCount){
                    pageCount = totalPageCount;
                    return;
                }
            }
            $self.$paging.animate({
                top : currentHeight[pageCount]
            },200);
        });
    },
    changeAction : function(idx){
        var $self = this;

        if($self.oldCurrent !== null){
            $self.$thumb.eq($self.oldCurrent).addClass('off');
            $self.$thumb.eq($self.oldCurrent).parent().stop().animate({
                height : 0,
                opacity : 0
            },300);
        }

        $self.$thumb.eq(idx).removeClass('off');
        $self.$thumb.eq(idx).parent().stop().css({
            height : 0,
            opacity : 0
        }).animate({
            height : $self.$thumb.eq(idx).height(),
            opacity : 1
        },300);
        $self.oldCurrent = idx;
        $self.$paging.find('li.on').removeClass('on');
        $self.$paging.find('li').eq(idx).addClass('on');
    }
}
