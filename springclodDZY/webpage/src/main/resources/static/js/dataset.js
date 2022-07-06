
// 创建vue实例
var vm = new Vue({
    el: "#app",
    data:{
        searchValue:"",
        isSearch:false,
        searchList:["01","02","03"],
        isChange:true,
        isSearchPage:false,
        value:"",
        details:{
            index:0,
            id:"100001",
            content:"商品详情"
        },
        isDetails:false,
        isAdd:false,
        goods:{},
        isShow:false,
        page:1,
        totalPage:1,
        selectionTip:"全选",
        list:[],
        delList:[],
        editList:[],
        objResult:{},
        typeList:[],
    },
    methods:{
        test(e){
            // import Qs from 'qs'
            console.log("axios");
            //配置 baseURL
            axios.defaults.baseURL = 'http://127.0.0.1:10010';
            let user={username: 'admin',password: 'admin'};
            axios({
                //请求方法
                method : 'post',
                //url
                url: '/api/test',
                //url参数
                // params: {
                //     vip:10,
                //     level:30
                // },
                //头信息
                headers: {
                    'Content-Type': "application/json;charset=UTF-8"
                },
                //请求体参数
                data: JSON.stringify(user),
            }).then(response=>{
                //状态码
                console.log(response.status);
                //响应体
                console.log(response.data);
            }).catch(error=>{
                console.log("请求失败");
            })
        },
        prevPage(){
            this.page--
            if(!this.isSearchPage){
                this.cancelChecked()
            }else{
                this.getFindGoods(this.page,this.value)
            }
        },
        nextPage(){
            this.page++
            if(!this.isSearchPage){
                this.cancelChecked()
            }else{
                this.getFindGoods(this.page,this.value)
            }
        },
        del(){
            console.log("删除");
            // console.log(this.delList);
            let ids=[]
            for(let i=0;i<this.delList.length;i++){
                ids.push(this.delList[i].gid);
            }
            console.log(ids);
            $.ajax({
                url:"http://localhost:10010/feign/deleteGoods",
                data: JSON.stringify(ids),
                type: 'post',
                dataType: 'json',
                contentType:"application/json;charset=UTF-8",
                async:false,
                success: function(data){
                    console.log(data);
                },
                error: function(res){
                    console.log('出错啦!!');
                },
                timeout: 2000,
            })
            this.cancelChecked()
            this.isShow=true
        },
        // showAddGoods(){
        //     this.isAdd=true
        // },
        viewDetails(i){
            // console.log(this.list[i]);
            this.details.index=i
            this.details.id=this.list[i].gid
            this.details.content=this.list[i].details
            // console.log(this.details);
            this.isDetails=true
        },
        changeDetails(){
            let i=this.details.index
            this.list[i].details=this.details.content
            this.editor(i)
            // console.log(this.list[i])
        },
        enableEdition(){
            this.isShow=true
        },
        checked(e){
            // console.log(e.index);
            let index=e.index
            for(let i=0;i<this.delList.length;i++){
                if(this.list[index]==this.delList[i]){
                    this.delList.splice(i,1)
                    if(this.delList.length!=this.list.length){
                        this.selectionTip="全选"
                    }
                    return ;
                }
            }
            this.delList.push(this.list[index])
            if(this.delList.length==this.list.length){
                this.selectionTip="取消全选"
            }

            console.log(this.delList);
        },
        allChecked(e){
            // console.log(e);
            let tip=this.selectionTip;
            let checkboxList=document.getElementsByName("checkbox");
            if(tip=="全选"){
                this.selectionTip="取消全选";
                this.delList=this.list.slice(0,this.list.length);
                for(let i=0;i<checkboxList.length;i++){
                    checkboxList[i].checked=true;
                }
                console.log(this.delList);
            }else{
                this.selectionTip="全选";
                this.delList=[];
                console.log(this.delList);
                for(let i=0;i<checkboxList.length;i++){
                    checkboxList[i].checked=false;
                }
            }
        },
        cancelChecked(){
            // console.log(e);
            let checkboxList=document.getElementsByName("checkbox");
            for(let i=0;i<checkboxList.length;i++){
                checkboxList[i].checked=false;
            }
            this.delList=[];
            this.selectionTip="全选"
            this.isShow=false
            let page=this.page
            if(!this.isSearchPage){
                this.getGoods(page)
            }else{
                this.getFindGoods(page,this.value)
            }

        },
        editor(index){
            let goos={}
            this.setEditDate(index)
            goods=this.list[index]
            console.log(goods);
            this.updateGoods(goods)
        },
        editDate(index){
            let goos={}
            goods=this.list[index]
            console.log(goods);
            this.updateGoods(goods)
        },
        updateGoods(goods){
            $.ajax({
                url:"http://localhost:10010/feign/updateGoods",
                data: JSON.stringify(goods),
                type: 'post',
                dataType: 'text',
                contentType:"application/json;charset=UTF-8",
                async:false,
                success: function(data){
                    console.log(data);
                },
                error: function(res){
                    console.log('出错啦!!');
                },
                timeout: 2000,
            })
        },
        setEditDate(i){
            let date=new Date()
            let month=date.getMonth()+1
            let day=date.getDate()
            if(month<10)
                month="0"+month
            if(day<10)
                day="0"+day
            this.list[i].editdate=date.getFullYear()+"-"+month+"-"+day
        },
        allSeleted(){
            let s=document.getElementsByName("typeName")
            let list=this.list.slice(0,this.list.length)
            for(let i=0;i<s.length;i++){
                s[i].selectedIndex=list[i].type-1
            }
        },
        getGoods(page){
            var obj={
                page:page,
                totalPage:1,
                goodsList:[]
            };
            $.ajax({
                //url
                url:"http://localhost:10010/feign/getGoods",
                //参数
                data: "page="+page,
                //请求类型
                type: 'get',
                //响应体结果
                dataType: 'json',
                // 请求的格式
                contentType:"application/json;charset=UTF-8",
                //关闭异步，开启同步
                async:false,
                //成功的回调
                success: function(data){
                    // var a=JSON.parse(data)
                    obj=data;
                    console.log(data);
                },
                //失败的回调
                error: function(res){
                    // console.log(res);
                    console.log('出错啦!!');
                },
                //超时时间
                timeout: 2000,
            })
            //设置参数
            this.list=obj.goodsList
            this.page=obj.page
            this.totalPage=obj.totalPage
        },
        getAllType(){
            var list=[];
            $.ajax({
                //url
                url:"http://localhost:10010/feign/getAllType",
                //参数
                data: "",
                //请求类型
                type: 'get',
                //响应体结果
                dataType: 'json',
                // 请求的格式
                contentType:"application/json;charset=UTF-8",
                //关闭异步，开启同步
                async:false,
                //成功的回调
                success: function(data){
                    // var a=JSON.parse(data)
                    list=data;
                    console.log(data);
                },
                //失败的回调
                error: function(res){
                    // console.log(res);
                    console.log('出错啦!!');
                },
                //超时时间
                timeout: 2000,
            })
            this.typeList=list
        },
        addGoods(){
            let goods=this.goods
            if(goods.name.trim()==""){
                alert("商品名称不能为空或者全为空格");
                return ;
            }
            $.ajax({
                url:"http://localhost:10010/feign/addGoods",
                data: JSON.stringify(goods),
                type: 'post',
                dataType: 'text',
                contentType:"application/json;charset=UTF-8",
                async:false,
                success: function(data){
                    console.log(data);
                },
                error: function(res){
                    console.log('出错啦!!');
                },
                timeout: 2000,
            })
            this.setGoodsIsEmpty()
            this.getGoods(this.page)
        },
        closeAddGoods(){
            this.isAdd=false
            this.setGoodsIsEmpty()
            console.log("关闭");
        },
        setGoodsIsEmpty(){
            let date=new Date()
            let month=date.getMonth()+1
            let day=date.getDate()
            if(month<10)
                month="0"+month
            if(day<10)
                day="0"+day
            let time=date.getFullYear()+"-"+month+"-"+day
            this.goods={
                gid:"100001",
                name:"",
                type:4,
                details:"",
                intro:"",
                initdate:time,
                editdate:time,
            }
        },
        searchGoods(val){
            let value=""
            // console.log(typeof(val));
            console.log("searchGoods");
            if(typeof(val)=="object"){
                value=this.searchValue
            }else{
                value=val
            }
            //解决页面为搜索还是正常情况问题
            if(value==""){
                this.isSearchPage=false
                this.page=1
                this.cancelChecked()
            }else{
                this.isSearchPage=true
                this.getFindGoods(1,value)
            }
            console.log(value);
            this.value=""+value
            this.isChange=true
            this.isSearch=false
            // 重置搜索值，保证放在最后
            this.searchValue=""
        },
        searchInput(){
            this.isSearch=true
            let val=this.searchValue
            let mydata=[]
            $.ajax({
                url:"http://localhost:10010/feign/findGoodsName",
                data: "val="+val,
                type: 'get',
                dataType: 'json',
                contentType:"application/json;charset=UTF-8",
                async:false,
                success: function(data){
                    mydata=data
                    console.log(data);
                },
                error: function(res){
                    console.log('出错啦!!');
                },
                timeout: 2000,
            })
            this.searchList=mydata
        },
        searchChange(){
            if(this.isChange)
                this.isSearch=false
            console.log("change");
        },
        getFindGoods(page,val){
            var obj={
                page:page,
                totalPage:1,
                goodsList:[]
            };
            $.ajax({
                url:"http://localhost:10010/feign/findGoods",
                data: "page="+page+"&val="+val,
                type: 'get',
                dataType: 'json',
                contentType:"application/json;charset=UTF-8",
                async:false,
                success: function(data){
                    obj=data
                },
                error: function(res){
                    console.log('出错啦!!');
                },
                timeout: 2000,
            })
            console.log(obj);
            //设置参数
            this.list=obj.goodsList
            this.page=obj.page
            this.totalPage=obj.totalPage
        },
        doThis(){
            console.log("子元素");
        },
    },
    beforeCreate:function(){
        // console.log('before create')
    },
    created:function(){
        console.log('created')
        // 初始化参数
        this.getGoods(1)
        this.getAllType()
        this.setGoodsIsEmpty()
    },
    // updated(){
    //     // console.log("数据发生变化时生效");
    // },
    // beforeMount:function(){
    //     // console.log(this.$el);
    //     // console.log('before mount')
    // },
    mounted:function(){
        // console.log(this.$el);
        // console.log('mounted')
        this.allSeleted()
        // this.addDisabled()
    },
    // beforeDestroy:function(){
    //     // console.log('beforeDestroy')
    // },
    // destroyed:function(){
    //     // console.log('destroyed')
    // }
})