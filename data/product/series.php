<?php
header("Content-Type:application/json");
require_once("./init.php");
$sql="SELECT sid,sname FROM dr_series";
$ser=sql_execute($sql);
echo json_encode($ser);