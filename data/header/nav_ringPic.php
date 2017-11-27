<?php
    header("Content-Type:application/json;charset=uft-8");
    require("../init.php");
    @$sid = $_REQUEST["sid"];
    $sql = "SELECT sm FROM dr_jewellry_picsm WHERE jewellry_id = (SELECT jid FROM dr_jewellry WHERE series_id = $sid LIMIT 0,1) LIMIT 0,1";
    $result = mysqli_query($conn,$sql);
    $rows = mysqli_fetch_row($result);
    echo json_encode($rows);
?>