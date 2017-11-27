<?php
header("Content-Type:application/json;charset=utf-8");
$pno=$_REQUEST["pno"];
if(!$pno){
	$pno=1;//默认显示第一页
}else{
	$pno=intval($pno);
}
//获取一页中记录条数12
$pageSize=$_REQUEST["pageSize"];
if(!$pageSize){
	$pageSize=12;//默认每页显示12条记录
}else{
	$pageSize=intval($pageSize);
}
$start=($pno-1)*$pageSize;
require_once("./00_init.php");
$sql="SELECT jid,series_id,title,price,comment_count,pic FROM dr_jewellry LIMIT $start,$pageSize";
$result = mysqli_query($conn, $sql);
$rows = mysqli_fetch_all($result,MYSQLI_ASSOC);

//获取指定页中的数据
$sql="SELECT COUNT(*) FROM dr_jewellry";
$result=mysqli_query($conn,$sql);
$row=mysqli_fetch_row($result);
$count=intval($row[0]);
//计算总页数
$pageCount=ceil($count/$pageSize);
$output = [
  'recordCount' => $count,     //满足条件的总记录数
  'pageSize' => $pageSize,        //每页大小，即每页最多可以显示的记录数量
  'pageCount' => $pageCount,       //总页数
  'pno' => $pno,          //当前数据所在页号
  'data' => $rows          //当前页中的数据
];
echo json_encode($output);

