<template>
    <div>
        <div class="bg">
        <div class="position">
            <p class="zi">用户登陆</p>
            <mt-field class="log" :placeholder="accountholder" v-model="account"></mt-field>
            <mt-field class="log" :placeholder="upwdholder" v-model="upwd" type="password"></mt-field>
            <mt-button class="log" size="large" @click="login">登陆</mt-button>
            <mt-button class="log" size="large" @click="reg">注册</mt-button>
        </div>
        </div>
    </div>
</template>
<script>
    export default{
        data(){
            return{
                accountholder:"请输入盟友账号",
                upwdholder:"请输入盟友密码",
                account:"",
                upwd:""
            }
        },
        methods:{
            login(){
                var a=this.account;
                var p=this.upwd;
                var reg=/^[0-9]{6,10}$/i;
                var reg1=/^[a-zA-Z0-9]{8,12}$/i;
                if(!reg.test(a)){
                    this.$toast("您的账号格式不正确☺");
                    return;
                }
                if(!reg1.test(p)){
                    this.$toast("您的密码格式不正确哟☺");
                    return;
                }
                var url="login";
                var obj={account:a,upwd:p}
                this.axios.get(url,{params:obj}).then(
                    res=>{
                        if(res.data.code==-1){
                            this.$toast("用户名或密码有误");
                        }else{
                            this.$router.push("/")
                        }
                    }
                )
            },
            reg(){
                this.$router.push("/reg")
            }
        }
    }
</script>
<style scoped>
    .bg{
        background:url(../assets/login.jpg) center center no-repeat;
        background-size:cover;
        width:100%;
        height:100%;
        position:fixed;
        top:0px;left:0px;
    }
    .log{
        opacity:0.6;
        margin-bottom:20px;
    }
    .position{
        position:relative;
        top:20%;
    }
    .zi{
        color:#fff;
        font:25px bold chiller;
    }
</style>