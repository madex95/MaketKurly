// 교환 및 환불 안내
window.addEventListener('load', function () {
    var fetchExchangeData = false;
    var jsonURL = 'https://res.kurly.com/json/goods/exchangeRefundPolicy_v4.json';
    var $infoTitles = $('.happy_center .asked');
    var $infoDesc = $('.happy_faq .questions');

    $infoTitles.click(function(e){
        e.preventDefault();
        var $targetParent = $(this).closest('.happy_center');
        var $targetText = $(this).find('.txt');

        var toggleInfo = function () {
            $targetParent.toggleClass('on');
            if($targetParent.hasClass('on')){
                $targetText.text($targetText.data('close'));
            }else{
                $targetText.text($targetText.data('open'));
            }
        }

        if(fetchExchangeData === false) {
            axios.get(jsonURL)
            .then(function(response) {
                var arrData = response.data;
                var j, dataLen = arrData.length;
                $infoDesc.each(function(){
                    for(j = 0; j < dataLen; j++){
                        if($(this).attr('id') === arrData[j].tag){
                            $(this).html(arrData[j].desc);
                        }
                    }
                });
                toggleInfo();
                fetchExchangeData = true;
            })
            .catch(function(err) {
                console.log(err);
            });
        }
        else {
            toggleInfo();
        }
    });
    $infoTitles.click();
}, false);
