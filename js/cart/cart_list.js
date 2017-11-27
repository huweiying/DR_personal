//*********************************************
//点击事件 跳转至购物车页面
  //var uid=2;
if(isLogin){
    loadCart(user.uid);
}

//删除购物车列表中的商品
$("#cart-tbody").on("click",".car-del",function(e){
    e.preventDefault();
    //console.log(111);
    var jid=$(".car-del").attr("data-jid");
    //console.log(jid);
    $.ajax({
        type:"post",
        url:"data/cart/cart_del.php",
        data:{jid:jid,uid:user.uid},
        success:function(data){
            //console.log(data);
            if(data.code>0){
                alert("删除成功！");
                loadCart(user.uid);
            }
        },
        error:function(error){
            alert("网络故障，请检查！444");
            console.log(error);
        }
    });

});




//加载uid 用户的购物车列表
function loadCart(uid) {
    $.ajax({
        type: "post",
        url: "data/cart/cart_list.php",
        async: false,//同步请求
        data: {uid: uid},
        success: function (data) {
            //console.log(data);
            var html = "";
            var totalPrice = 0;//所选商品总价
            var cartCount = 0;
            for (var i = 0; i < data.length; i++) {
                //console.log(data[i]);
                html += `
                <tr class="cart-lists">
                    <td width="30px" class="padleft_20" valign="top">
                        <input type="checkbox" name="product" jid=${data[i].jewellry_id} value="${data[i].price}" checked="checked" class="cbox">
                    </td>
                    <td width="120px" valign="center" text-align="center">
                        <img src="${data[i].pic}" alt="" width="100" height="100">
                    </td>
                    <td width="280px" class="nopad_left border_dashed">
                        <strong>${data[i].title}</strong>
                        <strong>求婚钻戒</strong>
                    </td>
                    <td width="130px" class="nopad_left border_dashed">
                        <!--数量-->
                        
                        <strong>${data[i].count}</strong>
                        
                        <!--数量end-->
                    </td>
                    <td width="130px" class="nopad_left border_dashed"> 
                        <!--刻字-->
                        <span>备注信息</span>
                    </td>
                    <td width="160px" class="border_dashed pay_money" align="center">
                        <span>¥:${data[i].price}</span>
                    </td>

                    <td width="150px" class="border_dashed" align="center">
                        <a href="javascript:;" class="addCollect">
                            移入收藏夹
                        </a>
                        <br>
                        <a href="javascript:;" class="car-del" data-jid="${data[i].jewellry_id}">
                            删除
                        </a>
                    </td>
                </tr>`;
                //console.log(data[i].is_checked);
                cartCount += parseInt(data[i].count);
                totalPrice += parseFloat(data[i].price * data[i].count);
            }
            $("#cart-tbody").html(html);//商品列表
            $("#cart-amount strong").html(totalPrice);//商品总件数
            $("#cart-count strong").html(cartCount);//商品总价
        },
        error: function (error) {
            console.log(error);
        }
    });

}

function cartEval(){
    var price = 0;
    var count = 0;
    $("input[name='product']:checked").each(function () {
        price += eval($(this).val());
        count++;
    });
    $("#cart-amount strong").html(price);//商品总件数
    $("#cart-count strong").html(count);//商品总价
}
//如果修改选中状态，则修改商品选中数量 和总价
$("#cart-tbody").on("click","input[name='product']",function(){
    cartEval();
});

//全选
$('#checkall').click(function () {
    if($(this).attr('checked')){
        $(this).attr('checked',false);
        $("input[name='product']").prop('checked',false);
        cartEval();
    }else{
        $(this).attr('checked',true);
        $("input[name='product']").prop('checked',true);
        cartEval()
    }

});




