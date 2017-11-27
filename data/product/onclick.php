<?php
header("Content-Type:application/json");
require_once("./init.php");
$sid=$_REQUEST["sid"];
$sql="SELECT jid,title,price,pic,comment_count FROM dr_jewellry WHERE series_id=$sid";
$je_id=sql_execute($sql);
echo json_encode($je_id);