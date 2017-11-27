// 动态加载页面头部
$("header").load("header.html",()=>{
    //语言下拉框
    var uname = sessionStorage['uname'];
    if(uname){
        var html = `欢迎  ${uname}  <a class="logout">注销</a>`;
        //$('.dr_user').html(html);
        $('.logout').click((e)=>{
            sessionStorage['uname']='';
            location.href='index.html';
        })
    }
    $("#lang").hover(
        ()=>{
            $("#lang .dropdown-menu").addClass("hover");
        }
        ,
        ()=>{
            $("#lang .dropdown-menu").removeClass("hover");
        }
    );
    //全国店铺
    $(".allShop").mouseenter(e=>{
        $(e.target).addClass("hover");
        $(e.target).next().addClass("hover");
    })
    $(".allShop").mouseleave(e=>{
        $(e.target).removeClass("hover");
        $(e.target).next().removeClass("hover");
    })
    //下拉菜单导航显示
    $("nav>.container>ul>li").hover(
        function(){$(this).children("div").addClass("hover")}
        ,
        function(){$(this).children("div").removeClass("hover")}
    )
    // 下拉导航商品展示
    //求婚钻戒部分,动态加载系列名
    $.ajax({
        url:"data/header/nav_ring.php",
        type:"get",
        success:(data)=>{
            //console.log(data);
            var html = "";
            for(var i =0;i<5;i++){
                var d = data[i];
                html+=`<li><a href="dr_products.html?sid=${d.sid}" data-sid="${d.sid}">${d.sname}</a></li>`
            }
            $("#ring ul.rf").html(html);
            var html = "";
            for(var i =5;i<10;i++){
                var d = data[i];
                html+=`<li><a href="dr_products.html?sid=${d.sid}" data-sid="${d.sid}">${d.sname}</a></li>`
            }
            $("#ring ul.lf").html(html);


            // 动态加载图片
            $("#ring").on("mouseover","a",(e)=>{
                sid = $(e.target).data("sid");
                $.ajax({
                    url:"data/header/nav_ringPic.php?sid="+sid,
                    type:"get",
                    success:(data)=>{
                        $(e.target).parents("ul").siblings(".ring_show").find("img")
                            .attr("src",data[0]);
                    }
                })
            })
        },
        error:()=>{
            alert("网络故障请检查");
        }
    })
    // 爱的礼物部分 动态加载图片
    $.ajax({
        url:"data/header/nav_gift.php",
        type:"get",
        success:(data)=>{
            var html = "";
            for(var i =0;i<5;i++){
                var d = data[i];
                html+=`<li><a href="javascript:" data-gid="${d.gid}">${d.title}</a></li>`
            }
            $("#gift ul.rf").html(html);
            var html = "";
            for(var i =5;i<9;i++){
                var d = data[i];
                html+=`<li><a href="javascript:" data-gid="${d.gid}">${d.title}</a></li>`
            }
            html+=`<li><a href="javascript:">查看全部商品</a></li>`;
            $("#gift ul.lf").html(html);

            // 动态加载图片
            $("#gift").on("mouseover","a",(e)=>{
                gid = $(e.target).data("gid");
                for(var i = 0 ;i<data.length;i++){
                    if(gid == data[i].gid){
                        $(e.target).parents("ul").siblings(".ring_show").find("img")
                            .attr("src",data[i].img);
                    }
                }
            })
        },
        error:()=>{
            alert("网络故障请检查");
        }
    })
    //右边浮动框鼠标移入事件
    $(".dr_service").on("mouseover","ul>li>a",(e)=>{
        $(e.target).parent().addClass("hover").siblings().removeClass("hover");

    })
    $(".dr_service").on("mouseout","ul>li>a",(e)=>{
        $(e.target).parent().removeClass("hover")
    })
    $(".quick_item").mouseenter(function(){
        //console.log(this);
        $(this).find("div").addClass("hover");
    })

    $(".quick_item").mouseleave(function(){
        //console.log(this);
        $(this).find("div").removeClass("hover");
    })
     $(".dr_service>ul>li:last-child").on("click","a",(e)=>{
        e.preventDefault();
        var y = document.body.scrollTop;
        $("html,body").animate({
            scrollTop:0
        },300)
    })
    // 右侧浮动框鼠标滚动事件
    $(window).scroll( function() {
        if (document.body.scrollTop > 150) {
            $('nav').addClass('fixed');
            if (document.body.scrollTop > 800) {
                $("#dr_quickService").slideDown(200);
                $(".online_box>p").addClass('animated bounceInRight');
            } else {
                $("#dr_quickService").slideUp(200)
                $(".online_box").addClass("hover");
            }
        } else {
            $('nav').removeClass('fixed');
        }
    });

    $(".dr_quickService").mouseenter(()=>{$(".online_box").removeClass("hover");})

});

//判断是否登录
var isLogin = false;
var user={};//{uname:uname,uid:uid}
$.ajax({
    type:"post",
    url:"data/login/isLogin.php",
    async:false,//同步请求
    success:function(data){
        //console.log(data);
        if(data.code){
            isLogin = true;
            user=data.data;
        }
    },
    error:function(error){
        alert("网络故障 请检查！！！111");
        console.log(error);
    }
});
//登陆后 才可查看购物车
$(document).ready(function(){

    if(isLogin) {
        //已经登录显示用户名
        $(".dr_header .dr_user").html(`
        <a href="personal.html" >欢迎你: ${user.uname}</a>
        `);
        $(".btn-login").html(`<span id="btn-exit"><a>退出登录</a></span>`);
        //退出登录按钮
        $('#btn-exit').click(function () {
            $.ajax({
                type:'get',
                url:'data/login/logout.php',
                success:function () {
                    //跳转至首页
                    location.href="index.html";
                },
                error:function (err) {
                    alert('退出失败');
                }
            })
        });
    }
    $("#myCart").click(function(e){
        e.preventDefault();
        //console.log(111);
        if(isLogin){
            location.href="dr_cart.html";
        }else{
            //console.log($(".five-seconds"));
            $(".mir").show();
            $(".five-seconds").html(`
                <p>登录之后才能查看购物车</p>
                <br>
                <a href="login.html">去登陆</a>
            `);
        }
    });
    //取消按钮
    $("body").on("click",".reset",function(){
        $(".mir").hide();
    });

});

