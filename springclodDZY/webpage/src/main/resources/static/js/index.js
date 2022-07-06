// 主页组件
/*全局变量*/ 
var endTime;
var eventList=[{name:"世界末日",date:"2012-12-31 00:00:00", remark:"消息是假的"}];
const index = {
    template: "#index",
    data() {
        return {
            isShowTime:false,
            isShowDetail:false,
            detail:{
                name:"",
                date:"",
                 remark:""
                },
            text:"",
            date:"",
            clock:"",
            iName:"",
            iDate:"",
            iTime:"",
            iRemark:"",
            iList:[],
            weeks:['日','一','二','三','四','五','六'],
            intervalId:null,
            startIndex: 0,
            endIndex: 10
        }
    },
    methods:{
        addEvent(){
            this.isShowTime=!this.isShowTime;
        },
        //定时刷新数据
        dataRefreh(){
            if(this.intervalId!=null){
                return;
            }
            this.showCurrentTime();
            this.intervalId=setInterval(()=>this.showCurrentTime(), 1000);
        },
        // 停止定时器
        clear(){
            clearInterval(this.intervalId);
            this.intervalId=null;
        },
        showCurrentTime(){
            var d=new Date();
            var year=d.getFullYear();
            var month=d.getMonth()+1;
            var date=d.getDate();
            var day=d.getDay();
            var hour=d.getHours();
            var minute=d.getMinutes();
            var second=d.getSeconds();
            if(hour<10){
                hour="0"+hour;
            }

            if(minute<10){
                minute="0"+minute;
            }

            if(second<10){
                second="0"+second;
            }
            this.date=year+"/"+month+"/"+date+"\t\t星期"+this.weeks[day];
            this.clock=hour+":"+minute+":"+second;
        },
        setLength(){
            var a=this.iName.substring(0,12);
            if(this.iName.length>12){
                alert("输入长度不能超过12个字符。");
                // console.log(a);
                this.iName=a;
            }
        },
        setEvent(){
            if(this.iName==""){
                alert("事件名为空！");
                return;
            }
            if(this.iDate==""){
                alert("日期为空！");
                return;
            }
            if(this.iTime==""){
                alert("时间为空！");
                return;
            }
            if(this.iRemark==""){
                this.iRemark="无"
            }
            var e={name:"",date:"", remark:""};
            var d=this.iDate+" "+this.iTime+":00";
            e.name=this.iName;
            e.date=d;
            e.remark=this.iRemark;
            this.iList.unshift(e);
            this.iRemark="";
            this.isShowTime=!this.isShowTime;
        },
        removeEvent(i){
            this.iList.splice(i, 1);
        },
        nextPage: function () {
            this.startIndex += 10;
            this.endIndex += 10;
        },
        prevPage: function () {
            this.startIndex -= 10;
            this.endIndex -= 10;
        },
        showDetail(i){
            this.detail=this.iList[i];
            console.log(this.detail);
            this.isShowDetail=!this.isShowDetail;
        },
        closeDetail(){
            this.isShowDetail=!this.isShowDetail;
        }
    },
    created(){
        // alert(11)
        this.dataRefreh();
        this.iList=eventList;
    },
    destroyed(){
        //页面销毁后，清除定时器
        this.clear();
    }
}
// 天气预报组件
/*全局变量*/ 
var myCity="广州";
const dataset = {
    template: "#dataset",
    data() {
        return {
            city: '',
            weatherList: [],
        }
    },
    methods: {
        // searchWeather: function (city) {
        //     // console.log('天气查询');
        //     // console.log(this.city);
        //     // 调用接口
        //     myCity=city;
        //     var that = this;
        //     axios.get("http://wthrcdn.etouch.cn/weather_mini?city=" + this.city)
        //         .then(function (response) {
        //             // console.log(response);
        //             console.log(response.data.data.forecast);
        //             that.weatherList = response.data.data.forecast;
        //         }, function (err) {
        //             console.log(err);
        //         })
        // },
        // changeCity(city) {
        //     //点击事件(点击城市)
        //     this.city = city;
        //     this.searchWeather(city);
        // }
    },
    // created(){
    //     this.city=myCity;
    //     this.searchWeather(this.city);
    // }
}
// 记事本组件
// var arrList=["西兰花炒鸡蛋", "木瓜煲榴莲", "腐竹汤", "牛奶蒸番茄", "椒盐西兰花",
// "爆炒辣椒", "红烧月饼", "清蒸黄瓜", "香菜拌葱花", "烟熏白菜", "百年女儿红"];
const recycle = {
    template: "#recycle",
    data() {
        return {
            arr: [],
            msg: "",
            isShow: true,
            startIndex: 0,
            endIndex: 10
        }
    },
    methods: {
        // add: function (val) {
        //     // 从结尾添加数据
        //     // this.arr.push(val);
        //     // 从头部添加数据
        //     this.arr.unshift(val);
        // },
        // remove: function (index) {
        //     this.arr.splice(index, 1);
        // },
        // cleanAll: function () {
        //     var a = confirm("是否清空记录？");
        //     if (a) {
        //         this.arr = [];
        //         this.startIndex = 0;
        //         this.endIndex = 10;
        //     }
        // },
        // showEle: function () {
        //     this.isShow = false;
        // },
        // hiddenEle: function () {
        //     this.isShow = true;
        // },
        // nextPage: function () {
        //     this.startIndex += 10;
        //     this.endIndex += 10;
        // },
        // prevPage: function () {
        //     this.startIndex -= 10;
        //     this.endIndex -= 10;
        // }
    },
    // created(){
    //     this.arr=arrList;
    // }
}

// 侧边栏路由切换
const routes = [
    { path: '/', component: index },
    { path: '/dataset', component: dataset },
    { path: '/recycle', component: recycle }
]
// 注册路由
const router = new VueRouter({
    // mode:'history',
    routes
})

// 创建vue实例
var vm = new Vue({
    el: "#app",
    router
})
        // console.log("href="+window.location.pathname);