<?php                       //?uid=1&jid=1
    header("Content-Type:application/json;charset=utf-8");
    require("../init.php");

    @$jid=$_REQUEST["jid"];//商品编号————购物车表(jewellry_id)
    @$uid=$_REQUEST["uid"];
    @$count=$_REQUEST["count"];

    //设置参数默认值
    if(!$count){$count=1;}

    $sql_has="select count(*) from dr_shoppingcart_item where jewellry_id=$jid and user_id=$uid";
    $sql_insert="INSERT INTO dr_shoppingcart_item VALUES(null,$uid,$jid,$count,1)";
    // $sql_update="UPDATE dr_shoppingcart_item SET count=count+1 WHERE user_id=$uid AND jewellry_id=$jid";
    $sum = sql_execute($sql_has)[0]["count(*)"];
    //var_dump($sum["count(*)"]);
    //var_dump($sum==0);
    if($sum == 0){
        //sql_execute($sql_update);
        sql_execute($sql_insert);
        echo '{"code":1,"msg":"商品已添加"}';
    }else{
        echo '{"code":0,"msg":"此商品每次只能购买一件！"}';
    }
?>