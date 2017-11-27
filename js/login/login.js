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
$(".uname").val(localStorage['uname']);
$(".upwd").val(localStorage['upwd']);
$(".denglu").click(function(e){
	e.preventDefault();
	var u= $(".uname").val();
	var p=$(".upwd").val();
	console.log(u,p);
	$.ajax({
		type:"POST",
		url:"data/login/login.php",
		data:{uname:u,upwd:p},
		success:function(data){
			if(data.code>0)
			{	
				sessionStorage['uname'] = u;
				if(!localStorage['uname']){
                    $('.model').fadeIn(200);
                }else{
                    location.href="index.html";
				}

				 //location.href="index.html";
			}else{
				alert("账号或密码错误");
			};
		},
		error:function(){
			alert("出现错误，请检查");
		}
	});
    // 绑定按钮事件
    $('.rem_upwd').on('click',"[data-btn='true']",(e)=>{
        localStorage['uname'] = u;
        localStorage['upwd'] = p;
        location.href="index.html";
    });
    $('.rem_upwd').on('click',"[data-btn='false']",(e)=>{
    	localStorage.clear();
        location.href="index.html";
    });
});
