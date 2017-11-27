$(()=>{
    /**
     * 广告轮播展示
      */
    // 1：定时器控制图片
    var timer  = null;
    function banner_show(){
        timer = setTimeout(()=>{
            if ($(".dr_bannerul .show").next().is("li")) {
                $(".dr_bannerul .show").removeClass("show").next().addClass("show");
            } else {
                $(".dr_bannerul .show").removeClass("show").siblings().first().addClass("show");
            }
            banner_show();
        },3000);

    }
    banner_show();
    $(".banner").mouseenter(()=>{
        $(".banner>.btn_right").addClass("hover");
        $(".banner>.btn_left").addClass("hover");
        clearTimeout(timer);
        timer = null;
    })
    $(".banner").mouseleave(()=>{
        $(".banner>.btn_right").removeClass("hover");
        $(".banner>.btn_left").removeClass("hover");
        banner_show();
    })

    // 左右按钮切换背景图
    $(".banner>.btn_right").click(()=>{
        if ($(".dr_bannerul .show").next().is("li")) {
            $(".dr_bannerul .show").removeClass("show").next().addClass("show");
        } else {
            $(".dr_bannerul .show").removeClass("show").siblings().first().addClass("show");
        }
    })
    $(".banner>.btn_left").click(()=>{
        if ($(".dr_bannerul .show").prev().is("li")) {
            $(".dr_bannerul .show").removeClass("show").prev().addClass("show");
        } else {
            $(".dr_bannerul .show").removeClass("show").siblings().last().addClass("show");
        }
    })
    //爱的礼物切换背景图部分
    $(".gift_nav").on("mouseover","li>a",(e)=>{
        var i = $(e.target).attr("href")[1];
        $(".gift_body>ul>li:eq("+i+")").addClass("hover").siblings(".hover").removeClass("hover");
        console.log();
    })

    $(window).scroll( function() {
        if(document.body.scrollTop > 1800) {
            $(".dr_new").slideDown(500);
        }else{
            $(".dr_new").slideUp(500);
        }
    } );

})

