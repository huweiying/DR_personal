function next(){
	var img=document.querySelector(".slider img.show");
	img.className="";
	if(img.nextElementSibling)
		img.nextElementSibling.className="show";
	else
		img.parentNode.firstElementChild.className="show";
}
//将next放入周期性定时器，设置间隔3s
var timer=setInterval(next,3500);
var ddd=document.querySelector(".slider");
ddd.onmouseover=function(){
	clearInterval(timer);
	timer=null;
}
ddd.onmouseout=function(){
	timer=setInterval(next,3500);
};
//验证账号密码是否输入
var unameIsOk=false;
var upwdIsOk=false;
$(".join-phone").on("blur","",function(e){
	e.preventDefault();
	var uname=$(".join-phone").val();
	//console.log(uname);
    if(uname==""){
        $(".span-uname").html("用户名不能为空!").css("color","red");
    }else{
	$.ajax({
		type:"POST",
		url:"data/join/checkUname.php",
		data:{uname:uname},
		success:function(data){
			//console.log(data);
			if(data.code>0){
                unameIsOk=true;
				//console.log(data.code);
				$(".span-uname").html("用户名可以使用").css("color","green");
			}else{
				unameIsOk=false;
				$(".span-uname").html("用户名已被占用!").css("color","red");
			}
		},
		error:function(){
			alert("出现错误，请检查1");
		}
	})
    }
});
$(".join-word").on("blur","",function(e){
	//e.preventDefault();
	var word=$(".join-word").val();
	if(word==""){
		//console.log($(this));
		upwdIsOk=false;
		$(".span-pwd").html("密码不能为空！");
	}else{
		upwdIsOk=true;
		$(".span-pwd").html("");
	}
});
$(".dj-f3-input").on("blur","",function(e){
	e.preventDefault();
	var code=$(".dj-f3-input").val();
	if(code==""){
        $(".span-code").html("请输入验证码!").css("color","red");
	}else{
	$.ajax({
		type:"POST",
		url:"data/join/checkCode_join.php",
		data:{code:code},
		success:function(data){
			//console.log(data);
			if(code==""){
				$(".span-code").html("请输入验证码!").css("color","red");
			}else{
				if(data.code<0){
				$(".span-code").html("验证码错误!").css("color","red");
				}else{
				$(".span-code").html("验证码正确!").css("color","green");
			};
			}
		},
		error:function(){
			alert("出现错误，请检查2");
		}
	})
	}
});
//console.log(code);

$(".showCode").click(function(e){
	e.preventDefault();
	$(".code").addClass("showit");
	$(".showCode").html("看不清,换一张");
	//console.log(1);

});
$(".showCode").click(function(){
	//console.log(2);
	$(".code").attr("src","data/join/code.php");
});
//点击 检查验证码 注册账号
$(".ok").click(function(e){
	e.preventDefault();
	var uname=$(".join-phone").val();
	var upwd=$(".join-word").val();
	var code=$(".dj-f3-input").val();
	//console.log(uname,upwd,code);
	//console.log(unameIsOk);
	if(unameIsOk){
		if(upwdIsOk){
			if(code!=""){
				$.ajax({
					type:"POST",
					url:"data/join/checkCode_join.php",
					data:{code:code,uname:uname,upwd:upwd},
					success:function(data){
						//console.log(data);
						if(data.code>0){
							//alert("注册成功");
							$(".mir").show();
							$(".five-seconds").html(`
						<p>注册成功</p>
						<br>
						<a href="login.html">去登陆</a>&nbsp;&nbsp;
					`);
						}else{
							$(".mir").show();
            $(".five-seconds").html(`
                <p>注册失败</p>
                <br>
                <a href="#" class="reset">关闭</a>
            `);
						}
					},
					error:function(){
						alert("网络故障，请检查3")
					}
				})
			}else{
				$(".mir").show();
            $(".five-seconds").html(`
                <p>请输入验证码</p>
                <br>
                <a href="#" class="reset">关闭</a>
            `);
			}
			}else{
			$(".mir").show();
            $(".five-seconds").html(`
                <p>请输入密码</p>
                <br>
                <a href="#" class="reset">关闭</a>
            `);
		}
			}else{
			//alert("注册失败请检查！");
			$(".mir").show();
            $(".five-seconds").html(`
                <p>注册失败请检查注册信息</p>
                <br>
                <a href="#" class="reset">关闭</a>
            `);
			}
		

});
