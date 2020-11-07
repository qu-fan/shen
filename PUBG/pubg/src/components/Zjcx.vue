<template>
<div>
  <mt-header class="score" title="战绩查询" fixed>
  </mt-header>
  <mt-navbar v-model="selected" class="gd" fixed>
    <mt-tab-item id="1">战绩</mt-tab-item>
    <mt-tab-item id="2" @click="draw">能力</mt-tab-item>
  </mt-navbar>
  <mt-tab-container v-model="selected" class="dbmar">
   <mt-tab-container-item id="1">
    <table class="map">
      <tr>
        <td>地图</td>
        <td>击杀</td>
        <td>时间</td>
      </tr>
    </table>
    <table  v-for="(item,i) of list" :key="i" @click="xs" class="tt">
    <tr>
      <td>
      <img style="margin-right:15px;" :src="'http://fanbing.applinzi.com/record/'+item.pic" />
      {{item.wname}}
      {{item.atias}}
      </td>
      <td>{{item.killq}}</td>
      <td>{{item.time}}</td>
      <div v-show="pno==-1" class="bg">
        <img class="image" :src="'http://fanbing.applinzi.com/record/'+item.pic" />
        <h3>击杀数:{{item.killq}}</h3>
        <h3>治疗量:{{item.killq}}</h3>
        <h3>游戏时间:{{item.time}}</h3>
      </div>
    </tr>
   </table> 
   <div class="null"></div>
   </mt-tab-container-item>
     <mt-tab-container-item id="2">
     <div class="aaa">
      <div id="myChart"></div>
     </div>
       
     </mt-tab-container-item>
  </mt-tab-container>
</div>
</template>
<style scoped>
.aaa{
  text-align:center;
  width:100%;
}
.map{
  font-size:13px;
  margin-top:20px;
  width:100%;
  padding-left:20px;
}
.image{
  width:63px;
}
.score{
  background: linear-gradient(to bottom,rgb(227,232,242),rgb(219,222,224));
  font:18px;
  color:#fff;
  height:55px;
  color:#000;
  font-size:18px;
}
.bg{
  background:rgb(229,234,234);
  width:100%;
  float:right;
}
.gd{margin-top:55px}
.dbmar{margin-top:86px}
.tt{
  width:100%;
  border:1px solid #eee;
  text-align:center;
  background:rgb(250,252,252);
  height:100px;
}
.tt td:first-child{
  width:62px;
}
.tt td:nth-child(2){
  width:50px;
}
.tt  img{
  width:60px;
  height:55px;
  }
#myChart{ margin:0 auto; width: 300px; height: 300px}
 .null{
    width:100%;
    height:60px;
}
</style>
<script>
  export default{
    data(){
      return{
        selected:"1",
        list:[],
        pno:1,
        js:[]
      }
    },
    created(){
      this.loadMore();
    },
    mounted(){
      this.draw();
    },
    methods:{
      loadMore(){
        //var uid= 2;
        //var obj={uid};
        var url="record";
        this.axios.get(url).then(res=>{
            var zjcx=res.data.msg;
            this.list=zjcx;
            this.js=this.list[0].killq
        })
      },
      xs(){
        this.pno*=-1;
      },
     draw(){
        
        console.log(this.js)
        // 基于准备好的dom，初始化echarts实例
        let myChart = this.$echarts.init(document.getElementById('myChart'))
        // 绘制图表
        myChart.setOption({
        title: { text: '绝地求生战力图' },
        tooltip: {trigger: 'axis'},
        legend: {
        x: 'center',
        data:['战力']
        },
        radar: [
          {
            indicator: [
                {text: '治疗量', max: 100},
                {text: '击杀数', max: 100},
                {text: '生存时间', max: 100},
                {text: '造成伤害', max: 100},
                {text: 'KDA', max: 100}
            ],
            radius: 80,
            center: ['50%','60%'],
          }
        ],
        series: [{
           type: 'radar',
             tooltip: {
                trigger: 'item'
            },
            itemStyle: {normal: {areaStyle: {type: 'default'}}},
            data: [
                {
                    value: [this.js,80,80,80,80],
                    name: '战斗力'
                }
            ]
             
            }]
        });
    }
    }
  }
</script>
