$(()=>{


    $.ajax({
        url:'data/dr_std/dr_std.php',
        type:'get',
        success:function (data) {
            var html = '';
            for(var i=0;i<data.length;i++){
                var city = data[i][0].city;
                var detail = data[i][0].detail;
                html +=`<div class="shopListTitle">${city}</div>`;
                html += `<ul class="shopList fix clear">`;
                for(var j=0;j<detail.length;j++){
                    var item = detail[j];
                    html += `
                        <li class="shopInfo lf">
		                    <div class="shopInfo_top">
			                    <a href="#" class="hrefLink">
			                        <img src="${item.s_pic}" alt="" width="300" height="225">
			                    </a>
			                    <h4>${item.s_name.split('-')[0]+"-"+item.s_name.split('-')[1]}<i class="openSoon" style="display:none;">即将开业</i></h4>
			                </div>
			                <p><a href="#" class="title">${item.s_location}</a></p>
			                <p class="nomg"><i class="showMapBtn"></i>${item.s_name}</p>
			                <p class="haveLine" style="color:#C97D5A"><i></i><span>营业时间</span><i></i></p>
			                <span>${item.s_time}</span>
	    	                <p class="haveLine" style="color:#C97D5A"><i></i><span>预约电话</span><i></i></p>
	    	                <span>${item.s_tel}</span>
		                </li>
                    `;
                 };
                html+=`</ul></div>`;

            }
            $('.main').html(html);

            //动态生成下拉城市

        },
        err:function () {
            alert("网络错误请检查")
        }
    });
})
// 百度地图API功能
var map = new BMap.Map("mymap");    // 创建Map实例
map.centerAndZoom(new BMap.Point(116.404, 39.915), 11);  // 初始化地图,设置中心点坐标和地图级别
//添加地图类型控件
map.addControl(new BMap.MapTypeControl({
    mapTypes:[
        BMAP_NORMAL_MAP,
        BMAP_HYBRID_MAP
    ]}));
map.setCurrentCity("北京");          // 设置地图显示的城市 此项是必须设置的
map.enableScrollWheelZoom(true);     //开启鼠标滚轮缩放
var local = new BMap.LocalSearch(map, {
    renderOptions:{map: map}
});
local.search("DR钻戒门店");




// 搜索框查找地图
$('.searchBtn').click((e)=>{
    e.preventDefault();
    var input = $(e.target).prev().val();
    console.log(input);
    local.search("DR钻戒门店"+input);

})
