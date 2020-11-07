<template>
  <div>
  <mt-header class="c" title="海岛聊天室">  
    <router-link to="/" slot="left">
      <mt-button icon="back">返回</mt-button>
    </router-link>
  </mt-header>
    <div class="d">
      <div class="g"  v-for="(p,i) of list" :key="i">{{p}}</div>
    </div>
    <div class="n"></div>
    <div class="a">
      <input class="b" v-model="shuru">
      <input class="bin" type='button' value='发送' @click='clickButton()'>
    </div>
  </div>
</template>
<style scoped>
.n{
  height:55px;
}
.g{
  
  height:50px;
  background:#36D;
  margin-top:15px;
}
.d{
  width:100%;
  margin-top:50px;
}
.c{
  position: fixed;
  width:100%;
  top:0;
}
  .a{
    height: 50px;
    width: 100%;
    background-color: #ddd;
    position: fixed;
    bottom: 0;
  }
  .b{
    height:45px;
    width:65%;
  }
  .bin{
    height:45px;
    width:33%;
  }
</style>
<script>
  export default {
    data() {
      return {
      list:[],
      shuru:"",
    }
  },
  sockets: {
   connect: function(){
        // 获取每台客服端生成的id
        this.websocketid = this.$socket.id;
        console.log('链接服务器');
      },
      // 监听断开连接，函数
      disconnect(){
        console.log('断开服务器连接');
	  },
	  // 服务端指定有msg监听的客服端，可接对应发来的收消息，data服务端传的消息
	    list(data){
       this.list.push(data)
	    },
      leave(data){
        this.list.push(data)
      }
    
  },
  created(){ //组件创建成功加载
  
  },
  methods: {
    clickButton() {
     // $socket is socket.io-client instance
      this.$socket.emit('message', this.shuru);
      this.shuru="";
      }
    }
  }
</script>