

(()=>{
	//定义一个获取对应产品的函数
	function series_pro(sid){
		$.ajax({
					type:"GET",
					url:"data/product/onclick.php",
					data:{sid:sid},
					success:function(data){
						//console.log(data[0].price,data.pic,data.title,data.comment_count);
						var html="";
						for(var x=0;x<data.length;x++){
						html+=`
						<li>
							<div class="sec_top">
								<a href="dr_product_list.html?jid=${data[x].jid}">
									<img src="${data[x].pic}">
								</a>
							</div>
							<div class="sec_bottom">
								<div class="price">¥${
								parseFloat(data[x].price).toFixed(2)}</div>
								<div class=title>${data[x].title}</div>
								<div class="sec_buy" id="add-cart">
									<div class="collection"><a href="#">收藏</a></div>
									<div class="purchase"><a href="#" class="btn-add-cart" data-jid="${data[x].jid}">加入购物车</a></div>
								</div>
								<div class="evlauate">评价:${data[x].comment_count}</div>
							</div>
						</li>	
						`
						}
						document.getElementById("pro_ul")
						.innerHTML=html;
					},
					error:function(){
						alert("网络故障 .请检查");
					}
				});
	}
	//系列引入，页面加载获取系列名
	ajax("get","data/product/series.php","")
		.then(ser=>{
			var series="";
			for(var j=0;j<ser.length;j++){
				var s=ser[j];
				series+=`
						<a href="dr_product_list.html" data-on="${s.sid}">
							${s.sname}
						</a>
				`
			}
			document.getElementById("series_es")
						.innerHTML=series;
			var elem=$("#series_es").find("a");

			//单击系列显示该系列商品
			var serShow=document.getElementById("series_es");
			serShow.onclick=e=>{
				e.preventDefault();
				var tar=e.target;
				var sid=tar.getAttribute("data-on");
				$("#sortall_right").css("opacity",0);
				$("#sortall_bottom").css("opacity",0);
				series_pro(sid);
			}
		});
	//点击更多显示全部系列
	var series=document.getElementById("gengduo");
	//console.log(series);
	series.onclick=e=>{
		e.preventDefault();
		if($("#gengduo").html()=="更多"){
			$("#gengduo").parent().css("height",95);
				$("#gengduo").text("收起");
		}else if($("#gengduo").html()=="收起"){
			$("#gengduo").parent().css("height",55);
				$("#gengduo").text("更多");
				$("#sortall_right").css("opacity",1);
				$("#sortall_bottom").css("opacity",1);
				loadProductByPage(1,12);
		}
	}
//商品引入
function loadProductByPage(pno,pageSize){
	var sid = location.href.split('=')[1];
	
	if(sid){
		series_pro(sid);
	}else{
		$.ajax({
			type:"GET",
			url:"data/product/product.php",
			data:{pno:pno,pageSize:pageSize},
			success:function(pager){
				var html="";
				var rows=pager.data;
				//console.log(pager);
				//console.log(rows);
				for(var i=0;i<rows.length;i++){
					var obj=rows[i];
					//console.log(obj);
					html+=
					`<li>
						<div class="sec_top" >
							<a href="dr_product_list.html?jid=${obj.jid}">
								<img src="${obj.pic}">
							</a>
						</div>
						<div class="sec_bottom">
							<div class="price">¥${
							parseFloat(obj.price).toFixed(2)}</div>
							<div class=title>${obj.title}</div>
							<div class="sec_buy" id="add-cart">
								<div class="collection"><a href="#">收藏</a></div>
								<div class="purchase"><a href="#" class="btn-add-cart" data-jid="${obj.jid}">加入购物车</a></div>
							</div>
							<div class="evlauate">评价:${obj.comment_count}</div>
						</div>
					</li>`;
				}
				$("#pro_ul").html(html);
				var html="";
				html+=`
					<div class="shangpin">共${pager.recordCount}件商品 ${pager.pno}/${pager.pageCount}页</div>`;
					if(pager.pno-1>0){
						html+=`<a href="${pager.pno-1}" data-prev="shang">&lt;</a>`;
					}
					if(pager.pno+1<=pager.pageCount){
						html+=`<a href="${pager.pno+1}" data-prev="xia">&gt;</a>`;
					}
					$("#sortall_right").html(html);
					$("#sortall_bottom").html(html);
									$("#sortall_right").on("click","a",function (e) {
											e.preventDefault();
											//console.log($(this).attr("data-prev"));
											if($(this).attr("data-prev")=="shang"){
													pno=pno-1;
											}else{
													pno=pno+1;
											}
											loadProductByPage(pno,12);
									});
									$("#sortall_bottom").on("click","a",function (e) {
											e.preventDefault();
										 // console.log($(this).attr("data-prev"));
											if($(this).attr("data-prev")=="shang"){
													pno=pno-1;
											}else{
													pno=pno+1;
											}
											loadProductByPage(pno,12);
									});
			},
			error:function () {
				alert("网络故障,请检查222");
			}
		});
	}
}
loadProductByPage(1,12);

})();




