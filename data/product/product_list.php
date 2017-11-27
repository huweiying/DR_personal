<?php
header("Content-Type:application/json;charset=utf-8");
require_once("00_init.php");
$jid=$_REQUEST["jid"];
if($jid){
    $sql="SELECT title,pic,price,comment_count,sale_count,j_weight,j_color,j_clarity,j_cut";
    $sql .=" FROM dr_jewellry WHERE jid=$jid";
    $result=mysqli_query($conn,$sql);
    $row = mysqli_fetch_row($result);
    if(mysqli_error($conn)){
      echo mysqli_error($conn);
    }
    echo json_encode($row);
}