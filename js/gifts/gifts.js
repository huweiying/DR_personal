function a(){
		var date=new Date();
		var h=date.getHours()+'时';
		var m=date.getMinutes()+'分';
		var s=date.getSeconds()+'秒';
		$("p.sr-f2").html(h+m+s);
	}
	a();
	setInterval(a,1000);