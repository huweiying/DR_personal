<?php
session_start();
header("Content-Type:application/json;charset=utf8");
require_once("init.php");
@$uname=$_REQUEST["uname"];
@$upwd=$_REQUEST["upwd"];
@$ucode=$_REQUEST["code"];
$sql="SELECT * FROM dr_user WHERE uname='$uname'";
$result=mysqli_query($conn,$sql);
$row=mysqli_fetch_row($result);
if(count($row)){
    echo '{"code":-1,"msg":"用户名已被占用"}';
}else{
    echo '{"code":1,"msg":"用户名可用"}';
}
