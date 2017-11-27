(()=>{//淡入淡出轮播（定时器）
	function next(){
		var selImg=document.querySelector(".slider>a.show");//console.log(selImg);
		selImg.className="null";
		if(selImg.nextElementSibling)
		{
				selImg.nextElementSibling.className="show";//console.log(111);
				//console.log(selImg);
				//console.log(111);
		}else{
				selImg.parentNode.firstElementChild.className="show";//console.log(222);
				//console.log(222);
		}
	}
	next();
	//设置定时器 每隔1000ms执行一次next();
	var timer=setInterval(next,2000);
	//鼠标移入 时停止定时器 移出时启动定时器
	var selDiv=document.querySelector(".slider");
	selDiv.onmouseover=(e)=>{
			clearInterval(timer);//console.log(timer);
			timer=null;
	}
	selDiv.onmouseout=function(){
			timer=setInterval(next,2000);//console.log(timer);
	}
	//鼠标点击当前显示的图片时 弹出当前图片的alt值
	var selImgs=document.querySelectorAll(".slider img");
	//console.log(selImgs);
	for (let img of selImgs) {
			//console.log(img);
			img.onclick=function(){
					alert(this.alt);
			}
	}
})()