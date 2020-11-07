<template>
  <div>
    <mt-tab-container v-model="selected">
  <mt-tab-container-item id="zixun">
    <navbar></navbar>
  </mt-tab-container-item>
  <mt-tab-container-item id="mengyou">
    <friend :shenqing="shenqing" :friendList="friendList"></friend>
  </mt-tab-container-item>
  <mt-tab-container-item id="zhandou">
    <wqk></wqk>
  </mt-tab-container-item>
  <mt-tab-container-item id="zhanji">
   <zjcx></zjcx>
  </mt-tab-container-item>
</mt-tab-container>
    <mt-tabbar class="bottom" v-model="selected" fixed>
      <mt-tab-item id="zixun">
        <img slot="icon" src="../../public/dibu/zixun.png" />
       <span>首页</span>
      </mt-tab-item>
      <mt-tab-item @click.native="friend" id="mengyou">
        <img slot="icon" src="../../public/dibu/mengyou.png" />
        <span>盟友</span>
      </mt-tab-item>
      <mt-tab-item id="zhandou">
        <img slot="icon" src="../../public/dibu/zhandou.png" />
         <span> 战斗</span>
      </mt-tab-item>
      <mt-tab-item   id="zhanji">
          <img slot="icon" src="../../public/dibu/zhanji.png" />
          <span @click="zj">战绩</span>
      </mt-tab-item>
    </mt-tabbar>
  </div>
</template>

<script>
import friend from './friend.vue';
import navbar from './Navbar';
import wqk from './Wqk.vue';
import zjcx from './Zjcx.vue';
export default {
  data() {
    return {
      selected: "zixun",
      friendList:[],
      shenqing:[],
    };
  },
  created(){ //组件创建成功加载
      
  },
  methods:{
    zj(){
      var url = "chatRoom";
        this.axios.get(url).then(res=>{
          if(res.data.code==-2){
            this.$messagebox("信息","请登录");
            this.$router.push("/Login");
          }
        })
    },
    friend(){
      var url = "shenqing";
      this.axios.get(url).then(res=>{
        this.shenqing=res.data.data;
      });
      var url = "friend";
      this.axios.get(url).then(res=>{
        if(res.data.code==-2){
          this.$messagebox("信息","请登录");
          this.$router.push("/Login");
        }else if(res.data.code==2){
        }else{
          this.friendList = res.data.data[0];
        }
      })  
    }
  },
  components:{
      "friend":friend,
      "navbar":navbar,
      'wqk':wqk,
      'zjcx':zjcx,
    }
};
</script>
<style scoped>
  .bottom{
    background: linear-gradient(to bottom,rgb(227,232,242),rgb(219,222,224));
  }
  .bottom span{
    font:14px bold;
  }
</style>