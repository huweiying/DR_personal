<?php
header("Content-Type:application/json;charset=utf-8");
require_once("00_init.php");
$jid=$_REQUEST["jid"];
$sql="SELECT class,No,ring_m,mainring_m,mainring_s,mainring_c,";
$sql .= " mainring_w,vicering_c,vicering_w,vicering_s,shape FROM dr_jewellry_detail";
$sql .= " WHERE did=$jid";
$result=mysqli_query($conn,$sql);
$row=mysqli_fetch_row($result);
if(mysqli_error($conn)){
      echo mysqli_error($conn);
    }
echo json_encode($row);