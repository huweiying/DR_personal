//*********************************************
//点击事件 跳转至购物车页面
  //var uid=2;


//按钮：加入购物车——向购物车添加商品
$("body").on("click",".btn-add-cart",function(e){
    e.preventDefault();

    var jid=$(this).attr("data-jid");
    //判断是否登录 若已登录 则调用 addCart(uid);
    if(isLogin){
        //console.log(user.uid,jid);
        addCart(user.uid,jid);
    }else{
        $(".mir").show();
        $(".five-seconds").html(`
                <p>未登录,登陆后才能购买哟~</p>
                <br>
                <a href="login.html">去登陆</a>&nbsp;&nbsp;
                <a href="#" class="reset">取消</a>
            `);
        //window.location.href="login.html";
    }

});
//按钮：立即购买——添加至购物车，跳转至购物车页面
$("body").on("click",".btn-add-pay",function(e){
    e.preventDefault();

    var jid=$(this).attr("data-jid");
    //判断是否登录 若已登录 则调用 addCart(uid);
    if(isLogin){
        addCart(user.uid,jid);
        location.href="dr_cart.html";
    }else{
        $(".mir").show(300);
        $(".five-seconds").html(`
                <p>未登录,登陆后才能购买哟~</p>
                <br>
                <a href="login.html">去登陆</a>&nbsp;&nbsp;
                <a href="#" class="reset">取消</a>
            `);
        //window.location.href="login.html";
    }

});


function addCart(uid,jid){
    //console.log("开始向购物车添加商品111");
    //console.log(jid);
    $.ajax({
        type:"post",
        url:"data/cart/cart_add.php",
        data:{uid:uid,jid:jid},
        success:function(data){
            if(data.code>0){
                $(".mir").show(200);
                $(".five-seconds").html(`
                <p>添加成功</p>
                <a href="dr_cart.html">去结算</a>&nbsp;&nbsp;
                <a href="#" class="reset">取消</a>
            `);
            }else{
                //alert(data.msg);
                //alert("该商品已添加购物车，请先前往结算");
                $(".mir").show();
                $(".five-seconds").html(`
                <p>该商品已添加购物车，请先前往结算</p>
                <a href="dr_cart.html">去结算</a>&nbsp;&nbsp;
                <a href="#" class="reset">取消</a>
            `);
            }
        },
        error:function(error){
            console.log(error);
        }
    });
}





