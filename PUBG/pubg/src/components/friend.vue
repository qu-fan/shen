<template>
  <div>
    <div></div v-if="isRouterAlive">
    <mt-header fixed class="friend" title="盟友圈"></mt-header>
    <div class="d"><mt-field :placeholder="suosou" v-model="a"></mt-field>  </div>
    <div @click="ulist" class="a"><div class="list">好友</div><div>▽</div></div>
    <div v-show="b==-1">
      <span>{{msg}}</span>
      <div v-for="(p,i) of kong" :key="i" class="a">
        <img class="avatar" :src="'http://fanbing.applinzi.com/'+p.avatar">
        <span>{{p.uname}}</span>
      </div>
    </div>
    <div @click="sq" class="a"><div class="list">申请</div><div>▽</div></div>
    <div v-show="c==-1">
      <span>{{smsg}}</span>
      <div v-for="(p,i) of txmc" :key="i" class="a"> 
         <img class="avatar" :src="'http://fanbing.applinzi.com/'+p.avatar">
         <span class="yang">{{p.uname}} </span>
         <span class="fan">附言:{{sqr[i].text}}</span>
          <div @click="toyi(sqr[i].sid,sqr[i].id)">同意</div>
          <div><span class="friend-name">拒绝</span></div>
      </div>
    </div>
    <div class="room" >聊天室</div>
    <div class="a" @click="haidao"><div class="list">海岛</div><div>▽</div></div>
    <div class="a"><div class="list">沙漠</div><div>▽</div></div>
    <div class="a"><div class="list">雨林</div><div>▽</div></div>
    
  </div>
</template>
<style scoped>
.friend{
  background: linear-gradient(to bottom,rgb(227,232,242),rgb(219,222,224));
  font:18px;
  color:#fff;
  height:55px;
  color:#000;
  font-size:18px;
}
.friend-name{
  padding-right:15px;
  font-size:15px;
  padding:5px 8px;
  border:1px solid #ccc;
  width:50px;height:25px;
  border-radius:13px;
}
.friend-name1{
  padding-right:15px;
}
.yang{
  font:15px;
  padding-left:15px;
}
.fan{
  font-size:13px;
  color:rgb(155,155,155);
}
.list{
  font:15px;
  font-weight:550;
  padding-left:15px;
}
.room{
  font:20px;
  font-weight:550;
  margin:30px 0 20px 5px;
}
  .d{
    width:100%;
    height:70px;
    margin-top:40px;
  }
   .a {
      width: 100%;
      height: 45px;
      line-height:40px;
      background: linear-gradient(to bottom,rgb(252,252,252),rgb(242,247,245));
      display: flex;
      justify-content:space-between;
      margin-bottom:5px;
    }
    .avatar{
      width:40px;
      height:40px;
      border-radius:50%;
      margin-left:15px;
    }
</style>
<script>
  export default{
    props:{
      shenqing:{default:""},
      friendList:{default:""},
      div:"",
    },
    data() {
      return {
        selected: "zixun",
        suosou:"查找好友账号",
        a:"",
        kong:[],
        msg:'',
        sqr:[],
        smsg:'',
        txmc:[],
        isRouterAlive: true,
        b:1,
        c:1,
      };
    },
     created(){ //组件创建成功加载
    },
    methods:{
      haidao(){
        var url = "chatRoom";
        this.axios.get(url).then(res=>{
         if(res.data.code==-2){
          this.$messagebox("信息","请登录");
          this.$router.push("/Login");
         }else{
           this.$router.push("/haidao");
         }
        })  
        
      },
      reload () {
     this.isRouterAlive = false
     this.$nextTick(() => (this.isRouterAlive = true))
   },
      toyi(sid,xid){
        var url = "tongyi";
        var id = xid;
        var fid = this.friendList.fid + "," +sid;
        var obj = {fid:fid,id:id}
        this.axios.get(url,{params:obj}).then(res=>{
        })
        this.$toast("添加成功"); 
        this.sq();
      },
      sq(){
        this.c*=-1;
        this.txmc=[];
        this.sqr = this.shenqing;
        for(var p of this.sqr){
          var sid =p.sid; 
          var url = "friendList"
          var obj = {fid:sid}
          this.axios.get(url,{params:obj}).then(res=>{  
            this.txmc.push(res.data.data[0]);
          })
        }
      },
    ulist(){
      this.b*=-1
      var str = this.friendList.fid;
      if(str){
        var fid = str.split(",")
        this.kong=[];
        var url = "friendList";
        for(var p of fid){
          var obj={fid:p} 
          this.axios.get(url,{params:obj}).then(res=>{
          this.kong.push(res.data.data[0])   
          })
          this.kong=[];
        } 
      }else{
        this.msg="好友列表为空"
      }
    
     
     
      
   
   
    }   
  },
}
</script>
