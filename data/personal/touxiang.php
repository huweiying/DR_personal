<?php
session_start();
header("Content-Type:application/json;charset=utf8");
require("init.php");
//1:判断是否上传成功如果$_FILES为null上传失败
$rs=empty($_FILES);
if($rs==true){
	die('{"code":-1,"msg":"没有上传文件请检查"}');
}
//2:获取文件名 mypic上传文件参数名称
//3:获取文件大小 name文件名 size 文件大小（单位字节）
$picname=$_FILES["mypic"]["name"];
$picsize=$_FILES["mypic"]["size"];
//4:文件超过2MB不允许上传
if($picsize>2*1024*1024){
	die('{code":-2,"msg":"上传文件过大 2MB"}');
}
//5:获取上传文件名后缀
//6:通过后缀判断文件类型.jpg .png .gif .avi .mp4 
$type=strstr($picname,".");//用.来拆分
//8:如果不是图片视频类禁止上传
if($type!=".gif"&&$type!=".jpg"
&&$type!=".png"){
	die('{"code":-3,"msg":"上传文件格式不正确"}');
}else{
	//9创建新文件名 time().rand(1,9999).$type,防止文件重名;
	$fileName=time().rand(1,9999).$type;
	//10:上传(将临时文件移动到uploads目录下即可)
	$src=$_FILES["mypic"]["tmp_name"];
	$des="uploads/".$fileName;
	//$uname="dingding";
	@$uname=$_SESSION["uname"];
	$sql="update dr_user set avatar='$des' where uname='$uname'";
	$result=mysqli_query($conn,$sql);
	$row=mysqli_affected_rows($conn);
	if($row>0){
		move_uploaded_file($src,$des);
		echo '{"code":1,"msg":"上传成功"}';
	}else{
		echo '{"code":-1,"msg":"上传未成功"}';
	}
}