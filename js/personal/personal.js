//修改姓名
$(".sure").click(function(e){
	e.preventDefault();
	//var uname=user.name;
	var uname=$(".my_name").val();
	var user_name=$(".my_realname").val();
	//console.log(user.uname);
	$.ajax({
		type:"POST",
		url:"data/personal/personal.php",
		data:{uname:uname,user_name:user_name},
		success:function(data){
			if(uname==user.uname){
				if(data.code>0)
				alert("更改成功");
				else
					alert("更改失败");
			}else{
				alert ("会员昵称不正确");
			}
		},
		error:function(){
			alert("ajax失败");
		}
	});
});
//修改头像

	if(isLogin){
		uname=user.uname;
		getAvatar(uname);
		$(".upload").click(function(){
			getAvatar(uname);
			//location.href="personal.html";
		});
		
		(()=>{
			getAvatar(uname);
		})()
	}else{
		alert("登录后才能修改头像");
	}
	
	function getAvatar(uname){
			$.ajax({
				type:"POST",
				url:"data/personal/obtainUrl.php",
				data:{uname:uname},
				success:function(data){
					$(".awt").attr("src","data/personal/"+data[0]);
					},
				error:function(error){
					console.log(error);	
				}
			});
	}
	