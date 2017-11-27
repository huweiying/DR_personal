<?php
session_start();
header("Content-Type:application/json;charset=utf8");
require_once("init.php");
//@$uname=$_SESSION["uname"];
$uname='dingding';
$sql="select avatar from dr_user where uname='$uname'";
$result=mysqli_query($conn,$sql);
$row=mysqli_fetch_assoc($result);
var_dump($row);