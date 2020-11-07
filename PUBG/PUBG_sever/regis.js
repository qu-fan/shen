var vm=new Vue({
    el:"#app",
    data:{
        uname:"",
        upwd:"",
        reupwd:"",
        phone:"",
        email:"",
        msg1:"请输入您的注册账户名称",
        msg2:"密码长度在7-12位之间",
        msg3:"请输入合法的手机号",
        msg4:"请输入合法的邮箱地址",
        msg5:"密码长度在7-12位之间",
        spanClass1:{ success:false , fail:false },
        spanClass2:{ success:false , fail:false },
        spanClass3:{ success:false , fail:false },
        spanClass4:{ success:false , fail:false },
        spanClass5:{ success:false , fail:false },
    },
    // methods:{
    //     send(){
    //       this.axios.post("http://127.0.0.1:3000/users/reg",`uname=${this.uname}&upwd=${this.upwd}&phone=${this.phone}&email=${this.email}`).then(res=>{
    //             console.log(res.ok);
    //       })
    //     }
    // },
    watch:{
        uname(){
            if(/^[\u4e00-\u9fa5]{2,4}$/.test(this.uname)){
                this.msg1="该账户名可用!";
                this.spanClass1.success=true;
                this.spanClass1.fail=false;
            }else{
                this.msg1="该账户名不可用!";
                this.spanClass1.fail=true;
                this.spanClass1.success=false;
            }
        },
        upwd(){
            if(/^\d{7,12}$/.test(this.upwd)){
                this.msg2="该密码可以使用!";
                this.spanClass2.success=true;
                this.spanClass2.fail=false;
            }else{
                this.msg2="该密码已经被使用!";
                this.spanClass2.fail=true;
                this.spanClass2.success=false;
            }
        },
        phone(){
            if(/(\+86|0086)?\s*1[3-8]\d{9}/.test(this.phone)){
                this.msg3="注册手机号通过!";
                this.spanClass3.success=true;
                this.spanClass3.fail=false;
            }else{
                this.msg3="请检查您的手机号码!";
                this.spanClass3.fail=true;
                this.spanClass3.success=false;
            }
        },
        email(){
            if(/\w+@[A-Za-z0-9]+(\.[A-Za-z0-9]+)+/.test(this.email)){
                this.msg4="注册邮箱通过验证!";
                this.spanClass4.success=true;
                this.spanClass4.fail=false;
            }else{
                this.msg4="该邮箱不可用!";
                this.spanClass4.fail=true;
                this.spanClass4.success=false;
            }
        },
        reupwd(){
            if(this.reupwd==this.upwd){
                this.msg5="两次输入一致!";
                this.spanClass5.success=true;
                this.spanClass5.fail=false;
            }else{
                this.msg5="两次输入不一致!";
                this.spanClass5.fail=true;
                this.spanClass5.success=false;
            }
        }
    }
});
$(".con .datas form .sub").click(function(){
    var uname=$(".con .datas form input[name=uname]").val();
    var upwd=$(".con .datas form input[name=upwd]").val();
    var email=$(".con .datas form input[name=email]").val();
    var phone=$(".con .datas form input[name=phone]").val();
    if(!$(".con .datas form span").hasClass("fail")&&!$(".con .datas form input").val()==""){
        $.ajax({
        url:"http://127.0.0.1:3000/users/reg",
        type:"post",
        data:{uname,upwd,email,phone},
        dataType:"json",
        success:function(res){
            if(res.ok==1){
                alert("注册成功!")
            }else{
                alert("注册失败!")
            }
        }
    })
    }
})
