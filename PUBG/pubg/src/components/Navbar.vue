<template>
<div id="fu">
<mt-navbar class="title" v-model="active" fixed>
  <van-cell is-link @click="showPopup" style="width:55px;height:55px;padding:5px 5px;background: linear-gradient(to bottom,rgb(227,232,242),rgb(229,232,234));border:1px solid #ccc;border-radius:50%">
    <img alt="未登录" v-for="(q,i) of liss" :key="i" :src="'http://fanbing.applinzi.com/'+q.avatar" class="imgg">
  </van-cell>
  <mt-tab-item  @click="change('tab1')" id="tab1"><span>资讯</span></mt-tab-item>
  <mt-tab-item @click="change('tab2')" id="tab2"><span>赛事</span></mt-tab-item>
  <mt-tab-item @click="change('tab3')"  id="tab3"><span>攻略</span></mt-tab-item>
   <mt-tab-item @click="change('tab4')" id="tab4"><span>视频</span></mt-tab-item>
</mt-navbar>
<div v-for="(q,i) of liss" :key="i"  >
 <van-popup v-model="show" closeable position="left" :style="{ width: '70%',height: '100%',background:'#f00'}">
 <img :src="'http://fanbing.applinzi.com/'+q.avatar" class="" :class="imgg">
  <span>{{q.uname}}</span>
  <div>收藏</div>
   <div>发布动态</div>
    <button @click="del">退出登录</button>
 </van-popup>
 </div>
<!-- tab-container -->
    <mt-tab-container v-model="active" :swipeable="true" value="tab1">
      <mt-tab-container-item  id="tab1">
     <div> <swipe style="margin-top:65px; margin-bottom:20px;" prevent="true" stopPropagation="true"></swipe></div>
      <div>
       <div class="container"   v-for="(p,i) of list" :key="i" @click="recomeed" :data-id="p.id" :data-title="p.title" :data-time="p.time" :data-uid="p.uid" :data-pic="p.pic" :data-text="p.text" :data-nblikes="p.nblikes">
            <div class="container_p">
                <div class="container_div">{{p.title}}</div>
                <div class="container1">
                    <div class="div_time">{{p.time}}</div>
                </div>
            </div>
            <div class="div">
                <img :src="'http://fanbing.applinzi.com/'+p.pic" class="img_2" alt="暂时无法显示">
            </div>
            </div>
             <mt-button @click="loadmore" size="large"  class="button">加载更多</mt-button>
              <div class="null"></div>
        </div>
      </mt-tab-container-item>
      <mt-tab-container-item id="tab2">
     <div style="margin-top:50px">
       <div class="container"  v-for="(e,i) of shuzu" :key="i" @click="toure" :data-id="e.id"  :data-title="e.title" :data-time="e.time" :data-text="e.text" :data-pic="e.pic" :data-nblikes="e.nblikes"> 
            <div class="container_p">
                <div class="container_div">{{e.title}}</div>
                <div class="container1">
                    <div class="div_time">{{e.time}}</div>
                </div>
            </div>
            <div class="div">
                <img :src="'http://fanbing.applinzi.com/'+e.pic" class="img_2" alt="暂时无法显示">
            </div>
            </div>
             <mt-button @click="tour" size="large" class="button">加载更多</mt-button>
             <div class="null"></div>
        </div>
      </mt-tab-container-item>
      <mt-tab-container-item id="tab3">
      <div style="margin-top:50px">
       <div class="container"  v-for="(f,i) of shu" :key="i" @click="strate" :data-id="f.id"  :data-title="f.title" :data-text="f.text" :data-pic="f.pic"> 
            <div class="container_p">
                <div class="container_div">{{f.title}}</div>
            </div>
            <div class="div">
                <img :src="'http://fanbing.applinzi.com/'+f.pic" class="img_2" alt="暂时无法显示">
            </div>
        </div>
            <mt-button @click="stra" size="large" class="button">加载更多</mt-button>
             <div class="null"></div>
        </div>
      </mt-tab-container-item>
      <mt-tab-container-item id="tab4">
     <div style="margin-top:50px">
       <div class="video"  v-for="(g,i) of zu" :key="i"> 
                <div class="video_div">{{g.title}}</div>
            <div class="div">
                <video></video>
            </div>
        </div>
            <mt-button @click="stra" size="large" class="button">加载更多</mt-button>
             <div class="null"></div>
        </div>
      </mt-tab-container-item> 

    </mt-tab-container>
</div>
</template>
<script>
  import Swipe from './Swipe.vue'
  import recomeed from './recomeed.vue'
   import tour from './tour.vue'
   import strate from './strate.vue'
    export default{
      created(){ //组件创建成功后加载
      this.loadmore(); //加载资讯数据
      this.tour();//加载赛事数据
      this.stra();//加载攻略数据
      this.video();//加载视频数据
      this.user();
      },
      
      data(){
       return{ selected:"",active:"tab1",list:[],shuzu:[],shu:[],zu:[],pno:0,peo:0,ppo:0,pee:0,id:1,pso:0,ps:1,show:false,liss:[],lises:[]}
        },
        components:{
            "swipe":Swipe,        
        },
        methods:{
            del(){
                this.uid;
                var url="logout";
                var obj=this.uid;
                this.axios.get(url,{params:obj}).then(res=>{
                    // res.session.destroy();
                    this.$router.push("/Login");
                    return;
                    })
                },
            showPopup(){
                    this.show = true;
            },
           user(){
               this.uid;
                    var url="informationus";
                    var obj=this.uid;
                    this.axios.get(url,{params:obj}).then(res=>{
                       var key=this.liss.concat(res.data.data);
                       this.liss=key;
                       //console.log(key)
                        })
           },
          loadmore(){
            this.pno++;
            var url="information";
          //  console.log(url);
            var obj={pno:this.pno,ps:this.ps};
           // console.log(obj);
            this.axios.get(url,{params:obj}).then(res=>{
              var rows=this.list.concat(res.data.data);
              //console.log(res);
              this.list=rows;
             //console.log(rows);
            })
          },
         tour(){
            this.peo++;
            var url="tournament";
            // console.log(url);
            var obj={peo:this.peo,ps:this.ps};
           // console.log(obj);
            this.axios.get(url,{params:obj}).then(res=>{
              var kews=this.shuzu.concat(res.data.data);
              //console.log(res);
              this.shuzu=kews;
              //console.log(this.shuzu);
            })
          },
           stra(){
            this.ppo++;
            var url="strategy";
            // console.log(url);
            var obj={ppo:this.ppo,ps:this.ps};
            // console.log(obj);
            this.axios.get(url,{params:obj}).then(res=>{
              var raws=this.shu.concat(res.data.data);
              this.shu=raws;
            //   console.log(res);
            })
          },
          video(){
            this.pee++;
            var url="videos";
            // console.log(url);
            var obj={pee:this.pee,ps:this.ps};
            // console.log(obj);
            this.axios.get(url,{params:obj}).then(res=>{
              var raas=this.zu.concat(res.data.data);
              this.zu=raas;
            //   console.log(res);
            })
          },

          recomeed(e){
              this.id++;
              var id = e.currentTarget.dataset.id;
              var title = e.currentTarget.dataset.title;
             // console.log(title);
              var uid = e.currentTarget.dataset.uid;
              var time = e.currentTarget.dataset.time;
              var text = e.currentTarget.dataset.text;
              var pic = e.currentTarget.dataset.pic; 
              var nblikes = e.currentTarget.dataset.nblikes; 
              this.$router.push({name:"recomeed",params:{id:id,title:title,uid:uid,time:time,text:text,pic:pic,nblikes:nblikes}});//跳转recomeed组件
                    //console.log(id+":"+title+":"+uid+":"+time+":"+text+":"+pic);    
          },
          toure(e){
              this.id++;
              var lid = e.currentTarget.dataset.id;
              //console.log(lid)
              var ltitle = e.currentTarget.dataset.title;
             // console.log(ltitle);
              var ltime = e.currentTarget.dataset.time;
              var ltext = e.currentTarget.dataset.text;
             // console.log(ltext);
              var lpic = e.currentTarget.dataset.pic; 
              var lnblikes = e.currentTarget.dataset.nblikes;  
             this.$router.push({name:"tour",params:{id:lid,title:ltitle,time:ltime,text:ltext,pic:lpic,nblikes:lnblikes}});//跳转tour组件
                // console.log(lid+":"+ltitle+":"+ltime+":"+ltext+":"+lpic);    
          },
          strate(e){
              this.id++;
              var sid = e.currentTarget.dataset.id;
              var stitle = e.currentTarget.dataset.title;
             // console.log(stitle);
              var stext = e.currentTarget.dataset.text;
              var spic = e.currentTarget.dataset.pic;   
             this.$router.push({name:"strate",params:{id:sid,title:stitle,text:stext,pic:spic}});//跳转tour组件
            //         console.log(sid+":"+stitle+":"+suid+":"+stime+":"+stext+":"+spic);    
          },
           change(id){
              this.active=id;
           },

        }
    }
</script>
<style scoped>
.van-icon, .van-icon::before {
    display: none !important;
}
.imgg{
    width:50px;height:50px
}
.mint-button-text{
    font:15px bold !important;
}
.title{
    background: linear-gradient(to bottom,rgb(227,232,242),rgb(229,232,234)); 
}
.title span{
    font:16px bold !important;
    border-bottom:0px solid white !important;
}
.container{
    margin:5px auto;
   padding-bottom:10px;
    width:100%;
    height:120px;
    border-bottom:2px solid #ccc;
    display:flex;
   justify-content: space-between;
   position: relative;
   background:rgba(237,240,245,0.8);
}
.container_p{
    width:60%;
    clear:both
}
.container_div{
    width:100%;
    margin-top:20px;
    margin-bottom:0;
    font:16px bold;
    font-weight:550;
    clear:both;
    text-align:left
}
.container1{
    display:flex;
    width:62%;
    height:25px;
    justify-content: space-between;
    line-height:25px;
     position: absolute;
     top:107px;left:-21px;
}
.img_1{
    width:18px;
    height:18px;

}
.name{
    width:100px;
    height:20px;
    font-size:18px;
    line-height:20px;
     position: absolute;
     top:10px;
}
.div_time{
    width:120px;
    height:24px;
    font-size:17px;
    color:"#00f";
    position:relative;
    top:-15px;left:24px
}
.img_2{
    width:110px;
    height:90px;
    margin-top:20px;
}
.div{
    clear:both;
 top:0px;
}
.null{
    width:100%;
    height:60px;
}
.video_div{
    width:100%;height:30px;
    font-size:15px;
}
.video{
    width:100%;
    height:300px;
    border:1px solid #ccc;
}
</style>