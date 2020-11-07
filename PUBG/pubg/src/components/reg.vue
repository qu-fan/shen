<template>
  <div>
    <div class="bg">
        <div class="position">
            <p class="zi">用户注册</p>
            <mt-field  :placeholder="uaccount" v-model="account"></mt-field>
            <mt-field  :placeholder="uaccount1" v-model="uname"></mt-field>
            <mt-field  :placeholder="upwdts" v-model="upwd" type="password"></mt-field>
            <!--<mt-field  :placeholder="uemailts" v-model="email"></mt-field>
            <mt-field  :placeholder="uphonets" v-model="phone"></mt-field>-->
            <mt-button class="log" size="large" @click="reg">注册</mt-button>
        </div>
    </div>
  </div>
</template>
<script>
export default{
  data(){
      return{
        uaccount:"请输入用户名",
        uaccount1:"请输入自定义用户名",
        upwdts:"请输入用密码",
        // uemailts:"请输入用邮箱",
        // uphonets:"请输入用手机",
        uname:"",
        account:"",
        upwd:"",
        // email:"",
        // phone:""
      }
    },
    created(){
    },
    methods:{
      reg(){
        var a=this.account;
        var m=this.uname;
        var p=this.upwd;
        // var e=this.email;
        // var h=this.phone;
        var reg=/^[0-9]{6,10}$/i;
        var reg1=/^[a-zA-Z0-9]{8,12}$/i;
        // var reg2=/^[0-9a-zA-Z.-_]+@[0-9a-zA-Z.-_]+(\.[a-zA-Z]+){1,2}$/;
        // var reg3=/^1[3-9]\d{9}$/
        if(!reg.test(a)){
          this.$toast("您的账号格式不正确☺");
          return;
        }
        if(!reg1.test(p)){
          this.$toast("您的密码格式不正确哟☺");
          return;
        }
        // if(!reg2.test(e)){
        //   this.$toast("您的邮箱格式不正确哟☺");
        //   return;
        // }
        // if(!reg3.test(h)){
        //   this.$toast("您的手机格式不正确哟☺");
        //   return;
        // }
        var url="reg";
        var url1="isreg"
        var obj1={account:a}
        var obj={account:a,uname:m,upwd:p};
        var a = true;
        this.axios.get(url1,{params:obj1}).then(res=>{
          if(res.data.code==1){
            this.$toast("用户已注册");
            a = false;
            return;
          }else if(a){
            this.axios.get(url,{params:obj}).then(res=>{
              if(res==0){
              this.$toast("注册失败");
              }else{
              this.$toast("注册成功");
              this.$router.push("/Login")
            }
           })
          }
        })     
      }
    }
}
</script>