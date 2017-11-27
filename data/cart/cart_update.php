<?php
    header("Content-Type:application/json;charset=utf-8");
    require("../init.php");
    @$lid=$_REQUEST["lid"];
    if($lid){
        $sql="SELECT * FROM dr_jewellry WHERE jid=$jid";
        $result=mysqli_query($conn,$sql);

    }

?>