<?php
//session_start();
require("../init.php");
header("Content-Type:application/json;charset=utf8");
@$uname=$_REQUEST["uname"];
@$upwd=$_REQUEST["upwd"];
@$code=$_REQUEST["code"];
if(strtolower($code)==strtolower($_SESSION["code"])){
	//echo '{"code":3,"msg":"验证码正确"}';
    $sql_push="INSERT INTO dr_user(uname,upwd,avatar) value('$uname','$upwd','img/avatar/default.png')";
    $result=mysqli_query($conn,$sql_push);
    $rows=mysqli_affected_rows($conn);
    if($rows>0){
        echo '{"code":1,"msg":"注册成功"}';
    }else{
        echo '{"code":-1,"msg":"注册失败"}';
    }
}else{
	echo '{"code":-2,"msg":"验证码输入有误！"}';
}