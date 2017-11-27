(()=>{
    var jid = location.search.split('=')[1];
    //加载商品
    $.ajax({
        type:"GET",
        url:"data/product/product_list.php?jid="+jid,
        data:{},
        success:function (pager) {
            //console.log(pager);
            var html="";
            $(".nav_name").text(pager[0]);
            html+=`
                <img src="${pager[1]}" id="img_a">
                <div id="superMask"></div>
                <div id="mask"></div>
            `;
            $(".img_big").html(html);

            var html="";
            html+=`
                <div class="shop_uname"><h1>${pager[0]}</h1></div>
            <!--商品价格-->
            <div class="shop_price">￥${pager[2]}</div>
            <!--商品卖出详情-->
            <ul class="shop_par">
                <li>
                    <span>近期售出:</span>
                    <i>${pager[4]}</i>
                </li>
                <li>
                    <span>评价:</span>
                    <i>${pager[3]}</i>
                </li>
                <li>
                    <a href="#">杭州</a>
                </li>
            </ul>
            <!--商品参数-->
            <ul class="shop_argument">
                <li>
                    <span>主钻重量:</span>
                    <i>${pager[5]}</i>
                </li>
                <li>
                    <span>钻石颜色:</span>
                    <i>${pager[6]}</i>
                </li>
                <li>
                    <span>钻石净度:</span>
                    <i>${pager[7]}</i>
                </li>
                
            </ul>
            <!--商品参数选择-->
            <div class="shop_select">
                <!--材料材质-->
                <div class="select_mat ">
                    <div class="title ">戒托材质</div>
                    <div class="caizhi abc ">
                        <a href="#">PT950</a>
                    </div>
                    <div class="active abc">
                        <a href="#">白18K金</a>
                    </div>
                    <span class="jieshao">本商品价格为单只戒指售价，材质调整后金额会自动调整。</span>
                </div>
                <!--搭配主钻-->
                <div class="select_coll">
                    <div class="dapei">搭配主钻</div>
                    <ul class="coll_set" id="coll_list">
                        <li class="abc ">
                            <a href="#">30分H色</a>
                        </li>
                        <li class="abc">
                            <a href="#">50分H色</a>
                        </li>
                        <li class="abc">
                            <a href="#">70分H色</a>
                        </li>
                        <li class="abc">
                            <a href="#">100分H色</a>
                        </li>
                    </ul>
                </div>
                <div class="shop_join">
                    <a href="#" data-jid="${jid}" id="add-cart" class="btn-add-cart">加入购物车</a>
                    <a href="#" data-jid="${jid}" class="btn-add-pay">立即购买</a>
                </div>
            <!--配送说明-->
            <div class="shop_explain">
                <span>配送说明:</span>
                <span>预计20个工作日送达（限大陆地区）,其它地区请咨询客服。</span>
            </div>
            <!--服务承诺-->
            <div class="shop_acc">
                <span>服务承诺:</span>
                <span>15天退换 全国包邮 终生保养</span>
            </div>
            `;
            $(".top_right").html(html);
            var html="";
            html+=`
                <li>净度:      <span>${pager[7]}</span>    </li>
                <li>系列名称： <span>${pager[0]}</span>    </li>
                <li>颜色:      <span>${pager[6]}</span>    </li>
            `;
            $("#guige").html(html);
        },
        error:function () {
            alert("一大堆错误");
        }
    });


	//选中变色
	//console.log($("body .compoier"));
	$("body .container ").on("click",".abc",function(e){
		e.preventDefault();
		//console.log(1);
		var tar=e.tatget;
		$(this).addClass("ddd");
		if($(this).hasClass("ddd")){
			$(this).siblings().removeClass("ddd");
		}
		
	});



    //加载商品参数规格
    $.ajax({
        type:"GET",
        url:"data/product/product_details.php?jid="+jid,
        data:{},
        success:function (output) {
            // console.log(output);
            var html="";
            html+=`
                <li>商品分类:  <span>${output[0]}</span>         </li>
                <li>产品编号:  <span>${output[1]}</span>           </li>
                <li>主石大小:  <span>${output[4]}</span>    </li>
                <li>戒托材质： <span>${output[2]}</span>          </li>
                <li>副石材质:  <span>${output[3]}</span>             </li>
                <li>副石数量:  <span>${output[7]}</span>               </li>
                <li>主石材质:  <span>钻石</span>             </li>
                <li>副石总重:  <span>${output[8]}</span>          </li>
                <li>主石数量:  <span>${output[5]}</span>                </li>
                <li>手寸:      <span>客订，手寸可改</span>   </li>
                <li>主石总重:  <span>${output[6]}</span>             </li>
                <li>副石形状:  <span>${output[9]}</span>             </li>
                <li>工艺:      <span>微镶、包镶、光金</span> </li>
                <li>参考尺寸:  <span>花头大小9.2mm*10.8mm 戒臂宽：2.5mm</span>    </li>
                <li>形状:      <span>${output[10]}</span>        </li>
            `;
            $("#guige_down").html(html);
        },
        error:function () {
            alert("参数规格出错了");
        }
    });
    //加载商品图片
    $.ajax({
        type:"GET",
        url:"data/product/product_img.php?jid="+jid,
        data:{},
        success:function (imgs) {
            //console.log(imgs);
            var html="";
            for(var i in imgs){
                html+=`
                    <li><a href="#"><img src="${imgs[i].sm}" alt=""></a></li>
                `;
            }
            $(".smile").html(html);
            //鼠标移入小图事件
            $(".smile").on("mouseover","li",function (e) {
                e.preventDefault();

                var mask=document.getElementById("mask");
                var superMask=document.getElementById("superMask");
                var largeDiv=document.getElementById("largeDiv");
                var MSIZE=200,SMSIZE=400;
                /*鼠标移入事件*/
                superMask.onmouseover=function(){
                    mask.style.display="block";
                    largeDiv.style.display="block";
                }
                /*鼠标移出事件*/
                superMask.onmouseout=function(){
                    mask.style.display="none";
                    largeDiv.style.display="none";
                }
                /*鼠标移动事件*/
                superMask.onmousemove=function(e){
                    var x=e.offsetX;
                    var y=e.offsetY;
                    var left=x-MSIZE/2;
                    var top=y-MSIZE/2;
                    if(left<0)
                        left=0;
                    else if(left>SMSIZE-MSIZE)
                        left=SMSIZE-MSIZE;
                    if(top<0)
                        top=0;
                    else if(top>SMSIZE-MSIZE)
                        top=SMSIZE-MSIZE;
                    mask.style.left=left+"px";
                    mask.style.top=top+"px";
                    largeDiv.style.backgroundPosition=`${-left*2/1}px ${-top*2/1}px`;
                }
                var tar=e.target;
                var mImg=document.getElementById("img_a");
                var largeDiv=document.getElementById("largeDiv");
                if(tar.nodeName=="IMG"){
                    //设置mImg的src为tar的src属性
                    mImg.src=tar.src;
                    largeDiv.style.backgroundImage=
                        `url(${tar.src})`;
                }

            });
        },
        error:function () {
            alert(" 加载图片出错了");
        }
    });
})()


