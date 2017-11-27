<?php
header("Content-Type:application/json;charset=utf8");
require_once("init.php");
@$uname=$_REQUEST["uname"];
@$user_name=$_REQUEST["user_name"];
$sql="update dr_user set user_name='$user_name' where uname='$uname'";
$result=mysqli_query($conn,$sql);
$row=mysqli_affected_rows($conn);
if($result&&$row>0){
	echo '{"code":1,"msg":"更改成功"}';
}else{
	echo '{"code":-1,"msg":"更改失败"}';
}
