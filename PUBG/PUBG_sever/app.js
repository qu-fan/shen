//1:引入第三方模块
const express = require("express");
const session = require("express-session");
const mysql = require("mysql");
const cors = require("cors");
var server = express();
let port = 5050;
var servera = server.listen(port, () => {
  console.log("Server is Listening:", port);
});
var io = require('socket.io').listen(servera);
io.sockets.on('connection', (socket) => {
  console.log("客户端已连接")
});

//2:创建数据库连接池
var pool = mysql.createPool({
  host: "w.rdc.sae.sina.com.cn",
  user: "w3oonl2j1y",
  password: "iylwximw3il1kk4y5lzjk21ximj424whl541jjim",
  port: 3306,
  connectionLimit: 15,
  database: "app_fanbing"
});
//3:创建web服务器

//4:配置跨域
//允许跨域程序端口
server.use(
  cors({
    //允许哪个程序列表 脚手架
    origin: ["http://bingbing.applinzi.com"],
    //每次请求验证
    credentials: true
  })
);
//5:配置session对象
server.use(
  session({
    secret: "128位安全字符串", //加密条件
    resave: true, //请求更新数据
    saveUninitialized: true //保存初始化数据
  })
);

server.use(express.static("public"));



//用户注册
server.get("/reg",(req,res)=>{
  // var $id=req.body.id;
  var $account=req.query.account;
  var $uname=req.query.uanme;
  var $upwd=req.query.upwd;
  var tx = "avatar/05.jpg"
	// var $email=req.body.email;
	// var $phone=req.body.phone;
	
  var sql="insert into pu_user values(null,?,?,?,?,null)";
  var sql1="insert into pu_login values(null,?,?)";
  pool.query(sql,[$account,$uname,$upwd,tx],(err,result)=>{
    if(err) throw err;
		if(result.affectedRows>0){
      res.send("1");
      return;
		}else{
		  res.send("0");
		}
  });
  pool.query(sql1,[$account,$upwd],(err,result)=>{
		if(err) throw err;
	});
});

// 验证用户是否已注册
server.get("/isreg", (req, res) => {
  //1:获取参数 uname 
  var n = req.query.account;
 
  //2:创建sql
  var sql = " SELECT id FROM pu_login WHERE account = ?";
  //3:发送sql并且结果返回脚手架
  pool.query(sql, [n], (err, result) => {
    //4:如果发生严重错误抛出
    if (err) throw err;
    //5:登录成功用户名密码有错
    if (result.length == 0) {
      res.send({ code: 0, msg: "用户未注册" });
    } else {
      // req.session.uid = result[0].id;
      res.send({ code: 1, msg: "用户已注册" });
    }
  });
});
//二:用户登录
server.get("/login", (req, res) => {
  //1:获取参数 uname upwd
  var n = req.query.account;
  var p = req.query.upwd;
  //2:创建sql
  var sql = " SELECT id FROM pu_login WHERE account = ? AND upwd =?";
  //3:发送sql并且结果返回脚手架
  pool.query(sql, [n, p], (err, result) => {

    //4:如果发生严重错误抛出
    if (err) throw err;
    //5:登录成功用户名密码有错
    if (result.length == 0) {
      res.send({ code: -1, msg: "账号或密码有误" });
    } else {
      req.session.uid = result[0].id;
      res.send({ code: 1, msg: "登录成功" });
    }
  });
});
// //用户注销
server.get("/logout",(req,res)=>{
  req.session.destroy();
  res.send({code:1,msg:"注销成功！"})
})
// 好友列表
server.get("/friend", (req, res) => {
  var uid = req.session.uid;
  if (uid) {
    var sql = "SELECT fid FROM pu_friend WHERE uid = ? ";
    pool.query(sql, [uid], (err, result) => {
      if (err) throw err;
      if (result.length > 0) {
        res.send({ code: 1, msg: "获取成功", data: result });
      } else {
        res.send({ code: 2, msg: "好友列表为空" });
      }
    });
  } else {
    res.send({ code: -2, msg: "未登录" });
  }
});
// 好友信息
server.get("/friendList", (req, res) => {
  var uid = req.session.uid;
  var fid = req.query.fid;
  if (uid) {
    var sql = "SELECT uname,avatar FROM pu_user WHERE id = ? ";
    pool.query(sql, [fid], (err, result) => {
      if (err) throw err;
      if (result.length > 0)
        res.send({ code: 1, msg: "查找成功", data: result });
    });
  } else {
    res.send({ code: -2, msg: "未登录" });
  }
});
// 申请信息
server.get("/shenqing", (req, res) => {
  var uid = req.session.uid;
  if (uid) {
    var sql = "SELECT id,uid,sid,text FROM pu_shenqing WHERE uid = ? ";
    pool.query(sql, [uid], (err, result) => {
      if (err) throw err;
      if (result.length > 0)
        res.send({ code: 1, msg: "查找成功", data: result });
    })
  } else {
    res.send({ code: -2, msg: "未登录" })
  }
})
// 同意申请
server.get("/tongyi", (req, res) => {
  var fid = req.query.fid;
  var uid = req.session.uid;
  var id = req.query.id;
  var sql = "UPDATE pu_friend SET fid=? where uid=?"
  var sql2 = "DELETE FROM pu_shenqing WHERE id=?"
  pool.query(sql2, [id], (err, result) => {
  })
  pool.query(sql, [fid, uid], (err, result) => {
    if (err) throw err;
    if (result.affectedRows == 1) {
      res.send({ code: 1, msg: "添加成功" })
    }
  })
})

//轮播图
server.get("/swiper", (req, res) => {
  var sql = "SELECT pic,id FROM pu_carouse ";
  pool.query(sql, (err, result) => {
    if (err) throw err;
    res.send({ code: 1, msg: "查询成功", data: result });
  });

})
// 资讯
server.get("/information", (req, res) => {
  var pno = req.query.pno;
  var ps = req.query.pageSize;
  if (!pno) {
    pno = 1;
  }
  if (!ps) {
    ps = 10;
  }
  var offset = (pno - 1) * ps;
  ps = parseInt(ps);
  var sql =
    "SELECT id,uid,title,time,pic,nblikes,text FROM pu_information LIMIT ?,?";
  pool.query(sql, [offset, ps], (err, result) => {
    if (err) throw err;
    res.send({ code: 1, msg: "查询成功", data: result });
  });
});
//赛事列表分页
server.get("/tournament", (req, res) => {
  var pno = req.query.pno;
  var ps = req.query.pageSize;
  if (!pno) {
    pno = 1;
  }
  if (!ps) {
    ps = 10;
  }
  var offset = (pno - 1) * ps;
  ps = parseInt(ps);
  var sql =
    "SELECT id,title,time,pic,nblikes,text FROM pu_tournament LIMIT ?,?";
  pool.query(sql, [offset, ps], (err, result) => {
    if (err) throw err;
    res.send({ code: 1, msg: "查询成功", data: result });
  });
});
//攻略列表分页
server.get("/strategy", (req, res) => {
  var pno = req.query.pno;
  var ps = req.query.pageSize;
  if (!pno) {
    pno = 1;
  }
  if (!ps) {
    ps = 10;
  }
  var offset = (pno - 1) * ps;
  ps = parseInt(ps);
  var sql = "SELECT id,title,text,pic FROM pu_strategy LIMIT ?,?";
  pool.query(sql, [offset, ps], (err, result) => {
    if (err) throw err;
    res.send({ code: 1, msg: "查询成功", data: result });
  });
});
//视频列表分页
server.get("/videos", (req, res) => {
  var pno = req.query.pno;
  var ps = req.query.pageSize;
  if (!pno) {
    pno = 1;
  }
  if (!ps) {
    ps = 10;
  }
  var offset = (pno - 1) * ps;
  ps = parseInt(ps);
  var sql = "SELECT id,title,text,video,bullet FROM pu_video LIMIT ?,?";
  pool.query(sql, [offset, ps], (err, result) => {
    if (err) throw err;
    res.send({ code: 1, msg: "查询成功", data: result });
  });
});
//用户自信详情
server.get("/userList", (req, res) => {
  var fid = req.query.fid;
  var sql = "SELECT uname,avatar FROM pu_user WHERE id = ? ";
  pool.query(sql, [fid], (err, result) => {
    if (err) throw err;
    res.send({ code: 1, msg: "查询成功", data: result });
  });
});
//用户的顶赞
server.get("/usercell", (req, res) => {
  var uid = req.session.uid;
  if (!uid) {
    res.send({ code: -2, msg: "请登录" });
    return;
  }
  var id = req.query.id;
  var nblikes = req.query.nblikes;
  var sql = `UPDATE pu_information set nblikes=? WHERE id=? `;
  //执行sql
  pool.query(sql, [nblikes, id], (err, result) => {
    // if(result.length==0){
    //   res.send
    // }else{
    res.send({ code: 1, msg: "result", data: result });
  })
})
//赛事的点赞
server.get("/ussr", (req, res) => {
  var uid = req.session.uid;
  if (!uid) {
    res.send({ code: -2, msg: "请登录" });
    return;
  }
  var id = req.query.id;
  var nblikes = req.query.nblikes;
  var sql = `UPDATE pu_tournament set nblikes=? WHERE id=? `;
  pool.query(sql, [nblikes, id], (err, result) => {
    // if(result.length==0){
    //   res.send
    // }else{
    res.send({ code: 1, msg: "result", data: result });
  })
})

//评论的资讯ID的获取
server.get("/informationrew", (req, res) => {
  var id=req.query.id;
  var sql = "SELECT id FROM pu_information WHERE id=?";
  pool.query(sql, [id], (err, result) => {
    if (err) throw err;
    res.send({ code: 1, msg: "查询成功", data: result });
  });
});

//评论用户的获取
server.get("/informationrs", (req, res) => {
  var ifnid=req.query.ifnid;
  var sql = "SELECT * FROM pu_comment LEFT JOIN pu_user ON pu_comment.uid = pu_user.id WHERE ifnid=?";
  pool.query(sql, [ifnid], (err, result) => {
    if (err) throw err;
    res.send({ code: 1, msg: "查询成功", data: result });
  });
});

//评论用户的当前id的获取
server.get("/informationus",(req,res)=>{
  var uid = req.session.uid;
  if(!uid){
    res.send({code:-2,msg:"请登录",data:[]});
    return;
  }
  var sql = "SELECT avatar,uname FROM pu_user WHERE id = ?";
  pool.query(sql,[uid],(err,result)=>{
    if(err)throw err;
    res.send({code:1,msg:"查询成功",data:result})
  })
})

//功能一;武器查询
server.get("/weapon", (req, res) => {
  //  1.获取用户登录条件
  //  var uid=req.session.uid;
  //  2.如果用户未登录退出
  //  if(!uid){
  //    res.send({code:-999,msg:"请登录"});
  //    return;
  //  }
  var sql = "SELECT clid,wname,pic,wpower,gunshot,stability,firing FROM pu_weapon";
  pool.query(sql, (err, result) => {
    //如果发生严重错误抛出
    if (err) throw err;
    res.send({ code: 1, msg: result })
  })
})

//功能二:战绩查询
server.get("/record", (req, res) => {
  //  1.获取用户登录条件
  var uid = req.session.uid;
  //  2.如果用户未登录退出
  if (!uid) {
    res.send({ code: -999, msg: "请登录" });
    return;
  }
  // var uid = req.query.uid;
  var sql = "SELECT pic,atias,killq,time FROM pu_record WHERE uid=?";
  pool.query(sql, [uid], (err, result) => {
    //如果发生严重错误抛出
    if (err) throw err;
    res.send({ code: 1, msg: result ,uid:uid})
  })
})





















// 聊天室
var uname = "";
server.get("/chatRoom", (req, res) => {
  var uid = req.session.uid;
  if (uid) {
    var sql = "SELECT uname FROM pu_user WHERE id = ?";
    pool.query(sql, [uid], (err, result) => {
      if (err) throw err;
      uname = result[0].uname;
      res.send({ code: 1, msg: "连接成功" })
    })
  } else {
    res.send({ code: -2, msg: "未登录" })
  }
})
// 聊天室
//为io对象绑定事件
// socket  插座  针对某个客户的连接对象
io.on("connection", (socket) => {
  // 广播事件 enter  昵称
  io.emit("enter", uname + "comes in");
  // 接收到客户端的聊天信息
  socket.on("message", (data) => {
    io.emit("list", uname + ":" + data);
  })
  //将客户端聊天内容广播给所有客户
  // 接收客户端退出操作
  socket.on("disconnect", (data) => {
    io.emit("leave", uname + " leave")
  })
  // 广播所有客户有人下线了
})