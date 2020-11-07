<template>
 <div>
  <mt-header class="weapon" title="武器" fixed>
    <router-link to="/" slot="left">
    </router-link>
  </mt-header>

  <mt-navbar  v-model="selected" class="gd">
     <mt-tab-item id="1">全部</mt-tab-item>
     <mt-tab-item id="2">狙击枪</mt-tab-item>
     <mt-tab-item id="3">突击步枪</mt-tab-item>
     <mt-tab-item id="4">冲锋枪</mt-tab-item>
     <mt-tab-item id="5">霰弹枪</mt-tab-item>
     <mt-tab-item id="6">手枪</mt-tab-item>
   </mt-navbar>
  <div class="wqgd">
   <table class="ttl">
    <tr>
      <td>武器</td>
      <td>威力</td>
      <td>射程</td>
      <td>稳定性</td>
      <td>射速</td>
    </tr>
   </table>
  </div> 
   <!-- tab-container -->
<mt-tab-container v-model="selected" class="dbmar">
  <mt-tab-container-item id="1">
   <table class="tt" v-for="(item,i) of list" :key="i">
    <tr>
      <td>
      <img :src="'http://fanbing.applinzi.com/weapon/'+item.pic" />
      {{item.wname}}
      </td>
      <td>{{item.wpower}}</td>
      <td>{{item.gunshot}}</td>
      <td>{{item.stability}}</td>
      <td>{{item.firing}}</td>
    </tr>
   </table> 
   <div class="null"></div>
  </mt-tab-container-item>
  <mt-tab-container-item id="2">
   <table class="tt" v-for="(item,i) of jj" :key="i">
    <tr>
      <td>
      <img :src="'http://fanbing.applinzi.com/weapon/'+item.pic" />
      {{item.wname}}
      </td>
      <td>{{item.wpower}}</td>
      <td>{{item.gunshot}}</td>
      <td>{{item.stability}}</td>
      <td>{{item.firing}}</td>
    </tr>
   </table> 
   <div class="null"></div>
  </mt-tab-container-item>
  <mt-tab-container-item id="3">
    <table class="tt" v-for="(item,i) of tj" :key="i">
    <tr>
      <td><img class="font" :src="'http://fanbing.applinzi.com/weapon/'+item.pic" />
      {{item.wname}}</td>
      <td>{{item.wpower}}</td>
      <td>{{item.gunshot}}</td>
      <td>{{item.stability}}</td>
      <td>{{item.firing}}</td>
    </tr>
   </table> 
   <div class="null"></div>
  </mt-tab-container-item>
  <mt-tab-container-item id="4">
    <table class="tt" v-for="(item,i) of cf" :key="i">
    <tr>
      <td><img :src="'http://fanbing.applinzi.com/weapon/'+item.pic" />
      {{item.wname}}</td>
      <td>{{item.wpower}}</td>
      <td>{{item.gunshot}}</td>
      <td>{{item.stability}}</td>
      <td>{{item.firing}}</td>
    </tr>
   </table> 
   <div class="null"></div>
  </mt-tab-container-item>
  <mt-tab-container-item id="5">
    <table class="tt" v-for="(item,i) of xd" :key="i">
    <tr>
      <td><img :src="'http://fanbing.applinzi.com/'+item.pic" />
      {{item.wname}}</td>
      <td>{{item.wpower}}</td>
      <td>{{item.gunshot}}</td>
      <td>{{item.stability}}</td>
      <td>{{item.firing}}</td>
    </tr>
   </table> 
   <div class="null"></div>
  </mt-tab-container-item>
  <mt-tab-container-item id="6">
    <table class="tt" v-for="(item,i) of sq" :key="i">
     <tr>
      <td><img :src="'http://fanbing.applinzi.com/'+item.pic" />
      {{item.wname}}</td>
      <td>{{item.wpower}}</td>
      <td>{{item.gunshot}}</td>
      <td>{{item.stability}}</td>
      <td>{{item.firing}}</td>
     </tr>
    </table> 
    <div class="null"></div>
   </mt-tab-container-item>
  </mt-tab-container>
</div>
</template>
<style scoped>
.weapon{
  background: linear-gradient(to bottom,rgb(227,232,242),rgb(219,222,224));
  font:18px;
  color:#fff;
  height:55px;
  color:#000;
  font-size:18px;
}
  .tt td{width:20%;height:75px;}
  .ttl{width:100%;height:30px;}
  .ttl td{
    width:20%;height:10px;
    font-size:13px;
    padding-left:15px;
  }
  .gd{
    margin-top:50px;
    }
  .font{
    font-size:12px;
  }
  .wqgd{width:100%;position:absolute;top:105px;border-bottom:1px solid #ccc ;float:left;}
  .dbmar{margin-top:45px}
  table{border-bottom:1px solid #ccc;}
  .tt img{
    width:50px;
    height:40px;
    }
  .null{
    width:100%;
    height:60px;
}
.tt td{
  font-size:14px;
  padding-left:15px;
  padding-top:5px;
}
</style>
<script>
export default {
  data(){
    return {
      selected:"1",
      list:[],
      jj:[],
      tj:[],
      cf:[],
      xd:[],
      sq:[]
    }
  },
  created(){
    this.loadMore()
  },
  methods:{
    loadMore(){
      var url="weapon";
      this.axios.get(url).then(res=>{
        var wqks=res.data.msg;
        this.list=wqks;
        for(var i=0;i<this.list.length;i++){
          if(this.list[i].clid==1){
            this.jj.push(this.list[i])
          }else if(this.list[i].clid==2){
            this.tj.push(this.list[i]) 
          }else if(this.list[i].clid==3){
            this.sq.push(this.list[i])
          }else if(this.list[i].clid==4){
            this.cf.push(this.list[i])
          }else{
            this.xd.push(this.list[i])
          }
        }
      })
      // .catch(err=>{
      //  this.$messagebox("提示","系统维护中！！！")
      // })
    }
  }
}
</script>
