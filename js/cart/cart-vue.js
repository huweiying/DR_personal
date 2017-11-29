/**
 * Created by web-01 on 2017/11/27.
 */
new Vue({
    el:"#app",
    data:{
        total:0,
        uid:-1,
        plist:[],
        checkAll:false,
        total:0
    },
    filters:{
        forMoney:function (value) {
            return "¥"+value;
        }
    },
    mounted:function () {
        this.getuid();

    },
    methods:{
        getuid:function () {
            var url = "http://localhost/DR0.1.4.2/data/login/isLogin.php";
            this.$http.get(url).then(
                function (data) {
                    this.uid = data.body.data.uid;
                    this.cartinit();

                }
            );
        },
        cartinit:function(){
            var url = "http://localhost/DR0.1.4.2/data/cart/cart_list.php?uid="+this.uid;
            this.$http.get(url).then(
                function (data) {
                    this.plist = data.body;
                    console.log(this.plist);
                }
            )
        },
        deletePro:  function (p) {
            var jid = p.jewellry_id;
            var uid = p.user_id;
            var url = "http://localhost/DR0.1.4.2/data/cart/cart_del.php?uid="+uid+"&jid="+jid;
            console.log(url);
            this.$http.get(url).then(
                function (data) {
                    if(data.body.code == 1){
                        this.cartinit();
                    }
                }
            )
        },
        checkall:   function () {
            this.checkAll = !this.checkAll;
            var _this = this;
            if(this.checkAll){
                this.plist.forEach(function (p,i) {
                    if(typeof p.checked == 'undefined'){
                        _this.$set(p,'checked',true);
                    }else{
                        p.checked = !p.checked;
                    }
                })
            }else{
                this.plist.forEach(function (p,i) {
                    p.checked = !p.checked;
                })
            }
            this.totalMoneny();
        },
        checked: function (p) {
            if(typeof p.checked == 'undefined'){
                this.$set(p,'checked',true);
            }else{
                p.checked = !p.checked;
                if(!p.checked){
                    this.checkAll = false;
                }
            }
            this.totalMoneny();
        },
        totalMoneny:function () {
            this.total = 0;
            var _this = this;
            this.plist.forEach(function (p,i) {
                if(p.checked){
                    _this.total += Number(p.price);
                }
            });
        }
    }

});
