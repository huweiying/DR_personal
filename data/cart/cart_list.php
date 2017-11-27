<?php
    header("Content-Type:application/json;charset=utf-8");
    require("../init.php");
    //@$uid=$_SESSION["uid"];
    @$uid=$_REQUEST["uid"];

    $sql="SELECT j.pic,j.price,j.title,c.user_id,
        c.jewellry_id,c.count,c.is_checked FROM dr_shoppingcart_item c,dr_jewellry j
        WHERE c.user_id=$uid AND j.jid=c.jewellry_id
        GROUP BY c.jewellry_id";
    $result=mysqli_query($conn,$sql);
    $rows=mysqli_fetch_all($result,MYSQLI_ASSOC);
    //var_dump($rows);
    echo json_encode($rows);
?>