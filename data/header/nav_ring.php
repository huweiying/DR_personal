<?php
    header("Content-Type:application/json;charset=uft-8");
    require("../init.php");

    $sql = "SELECT * FROM dr_series";
    $result = mysqli_query($conn,$sql);
    $rows = mysqli_fetch_All($result,1);
    echo json_encode($rows);
?>