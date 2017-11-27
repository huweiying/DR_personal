<?php
header("Content:application/json;charset=utf8");
require_once("./00_init.php");
$jid=$_REQUEST["jid"];
$sql="SELECT sm FROM dr_jewellry_picsm WHERE jewellry_id=$jid";
$result=mysqli_query($conn,$sql);
$rows=mysqli_fetch_all($result,1);
echo json_encode($rows);