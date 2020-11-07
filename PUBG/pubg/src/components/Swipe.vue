<template>
<div>
    <mt-swipe :show-indicators="false" style="height:150px;width:99.8%;margin:0 auto" >
      <mt-swipe-item style="background:red" v-for="(p,i) of ss" :key="i"><img :src="'http://fanbing.applinzi.com/'+p.pic"></mt-swipe-item>
    </mt-swipe>
</div>
</template>
<script>
export default{
  created(){
    this.swipe();
  },
  data(){
    return{
      ss:[],id:"",pic:""
    }
  },
  methods:{
     swipe(){
              var url="swiper";
              var obj={id:this.id};
              this.axios.get(url,{params:obj}).then(res=>{
             var rows=this.ss.concat(res.data.data);
              this.ss=rows;
                })
            },
  }
}
</script>
<style scoped>
  img{
    width:100%;
    height:150px;
  }
</style>
