<template>
    <div>
       <mt-header title="详情" style="width:100%;" fixed>
            <router-link to="/" slot="left">
                <mt-button icon="back">返回</mt-button>
            </router-link>
            <mt-button icon="more" slot="right" @click="more">
            </mt-button>
        </mt-header>
        <div v-show="isShow" class="cass">
            <div class="cass1">收藏</div><div class="cass2">发送</div>
        </div>
        <div class="recomd_div">
            <div class="recomd_title">{{title}}</div>
                <div class="recomd_ke">
                    <div class="recomd_div2" v-for="(s,i) of list" :key="i">
                        <img :src="'http://fanbing.applinzi.com/'+s.avatar" class="img_1">
                        <span class="possion_span">{{s.uname}}</span></div>
                        <span class="align_time">{{time}}</span>
                    </div>
                    <div class="recomd_text">
                        {{text}} 
                    </div>
                    <img class="recomd-img_2" :src="'http://fanbing.applinzi.com/'+pic">
                </div>
             <div @click="zan" class="recomd_button"><img src="../../public/yemian/dzan.png" >{{nblikes}}
             </div>
             <div>
                <van-cell-group>
                        <van-field  v-model="message" @blur="field" label-width="40px" label-align="center" size="large" autosize  maxlength="60" rows="1"  label="评论" type="textarea" placeholder="评论字数不得超过30个字" is-link autofocus clearable style="background:red;"/>
                </van-cell-group>
              </div>
              <div  v-for="(e,i) of lisk" :key="i">
                <div>
                    <div>
                        <div>
                            <img :src="'http://fanbing.applinzi.com/'+e.avatar" class="img_1">
                            <span>{{e.uname}}</span>
                        </div>
                            <div>{{e.text}}</div>
                        </div>
                        <div>{{e.time}}</div>
                    </div>
              </div>
        </div>
        <!-- </div> -->
</template>
<script>
    export default{
        data(){
            return{
                id:"",
                title:"",
                uid:"",
                time:"",
               text:"",
               pic:"",
               nblikes:"",
               flg:true,
               nblikes:"10",
               isShow:false,
               list:[],
               lisk:[],
               message:""
                }
        },
        created(){          
            this.id = this.$router.history.current.params.id;
            //console.log(this.id)
            this.title = this.$router.history.current.params.title;
            //console.log(this.title)
            this.uid = this.$router.history.current.params.uid;
            //console.log(this.uid)
            this.text = this.$router.history.current.params.text;
            //console.log(this.text)
             this.time = this.$router.history.current.params.time;
            //console.log(this.time)
             this.pic = this.$router.history.current.params.pic;
            //console.log(this.pic)
             this.nblikes = this.$router.history.current.params.nblikes;
            //console.log(this.pic)
            this.mooe();
            // this.moe();
            this.cmmon();
        },
        methods:{
                field(){
                    this.uid;
                    var url="informationus";
                    var obj=this.uid;
                    this.axios.get(url,{params:obj}).then(res=>{
                    var result = res.data;
                    //console.log(res.data)
                    if(result.code==-2){
                        this.$messagebox("信息","请登录"); 
                    this.$router.push("/Login");
                        }else{
                            
                        }
                    })
                },
                cmmon(){
                   var ifnid=this.id;
                    var url="informationrs";
                     //console.log(url);
                    var obj={ifnid:this.id};
                     //console.log(obj);
                    this.axios.get(url,{params:obj}).then(res=>{
                            var rows=this.lisk.concat(res.data.data);
                            //console.log(res);
                            this.lisk=rows;
                           // console.log(rows);
                    })
                },
                mooe(){
                    this.uid;
                    var url="userList";
                    var obj={fid:this.uid};
                    this.axios.get(url,{params:obj}).then(res=>{
                        this.list.push(res.data.data[0]);
                        //console.log(res.data.data[0])
                     })
                },
        		zan: function(){
                if(this.flg){
                    this.nblikes++;
                    this.flg = false;
                    this.$toast("点赞成功"); 
                }else{
                    this.nblikes--;
                    this.flg = true;
                    this.$toast("点赞取消");
                }
                    var url="usercell";
                    var obj={nblikes:this.nblikes,id:this.id};
                    this.axios.get(url,{params:obj}).then(res=>{
                         var result = res.data;
                     if(result.code==-2){
                    this.$messagebox("信息","请登录"); 
                    this.$router.push("/Login");
                    }
                    })
            },
            more(){
				this.isShow = !this.isShow
				if(this.isShow){
					this.btnText = "显示"
				}else{
					this.btnText = "隐藏"
				}
			}  
        }
    }
</script>
<style scoped>
.recomd_div{
    width:100%;
    height:100%;
    margin-top:50px
}

.recomd-img_2{
    width:100%;
    height:100%;
}
.recomd_title{
    width:100%;
    height:50px;
    font-size:25px;
    font-weight:700;
    text-align:left;
    margin-bottom:20px
}
.recomd_ke{
    width:100%;
    height:30px;
    font-size:15px;
    color:#000;
    display:flex;
   justify-content: space-between;
   background:#ccc;
   position: relative;
}
.img_1{
    width:25px;
    height:25px;
}
.recomd_div2{
    width:40%;
    height:30px;
    text-align:left;
}
.align_time{
    width:40%;
    text-align:right;
}
.possion_span{
    position:absolute;
    left:25px;top:0px;
    font-size:12px;
    color:#000
}
.recomd_text{
    text-align:left;
    font-size:10px;
    white-space: pre-line;
    
}
.cass{
    float:right;
    width:50px;
    position:absolute;
    top:40px;right:0px;
    background:#ce600f;
}
.cass1,.cass2{
    margin:0 auto;
     border:1px solid #000;
     text-align:center;
}
.cass2{
    border-top:0;
}
.recomd_button{
    width:100px;
    height:32px;
}
</style>