<?php
    header("Content-Type:application/json;charset=utf-8");
    require("../init.php");

    $sql = "SELECT * FROM dr_nav_gifts";
    $result = mysqli_query($conn,$sql);
    $rows = mysqli_fetch_All($result,1);
    echo json_encode($rows);
?>