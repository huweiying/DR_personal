<?php
session_start();
header("Content-Type:application/json;charset=utf-8");
require_once("init.php");

@$uid=$_SESSION["uid"];
if($uid){
  $sql="select uname from dr_user where uid=$uid";
  $result=sql_execute($sql);
  $uname=$result[0]["uname"];
  echo
    //'{"code":1,"msg":"已登录","data":{"uname":"'. $uname.'","uid": '. $uid . '}}';
    json_encode(["code"=>1,"msg"=>"已登录","data"=>["uname"=>$uname,"uid"=>$uid]],JSON_UNESCAPED_UNICODE);
}else{
  echo '{"code":0,"msg":"未登录","data":{"uname":"","uid":""}}';
}