<?php
//    session_start();
    header("Content-Type:application/json;charset=utf-8");
    require("../init.php");
    @$uid=$_REQUEST["uid"];
    @$jid=$_REQUEST["jid"];//商品编号————购物车表(jewellry_id)
    @$sql="DELETE FROM dr_shoppingcart_item WHERE user_id='$uid' AND jewellry_id=$jid";
    $result=mysqli_query($conn,$sql);
    $row=mysqli_affected_rows($conn);
    if($row>0){
        echo '{"code":1,"msg":"删除成功"}';
    }else{
        echo '{"code":-1,"msg":"删除失败 请重新确认信息"}';
    }
?>