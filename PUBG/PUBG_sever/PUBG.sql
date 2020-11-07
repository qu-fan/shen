/**创建数据库PUBG;**/
-- SET NAMES UTF8;
-- DROP DATABASE IF EXISTS PUBG;
-- CREATE DATABASE PUBG CHARSET=UTF8;
-- USE PUBG;

/**1.创建用户信息表**/
CREATE TABLE pu_user(
   id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
   account INT,   #用户注册时自行设置的账号6-10位
   uname VARCHAR(32),   #用户注册时的用户名:长度小于8位的字符
   upwd  VARCHAR(32),   #8-12位密码
   avatar VARCHAR(128), #用户头像路径
   gender BOOL      #性别0-女  1-男
);
-- 用户登录表
CREATE TABLE pu_login(
   id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
   account INT,   #用户注册时账号 6-10位数字
   upwd  VARCHAR(32)   #8-12位密码
);
-- 用户好友表
CREATE TABLE pu_friend(
  id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  uid INT, #用户id
  fid VARCHAR(128) #好友id
);
-- 好友申请表
CREATE TABLE pu_shenqing(
  id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  uid INT ,  #被申请人id
  sid INT,  #申请人id
  text VARCHAR(128)  #申请人附言
);
-- -- 
-- 轮播图表
CREATE TABLE pu_carouse(
	id int PRIMARY KEY NOT NULL AUTO_INCREMENT,
	pic varchar(128) DEFAULT NULL
);
-- 资讯表
CREATE TABLE pu_information (
    id int PRIMARY KEY NOT NULL AUTO_INCREMENT,
    uid int NOT NULL,
    title varchar(128) DEFAULT NULL,
    time varchar(64) DEFAULT NULL,
    text varchar(1200) DEFAULT NULL,
    pic varchar(648) DEFAULT NULL,
    nblikes int  NOT NULL
);
-- 赛事
CREATE TABLE pu_tournament(
    id int PRIMARY KEY NOT NULL AUTO_INCREMENT,
    title varchar(128) DEFAULT NULL,
    time varchar(64) DEFAULT NULL,
    text varchar(648) DEFAULT NULL,
    pic varchar(128) DEFAULT NULL,
    nblikes int  NOT NULL
);
-- 攻略
CREATE TABLE pu_strategy(
    id int PRIMARY KEY NOT NULL AUTO_INCREMENT,
    title varchar(128) DEFAULT NULL,
    text varchar(648) DEFAULT NULL,
    pic varchar(128) DEFAULT NULL
);

-- 视频
CREATE TABLE pu_video(
    id int PRIMARY KEY NOT NULL AUTO_INCREMENT,
    title varchar(128) DEFAULT NULL,
    text varchar(648) DEFAULT NULL,
    video varchar(128) DEFAULT NULL,
    bullet varchar(648) DEFAULT NULL
);


-- 评论表
CREATE TABLE pu_comment(
    id int PRIMARY KEY NOT NULL AUTO_INCREMENT,
    uid int NOT NULL,
    ifnid int NOT NULL,
    text varchar(248) DEFAULT NULL,
    time int DEFAULT NULL
);
-- 武器表
CREATE TABLE pu_weapon(
  id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  clid INT,
  wname  VARCHAR(32),
  pic VARCHAR(128),
  wpower VARCHAR(8),
  gunshot VARCHAR(8),
  stability VARCHAR(8),
  firing VARCHAR(8),
  wtext VARCHAR(128)
);
-- 战绩
CREATE TABLE pu_record(
  id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  uid INT,
  pic VARCHAR(128),
  atias VARCHAR(128),
  killq INT,
  time DATE
);
-- -----------------------------
-- 登录表
INSERT INTO pu_login VALUES(null,'12345678','123456shen');
INSERT INTO pu_login VALUES(null,'123456789','123456yang');
INSERT INTO pu_login VALUES(null,'1234567890','123456guo');
-- -----------------------------------------
-- 用户详情表
INSERT INTO pu_user VALUES(null,'12345678','燕子','123456shen','avatar/01.jpg',0);
INSERT INTO pu_user VALUES(null,'123456789','洋洋','123456yang','avatar/02.jpg',1);
INSERT INTO pu_user VALUES(null,'1234567890','小宇','123456guo','avatar/03.jpg',1);
INSERT INTO pu_user VALUES(null,'1234567891','小凡','123456guo','avatar/04.jpg',1);
-- ------------------------------------------
-- 用户好友表
INSERT INTO pu_friend VALUES(null,1,'2');
INSERT INTO pu_friend VALUES(null,2,'1,3');
-- ------------------------------------------------------
-- 用户好友申请表
INSERT INTO pu_shenqing VALUES(null,1,3,'加个好友呗！');
INSERT INTO pu_shenqing VALUES(null,1,4,'加个好友呗哈哈！');
-- ---------------------------------------------
-- 轮播图
INSERT INTO pu_carouse VALUES(null,'carouse/pubg_1.jpg');
INSERT INTO pu_carouse VALUES(null,'carouse/pubg_2.jpg');
INSERT INTO pu_carouse VALUES(null,'carouse/pubg_3.jpg');
-- ----------------------------------------------------
-- -- 资讯页
-- -- 资讯页
INSERT INTO pu_information VALUES(null,2,'[官方]圣诞节皮肤现已上线','2019.03.18','“让枪声响起来吧！”
在飘雪的寒冬，被甲执锐，前往战场。PUBG 全新圣诞节皮肤现已上线！
穿上充满节日气息的毛衣和姜饼人连身衣，纵横于冬日的战场吧！
2019年12月4日至2020年1月1日，大家可以在游戏商店购买下列限定皮肤及BP道具哦！
以下为限定皮肤及BP道具：
我们在游戏里见！
绝地求生社区团队','recommended/01_1.png','10000'),
(null,1,'[官方]PUBG实验室：圈中圈模式','2019.03.18','跳伞、搜刮、原地驻扎，然后一直苟到比赛结束！…的玩法今后可没法派上用场了！我们在原有蓝圈的基础上，往地图中又增加了一个新的蓝圈。这下想要采用原地“深蹲”这种消极玩法的各位“苟大师”们可要乖乖地从屋里出来动一动了。在该模式下，地图中将会刷新出一个“内蓝圈”，这个圈不仅可以防止玩家们一直原地“深蹲”，还能为大家揭示下一个蓝圈的位置。您可以在内蓝圈的详细规则介绍中进行深入了解。圈中圈模式将于12月6日下午3点到12月9日下午3点（北京时间）在PUBG 实验室中与大家见面。
为什么要设计该模式呢？
• 在无法预知下一个蓝圈位置的情况下，位于下个蓝圈附近的幸运儿们有很高的概率能成功吃鸡。
•由于大家无法预知下一个蓝圈的位置，所以对运气比较背的玩家而言，和蓝圈战斗的时间甚至会比和敌人战斗的时间要更长 -- 因为他们需要花费大量时间来完成一场进圈马拉松。 
机制
• 在游戏开始后，地图上将会刷新一个“内蓝圈”；内蓝圈将会持续刷新，直到游戏中的倒数第二个蓝圈出现为止。
• 内蓝圈的位置、大小与下一个安全区的位置、大小相同。
• 内蓝圈也会和蓝圈一样对玩家造成伤害，来防止玩家们一直在原地“深蹲”。
（其伤害与下一阶段的蓝圈伤害相同） 
规则
• 安全区内将生成另一个蓝圈 – “内蓝圈”。（除了最终阶段）
• 内蓝圈的位置、大小与下一阶段的安全区位置、大小相同。
• 内蓝圈的伤害与下一阶段的蓝圈伤害相同。
• 道具的刷新量会比公开比赛中高0.5倍。
• 扶起被击倒的队友所需的时间为4秒。 
活动日程：
12月6日下午3点 – 12月9日下午3点（北京时间）
• 视角：第3人称 / 第1人称
• 支持模式：4排
• 地图：艾伦格
• 最大玩家数量：64
• 如何开启：请点击位于大厅画面左下角的“开始”按键上方的实验室图标
PUBG 实验室是一个让尚且处于实验阶段的游戏内功能与玩家们提前见面的地方；我们会根据玩家们给出的各种反馈意见来对相关功能进行调整，优化其便利性与趣味性，让它们能成功地在游戏中占据一席之地。在PUBG 实验室中，我们最最重视的便是各位玩家们所提供的宝贵意见！也希望大家在对功能进行体验后可以畅所欲言，将您的感想告诉锅妹哦。','recommended/02_1.png','2000'),
(null,1,'[官方]PGC冠军竞猜奖励发放','2019.03.18','亲爱的玩家：
    PGC冠军竞猜奖励已发放完毕（仅限于投票给冠军队伍Gen.G的玩家），大家可以在【仓库—功能性—宝箱】里确认是否收到。
    如24小时后仍然没收到，敬请联系我们客服。
    对于上述问题带来的不便，敬请谅解。请大家重启客户端获取更新。','recommended/03_1.png','19800'),
(null,2,'PlayerlGN新爆料：疑似新地图雏形 上线日期未知','2019.03.18','PlayerIGN昨天发推提到：去年和前年的12月7号都有新地图上线，但是今年官方好像没有任何关于新地图的消息漏出。
今天它曝光了两张疑似新地图的雏形图：从图上来看是一个小岛模样的地图，中部有对称的两个物体，而右下角的一部分不经让人联想：难道这仅仅是新地图的一个副岛？','recommended/04_1.png','10001'),
(null,2,'明年或将推出第五张地图？工作室总监发推暗示','2019.03.18','本资讯转自玩加电竞
12月4日凌晨，PUBG工作室总监Brian Corrigan在个人推特发布了游戏现有四张地图的照片，疑似暗示明年将有新图推出。
“明年我得往墙上打个新钉子”
你期待下一张新地图会是什么主题呢？','recommended/05_1.png','102122'),
(null,1,'小鹿首播人气爆炸：4AM为其引流，韦神送礼捧场','2019.03.18','绝地求生PGC全球总决赛的战斗已经全部落下帷幕了，在这一战中，国内最具人气的4AM战队虽然未能稳住优势最终斩获季军，在总体结果上来看，4AM无疑是值得肯定的。毕竟在此次强队云集的国际大赛上，4AM的确打出了属于PCL赛区的风采来了。
就在此PGC全球总决赛结束之后，4AM战队的选手们再度投入到日常的直播之旅中，在11号29号，4AM迎来一个重磅消息，那就是小鹿在虎牙平台迎来直播首秀了。在此次小鹿的首播中，4AM战队无论是韦神还是永远都为其关播引流，再加上4AM战队的强大粉丝团队的支援下，小鹿的直播间人气热度力压托马斯，孤存等人高居虎牙绝地求生板块的榜首。
除了4AM战队为其关播引流之外，韦神女友蜜蜂，胸大更是与小鹿一起开黑互动，蜜蜂训练营提前开启。但更为让人喜感的莫过于在小鹿的首播中，老板韦神竟然罕见的前来送出藏宝图捧场了，要知道韦神可是很少送礼的人，而且也是不怎么乐意粉丝送礼，此前更是一度因为粉丝送礼导致直播卡顿而关播了。要知道韦神入驻虎牙平台已经有两年了，但是他的等级如今却仅仅只有3级，可见这下小鹿的牌面是真的太大了。
在面对此次韦神的送礼下，小鹿腼腆的说道：感谢阿韦送的藏宝图，老板大气。此时观众弹幕瞬间爆炸，4AM的水友们不断调侃：真老板大气，老板再来一个；来人把榜二（韦神）封一下；猪头不开播，还不是想趁着小鹿首秀蹭一波人气；老板就送一个礼物，建议小黑屋7天.......
不得不说的是，自从小鹿加入4AM顶替醒目的位置之后，4AM队内再度发生良好的化学反应，不仅帮助4AM斩获PCL夏季赛的冠军，而且作为初登国际赛场的小鹿竟然没有一点畏惧，多次登上战神榜单，上演鹿鼎记再度来袭。','recommended/08_1.jpg','1201'),
(null,1,'飞锅警告！会飞的平底锅你怕不怕？','2019.01.22','小伙伴们大家好！我是盒仔~
在第五赛季的更新中有一项对近战武器的改动，盒仔觉得还挺好玩的。
很多小伙伴们在以往看到近战武器是不会捡的，最多就是捡个平底锅用来挡一下子弹...
没错，很真实...
这是因为近战武器要贴脸输出啊！你跟拿着枪的敌人对决，你肯定还没靠近就狗带了啊！
除了在决赛圈用平地锅吃鸡的大神...
而在已经到来的第五赛季中，近战武器被增加了投掷功能，就像以往抛投掷物那样，把近战武器投掷出去吧！
投掷武器
大砍刀、撬棍、镰刀：
最远投掷距离40米，伤害量从75-25随距离衰减。
平底锅：
最远投掷距离30米，伤害量从90-40随距离衰减。
在15米内投掷为最大伤害量，此时若对手没有装备头盔，投掷武器命中则可以瞬间击倒！
瞄准示意图
从图中可以看到抛物线还是非常准的，在范围内基本是指哪打哪。
那命中不了头部，岂不是打不倒敌人了？当然还是有办法的！
拾取多武器
在第五赛季中，玩家可以重复拾取近战武器，只要背包足够大，不怕大锅装不下！
四种近战武器均占背包40容量：
经过盒仔测试，装备防具之后最多可携带四把近战武器。
在落地没枪的时候，如果捡到两把及以上的近战武器，说不定还能淘汰对手！
其他用途
除了对敌人造成伤害以外，平底锅也可以对载具进行攻击：
虽然载具扣的耐久度有点少...
不过破坏车胎还是可以的，投掷两下就可以破坏载具车胎。
最后是盒仔觉得投掷近战武器最合适的应用方式：
因为投掷武器在撞击前是无声的，而投掷武器又可以破坏玻璃！
因此我们在城区附近有敌人时，可以利用投掷武器，从门外往隔壁楼窗户投掷，欺骗敌人自己所在的位置！
以上就是投掷近战武器的全部介绍啦！','recommended/07_1.gif','10026'),
(null,2,'账号封禁周报：上周永久封禁69,894个账号','2010.01.10','根据PUBG官方报告，PUBG每天都在不断寻求各种手段和方法，以阻止未经授权的非法程序，并严格和坚决地回应检测。
从10月20日（周日）到10月26日（周六），共有69,894人被永久封禁，如下所示。
检测周期
2019-10-20到2019-10-26
制裁帐户
69,894
不知道本周游戏环境较差是否和封禁数量减少有关，同时我也收到投稿，昨天好像封禁了一大批账号，不知道是不是对于部分外挂的专项打击，明天服务器维护更新后也可以看看环境变化，希望能变好吧。
PUBG官方也表示之后将不断地提升游戏的安全性级别，并将持续地更加详细与玩家们汇报、沟通；为了健康与公平的游戏环境，提供给玩家更好的游戏体验与服务而战！许多作弊程式出售以及硬体上的异常使用等，都依赖了玩家的举报，使官方得以手动加以及早封锁。','recommended/08_1.jpg','100000'),
(null,2,'Steam平台最高在线人数重回60万，第五赛季大受好评','2019.03.18','第五赛季上线后，绝地求生最高在线人数重回60万
随着第五赛季正式上线，米拉玛地图终于迎来了调整，而全新的投掷物资功能与投掷近战武器功能都得到了玩家们的一致好评。
伴随着新功能的上线，通过外网放出的数据我们了解到，绝地求生在月底的最高在线人数终于重新回到了60万，达到了月初的水准，不知道这种情况能否延续下去。
ELS现神奇操作，JST选手科比附身，高抛手雷精准带走对手
在刚刚结束的ELS大洋洲赛区冠军联赛上，来自JST战队的选手上演了一波极为精彩的投掷物操作，只见这名选手将手雷高高抛出，投掷物划出了一道美妙的弧线，随后精准的落到了对手脚下将其淘汰，堪称科比附体，大家给这波操作打几分呢？','recommended/09_1.jpg','100000'),
(null,1,'电子竞技的观众想要什么？','2019.03.18','你是一位电子竞技赛事的观众吗？
如今几乎所有领域的内容生产者都在思考同一个问题：用户们真正需要的是什么？电子竞技也不例外，赛事组织者在推广赛事的同时，都会不可避免地自我发问：赛事观众们想要什么？
赛事内容本身当然是无可争议的核心，无论在一项电竞赛事发展的何种阶段，基础的赛事内容在聚拢、维持、扩散用户规模方面都起着至关重要的作用。看比赛的人总是希望能够欣赏到那些惊心动魄、紧张激烈甚至令人血脉喷张的比赛，就像足球场双方攻防转换90分钟，每一粒进球都是技术、运气、实力的综合结果，等待进球的过程以及进球后对胜利的满足感就是众多足球死忠总是乐此不疲的原因。放到电竞领域也是如此，细心观察你会发现，在这个几乎全世界电子竞技都在高速发展的黄金时代，受欢迎程度排在头部电竞赛事却并没有太多的花样，而Moba和FPS总会是其中的佼佼者。作为佐证，据统计，2019年上半年全球电竞赛事项目奖金前十排名中，只有第十位的《炉石传说》不属于这两种类型。你难以否认，不论是Moba还是FPS，其赛事特色都是强对抗、强爆发同时又兼具一定偶然性，可以说天然具有某种程度上的“吸睛”优势。
但机械简单地提供此类赛事内容就足够了吗？赛事组织者们的“野心”显然不止于此，能够利用天然的赛事内容吸收到“第一桶金”只是一个开始，对于电子竞技来说，进阶的问题随之出现：如何牢牢抓住观众的心？电竞赛事观众原生于网络，网络直播与电子竞技的“复兴”相辅相成，能够看到怎样的画面就是观众们的“第二个需求”，技术的革新带来了画面质感的飞跃式提升，高清、超清、4M甚至10M，观众们想要的是足够舒适的观赛体验，而不是即使戴着眼镜还感觉“一片朦胧”。与此同时，网络直播强调互动性和参与感，赛事观众也是如此， 几乎所有的直播平台在赛事直播期间都会开展相应的有奖活动，以挽留观众的关注度，而在赛事本身，类似于LPL场间在近两年引入直播平台“贡献榜”、微博墙、选手支持率等内容，就是希望能够让观众获得观看赛事的参与感，避免孤立隔绝的状态。从今年开始，英雄联盟和绝地求生项目的电竞赛事陆续推出了赛场期间的“多视角观赛”，即单独切出一位选手的第一视角，因为在平时的比赛中，观众们只能通过上帝视角看到选手操作的角色动作，但第一视角能够满足他们进一步收看到选手本身操作细节的需要，这样的需求是学技术吗？其实更多的可能是好奇心的驱使。
然而观赛体验不止线上，随着电子竞技赛事热度的持续走高，线下观赛成为产业发展的必然。但电子竞技相对于传统体育的线下观赛体验几乎存在天然的“劣势”，现场观众通常难以看到选手是如何打比赛的，而只能看到在家里看直播时的画面，那观众为什么会到现场观赛呢？和传统体育类似，融入现场赛事氛围是关键的因素，所以赛事组织者会尽力在场馆及比赛期间营造这样的气氛，比如游戏角色的Cos、只有现场才有的互动环节、只有线下才会有各种周边售卖，用独有性吸引更多的观众。当然，线下还有一个部分是独一无二的，那就是参赛选手。
电子竞技的粉丝经济是基于电竞粉丝的需求量身打造的。电竞造星从市场和用户营运的角度就是打造出符合粉丝预期或喜好的明星选手，他们或者技术精湛，世界少有，或者面容姣好，帅气逼人，或者故事丰富，形象立体，对于电子竞技这样极其讲求实力、表现和成绩的领域来说，满足粉丝通常心理的“崇拜感”实在不是一件难事，并且这样的粉丝聚合是跨越性别的，既有男性技术粉，也有女性“颜粉”。比如LPL的Uzi、JackeyLove、Clearlove，LCK的Faker，KPL的阿泰、Cat，绝地求生的GodV等等，他们实力过人，荣誉等身，成为电竞明星既是自身原因，也因官方推动。LPL在多年的赛事发展中积淀出独特的“梗”文化，“梗”实际上就是观众们的“饭后谈资”，但却逐渐成为选手们的认知符号，“梗”越吸引人，也就意味来作为核心的赛事内容越丰富，也就越能满足观众对于各类信息的需要。
其实电竞赛事观众想要什么，在很大程度也取决于电竞项目的种类，在普遍意义上的赛事内容之外，打造具有赛事特色且符合观众需要的才是赛事可持续发展的重要一环。比如S8以来英雄联盟与肯德基合作的KI上校胜率分析环节，无论对于Moba游戏还是英雄联盟赛事本身来说都可以被称作“天作之合”。
不过，作为内容提供者来说，全力满足用户不断发展变化的需求固然重要，但是如果能够在此基础上“超前一步”，主动打造“用户需求”，或许会在未来创造出更大的价值。而这则需要电竞行业的从业者们更多的探索与想象力。','recommended/10_1.jpg','1230'),
(null,1,'S5R1版本评测：通行证升级难度增加，品质增加','2019.03.18','大家好呀，我是你们随着版本更新而刷新的【老菜苟】苏北
虽然游戏性改的一塌糊涂，通行证居然还不错
昨天我吐槽了一晚上5.1版本的游戏性更新，但是实际上也是5.1版本中比较差劲的改动
至少通行证我觉得还真的蛮不错的，只不过依然还是有那么一点缺陷。
这一版本的通行证，如果不买豪华通行证的话，收益非常非常的低，所以本文考虑的就是买了豪华通行证的情况。
通行证奖励
买通行证主要是为了奖励，谁也不是吃饱了撑的花钱找罪受，那么就先来看看奖励吧
算上挑战任务，武器皮肤共20款。
载具皮肤2款。
装备皮肤6款，动作6款。
服饰外观共37款。
另外，还有5款用于挑战任务的专属上衣：
从整体饰品质量来看
服饰外观类更具备墨西哥风格，而且很多服饰都是全新的设计，并非换皮皮肤。总的来说比较良心：
武器皮肤中，按照大的款式主要归为三类：
“带刺玫瑰”，粉色系是真的好看！粉色AKM的皮肤质量完全不输在售的武器皮肤。好评！
“精致系列”走的是富丽堂皇的镀金风格，贴近墨西哥的整体风格，M24足够精致，Groza是计数的。
挑战皮肤整体采用红日的纹饰，缺点是熟料感和油漆感比较严重，但是精细度还是不错的。
从整个通行证的奖励来看，整体质量在水平线以上，并没有因为通行证而粗制滥造。如果为了皮肤来看，购买通行证是值得的。
而且这一轮通行证中还有一个特别的奖励：
下一个赛季的通行证直升卡！！！
不得不说，蓝洞真销售鬼才，路子走野了……
下一轮通行证估计升级难度爆炸高……
任务系统
在新版通行证中，任务系统与前一个余波通行证的任务系统极其相似，所以相同的部分我就简单提一下掠过了：
1.每日任务/每周任务
这两个任务系统与上一个通行证完全一样，就连经验值都是一摸一样的…
2.进程任务：
进程任务是整个通行证任务的大头，能够获取的经验极高。
而且进程任务主要针对各个地图的游戏，同时也考验玩家通行证任务的完成程度。
可以说进程任务是最杀时间的一个经验获取渠道。 
3.赛季任务
赛季任务与余波相同，主要是提供经验和四款饰品
只不过这次着重表现了近战武器的投掷属性，尼泊尔刀是真的帅！
4.挑战任务
挑战任务也是和上一个通行证一样，区别是这次挑战任务需要穿着对应的衣服：
不过衣服是没五级获得一个，而且没买通行证也可以做，所以挑战任务依旧保持良心，好评。
社区任务！！！
社区任务是我觉得这轮通行证的精髓！
玩家可以通过在游戏中获取光碟碎片，掰断的光碟和旧DVD来完成社区任务的进度。
而社区任务的进度每个阶段可以解锁一个米拉玛的背景故事视频！！
在游戏中随处可以看到这样的箱子：
打开之后，可以获得光碟碎片，断裂的光碟或者旧DVD，分别提供1/2/3的社区任务进度：
而每一局搜集的总量会在物品栏中显示：
我觉得这个通行证的精髓就在于，当第一阶段解锁之后，玩家会看到米拉玛当年到底是什么样的。
这时，玩家会拥有另一份代入感，共同去揭秘当年的米拉玛！！
而且，我觉得……
按照上一个通行证蓝洞的尿性……
这个通行证结束时应该刚好全解锁……
然后直接衔接到米拉玛重置……
不信赌五毛钱的…… 
通行证好升级吗？？
最后，再聊一下玩家关心的问题：新通行证容易升级么？根据我的计算，新通行证如果不是测试服BUG的话，升级会特别难……
一起来看下经验的获取情况：
升100级一共要990000，但是可获取经验值一共才119000，也就是说才20%的富余量。
如果说为什么这次通行证经验这么少，其实原因在于：
这次通行证少了一个：生存经验！
之前的通行证会随着每天玩游戏，每天可以最多获得4800点经验，也就是半级，84天差不多40级
但是这轮通行证，这个经验获取渠道没了……
所以我说，如果不是测试服BUG的话，不氪金满级太难了……
总结：
最新的通行证奖励质量还是非常良心，无论是武器还是服饰都没有敷衍的态度。
升级难度略高，不过考虑到送35级下一个通行证的升级卡，总的来说也还不错。
毕竟下一个版本大概率是新地图或者重置米拉玛，还是很值得玩的。
推荐购买指数：7星吧。
好了，以上就是PC1.0版本第5赛季第1轮中关于通行证更新的相关内容，剩余内容将会持续更新哟。','recommended/12_1.jpg','1000');
-- -----------------------------------------------------
-- 赛事表
INSERT INTO pu_tournament VALUES
(null,'[PGC]决赛选手数据榜：永远斩获淘汰王','2019-10-1','不久之前，本届的PGC全球总决赛在奥克兰落下帷幕，PCL赛区战队4AM在这届PGC中，虽说没能拿到最后的冠军，但他们还是有不小的收获的，不过要说起最大的收获，可能还要数永远的成长了，在这届PGC全球总决赛上，永远告诉全世界昙花虽一现，但亦是永远！
选手榜上，来自4AM战队的选手永远以23个总淘汰领跑，斩获本次PGC全球总决赛淘汰王。
场均伤害方面，Pio以339hp领跑，王欣以333hp位居第2，ubah以331hp位居第3，永远以325hp位居第4。
场均击倒方面，永远以1.8个领跑，Pio、王欣、ubah分列2、3、4位。
场均投掷物方面，ENF选手Seongjang以5.6个排名第1，永远、韦神分列2、3位。
场均存活时间方面，Gen选手Esther以22.6min排在第1，Gen、VC、TSM成为决赛圈常客。','tournament/01.jpg','10086'),
(null,'四大战神齐了！黑潮确定加入4AM 韦神开心了','2019-11-29','在绝地求生PGC世界赛结束后，参加比赛的队伍也都已经回到了国内，经过短暂的休息后，也是迅速投入到训练赛当中，准备迎接即将开打的微博杯。
而微博杯还没开始，4AM就出现了人员变动，关注队伍消息的网友应该是知道，在PGC结束回国后，就消息说VC的黑潮将会和4AM的VV互换，让黑潮找到4AM进行比赛，关注了比赛的网友应该都知道，黑潮可是VC的钢枪战神，在世界赛的时候，QM的伊泽，VC的黑潮还有4AM的永远，可是并称为三大战神的。
而在5E八倍镜这个数据网站上，4AM的选手库已经更新，加入了黑潮，现在基本就确定黑潮和VV是互换了，这一下4AM就真的是集齐四大战神了，永远，王总，小鹿，黑潮，这四位战神凑在一起，那么太猛了，饭堂君觉得，有点菜的阿韦，微博杯可以休息养身体，让四大战神登场吧（狗头）。
而去到VC的VV，对于他来说也是一个好消息吧，毕竟在4AM的话，登场的几率太低了，目前4AM的阵容是固定的了，不会有太大的变化，所以对于VV来说，去到VC还好一点，至少登场的机会高了很多，而且VV训练赛的状态也是非常猛的，许久没登赛场，可以期待一下他在微博杯的表现。
总的来说，这次人员的变动对于4AM和VC来说影响不大，反正换来换去都是自家人（狗头）。','tournament/02.jpg','102020');
-- 攻略表
INSERT INTO pu_strategy VALUES
(null,'[PGC]决赛选手数据榜：永远斩获淘汰王','不久之前，本届的PGC全球总决赛在奥克兰落下帷幕，PCL赛区战队4AM在这届PGC中，虽说没能拿到最后的冠军，但他们还是有不小的收获的，不过要说起最大的收获，可能还要数永远的成长了，在这届PGC全球总决赛上，永远告诉全世界昙花虽一现，但亦是永远！
选手榜上，来自4AM战队的选手永远以23个总淘汰领跑，斩获本次PGC全球总决赛淘汰王。
场均伤害方面，Pio以339hp领跑，王欣以333hp位居第2，ubah以331hp位居第3，永远以325hp位居第4。
场均击倒方面，永远以1.8个领跑，Pio、王欣、ubah分列2、3、4位。
场均投掷物方面，ENF选手Seongjang以5.6个排名第1，永远、韦神分列2、3位。
场均存活时间方面，Gen选手Esther以22.6min排在第1，Gen、VC、TSM成为决赛圈常客。','strategy/01_1.jpg'),
(null,'四大战神齐了！黑潮确定加入4AM 韦神开心了','在绝地求生PGC世界赛结束后，参加比赛的队伍也都已经回到了国内，经过短暂的休息后，也是迅速投入到训练赛当中，准备迎接即将开打的微博杯。
而微博杯还没开始，4AM就出现了人员变动，关注队伍消息的网友应该是知道，在PGC结束回国后，就消息说VC的黑潮将会和4AM的VV互换，让黑潮找到4AM进行比赛，关注了比赛的网友应该都知道，黑潮可是VC的钢枪战神，在世界赛的时候，QM的伊泽，VC的黑潮还有4AM的永远，可是并称为三大战神的。
而在5E八倍镜这个数据网站上，4AM的选手库已经更新，加入了黑潮，现在基本就确定黑潮和VV是互换了，这一下4AM就真的是集齐四大战神了，永远，王总，小鹿，黑潮，这四位战神凑在一起，那么太猛了，饭堂君觉得，有点菜的阿韦，微博杯可以休息养身体，让四大战神登场吧（狗头）。
而去到VC的VV，对于他来说也是一个好消息吧，毕竟在4AM的话，登场的几率太低了，目前4AM的阵容是固定的了，不会有太大的变化，所以对于VV来说，去到VC还好一点，至少登场的机会高了很多，而且VV训练赛的状态也是非常猛的，许久没登赛场，可以期待一下他在微博杯的表现。
总的来说，这次人员的变动对于4AM和VC来说影响不大，反正换来换去都是自家人（狗头）。','strategy/02.jpg');
--  视频表
INSERT INTO pu_video VALUES
(null,'装逼','null','null','null'),
(null,'null','null','null','null');



--  评论表
INSERT INTO pu_comment VALUES
(null,1,'1','乐观家族永不为奴','2019.08.01'),
(null,2,'2','打卡','2019.08.02'),
(null,3,'3','乐观家族永不为奴','2019.08.01'),
(null,3,'2','打卡','2019.08.02'),
(null,3,'4','乐观家族永不为奴','2019.08.01'),
(null,3,'3','打卡','2019.08.02'),
(null,4,'1','乐观家族永不为奴','2019.08.01'),
(null,3,'1','打卡','2019.08.02'),
(null,1,'2','乐观家族永不为奴','2019.08.01'),
(null,1,'2','打卡','2019.08.02'),
(null,2,'3','乐观家族永不为奴','2019.08.01'),
(null,3,'3','打卡','2019.08.02'),
(null,4,'4','乐观家族永不为奴','2019.08.01'),
(null,3,'3','打卡','2019.08.02');

-- 战绩
INSERT INTO pu_record VALUES(NULL,1,"sm.jpg","沙漠",10,"2019-12-20");
INSERT INTO pu_record VALUES(NULL,2,"hd.jpg","海岛",29,"2019-12-22");
INSERT INTO pu_record VALUES(NULL,3,"xd.jpg","雪地",9,"2019-12-23");
INSERT INTO pu_record VALUES(NULL,4,"sm.jpg","沙漠",5,"2019-12-24");
INSERT INTO pu_record VALUES(NULL,1,"sm.jpg","沙漠",6,"2019-12-25");
INSERT INTO pu_record VALUES(NULL,1,"sm.jpg","沙漠",10,"2019-12-20");
INSERT INTO pu_record VALUES(NULL,2,"hd.jpg","海岛",29,"2019-12-22");
INSERT INTO pu_record VALUES(NULL,3,"xd.jpg","雪地",9,"2019-12-23");
INSERT INTO pu_record VALUES(NULL,4,"sm.jpg","沙漠",5,"2019-12-24");
INSERT INTO pu_record VALUES(NULL,1,"sm.jpg","沙漠",6,"2019-12-25");
INSERT INTO pu_record VALUES(NULL,1,"sm.jpg","沙漠",10,"2019-12-20");
INSERT INTO pu_record VALUES(NULL,2,"hd.jpg","海岛",29,"2019-12-22");
INSERT INTO pu_record VALUES(NULL,3,"xd.jpg","雪地",9,"2019-12-23");
INSERT INTO pu_record VALUES(NULL,4,"sm.jpg","沙漠",5,"2019-12-24");
INSERT INTO pu_record VALUES(NULL,1,"sm.jpg","沙漠",6,"2019-12-25");
INSERT INTO pu_record VALUES(NULL,1,"sm.jpg","沙漠",10,"2019-12-20");
INSERT INTO pu_record VALUES(NULL,2,"hd.jpg","海岛",29,"2019-12-22");
INSERT INTO pu_record VALUES(NULL,3,"xd.jpg","雪地",9,"2019-12-23");
INSERT INTO pu_record VALUES(NULL,4,"sm.jpg","沙漠",5,"2019-12-24");
INSERT INTO pu_record VALUES(NULL,1,"sm.jpg","沙漠",6,"2019-12-25");
INSERT INTO pu_record VALUES(NULL,1,"sm.jpg","沙漠",10,"2019-12-20");
INSERT INTO pu_record VALUES(NULL,2,"hd.jpg","海岛",29,"2019-12-22");
INSERT INTO pu_record VALUES(NULL,3,"xd.jpg","雪地",9,"2019-12-23");
INSERT INTO pu_record VALUES(NULL,4,"sm.jpg","沙漠",5,"2019-12-24");
INSERT INTO pu_record VALUES(NULL,1,"sm.jpg","沙漠",6,"2019-12-25");
INSERT INTO pu_record VALUES(NULL,4,"xd.jpg","雪地",5,"2019-12-24");
INSERT INTO pu_record VALUES(NULL,4,"xd.jpg","雪地",5,"2019-12-24");
INSERT INTO pu_record VALUES(NULL,4,"xd.jpg","雪地",5,"2019-12-24");
INSERT INTO pu_record VALUES(NULL,4,"xd.jpg","雪地",5,"2019-12-24");
INSERT INTO pu_record VALUES(NULL,4,"xd.jpg","雪地",5,"2019-12-24");
INSERT INTO pu_record VALUES(NULL,4,"xd.jpg","雪地",5,"2019-12-24");
INSERT INTO pu_record VALUES(NULL,4,"xd.jpg","雪地",5,"2019-12-24");
INSERT INTO pu_record VALUES(NULL,4,"xd.jpg","雪地",5,"2019-12-24");
INSERT INTO pu_record VALUES(NULL,4,"xd.jpg","雪地",5,"2019-12-24");
INSERT INTO pu_record VALUES(NULL,4,"xd.jpg","雪地",5,"2019-12-24");
INSERT INTO pu_record VALUES(NULL,4,"xd.jpg","雪地",5,"2019-12-24");
INSERT INTO pu_record VALUES(NULL,4,"hd.jpg","海岛",29,"2019-12-22");
INSERT INTO pu_record VALUES(NULL,4,"hd.jpg","海岛",29,"2019-12-22");
INSERT INTO pu_record VALUES(NULL,4,"hd.jpg","海岛",29,"2019-12-22");
INSERT INTO pu_record VALUES(NULL,4,"hd.jpg","海岛",29,"2019-12-22");
INSERT INTO pu_record VALUES(NULL,4,"hd.jpg","海岛",29,"2019-12-22");
INSERT INTO pu_record VALUES(NULL,4,"xd.jpg","雪地",5,"2019-12-24");
INSERT INTO pu_record VALUES(NULL,4,"xd.jpg","雪地",5,"2019-12-24");
INSERT INTO pu_record VALUES(NULL,4,"xd.jpg","雪地",5,"2019-12-24");
INSERT INTO pu_record VALUES(NULL,4,"xd.jpg","雪地",5,"2019-12-24");
INSERT INTO pu_record VALUES(NULL,4,"xd.jpg","雪地",5,"2019-12-24");
INSERT INTO pu_record VALUES(NULL,4,"xd.jpg","雪地",5,"2019-12-24");
INSERT INTO pu_record VALUES(NULL,4,"xd.jpg","雪地",5,"2019-12-24");
INSERT INTO pu_record VALUES(NULL,4,"hd.jpg","海岛",29,"2019-12-22");
INSERT INTO pu_record VALUES(NULL,4,"hd.jpg","海岛",29,"2019-12-22");
INSERT INTO pu_record VALUES(NULL,4,"hd.jpg","海岛",29,"2019-12-22");
INSERT INTO pu_record VALUES(NULL,4,"hd.jpg","海岛",29,"2019-12-22");
INSERT INTO pu_record VALUES(NULL,4,"hd.jpg","海岛",29,"2019-12-22");
-- 武器
INSERT INTO pu_weapon VALUES(null,1,"AWM","1awm.jpg",48,35,25,12,"一枪打爆三级头");
INSERT INTO pu_weapon VALUES(null,1,"98KR","198kr.jpg",48,35,25,12,"人气高");
INSERT INTO pu_weapon VALUES(null,1,"mini","1mini.jpg",48,35,25,12,"女生喜欢用的半自动狙击枪");
INSERT INTO pu_weapon VALUES(null,3,"信号枪","3xhq.jpg",48,35,25,12,"召唤空投");
INSERT INTO pu_weapon VALUES(null,2,"AKM","2AKM.jpg",48,35,25,12,"强");
INSERT INTO pu_weapon VALUES(null,2,"DP-28","2DP-28.jpg",48,35,25,12,"子弹多");
INSERT INTO pu_weapon VALUES(null,2,"m416","2m416.jpg",48,35,25,12,"人气最高");
INSERT INTO pu_weapon VALUES(null,2,"QBZ","2qbz.jpg",48,35,25,12,"强");
INSERT INTO pu_weapon VALUES(null,2,"SCAR_L","2SCAR-L.jpg",48,35,25,12,"强");
INSERT INTO pu_weapon VALUES(null,1,"M24","1m24.jpg",48,35,25,12,"强");
INSERT INTO pu_weapon VALUES(null,1,"sks","1sks.jpg",48,35,25,12,"强");
INSERT INTO pu_weapon VALUES(null,1,"vss","1vss.jpg",48,35,25,12,"强");
INSERT INTO pu_weapon VALUES(null,1,"win94","1win94.jpg",48,35,25,12,"强");
INSERT INTO pu_weapon VALUES(null,1,"mk14","1mk14.jpg",48,35,25,12,"强");
INSERT INTO pu_weapon VALUES(null,1,"QBU","1qbu.jpg",48,35,25,12,"强");
INSERT INTO pu_weapon VALUES(null,1,"SLR","1slr.jpg",48,35,25,12,"强");
INSERT INTO pu_weapon VALUES(null,2,"AUG","2AUG.jpg",48,35,25,12,"强");
INSERT INTO pu_weapon VALUES(null,2,"DP-28","2DP-28.jpg",48,35,25,12,"强");
INSERT INTO pu_weapon VALUES(null,2,"G36C","2G36c.jpg",48,35,25,12,"强");
INSERT INTO pu_weapon VALUES(null,2,"M164A","2M164A.jpg",48,35,25,12,"强");
INSERT INTO pu_weapon VALUES(null,2,"M762","2M762.jpg",48,35,25,12,"强");
INSERT INTO pu_weapon VALUES(null,2,"MK47","2Mk47.jpg",48,35,25,12,"强");
INSERT INTO pu_weapon VALUES(null,2,"QRUZA","2QRUZA.jpg",48,35,25,12,"强");
INSERT INTO pu_weapon VALUES(null,4,"MP5K","4MP5K.jpg",48,35,25,12,"强");
INSERT INTO pu_weapon VALUES(null,4,"汤姆逊","4tmx.jpg",48,35,25,12,"强");
INSERT INTO pu_weapon VALUES(null,4,"UMP45","4UMP45.jpg",48,35,25,12,"强");
INSERT INTO pu_weapon VALUES(null,4,"UZI","4uzi.jpg",48,35,25,12,"强");
INSERT INTO pu_weapon VALUES(null,4,"Vector","4Vector.jpg",48,35,25,12,"强");
INSERT INTO pu_weapon VALUES(null,4,"野牛","4yeniu.jpg",48,35,25,12,"强");
INSERT INTO pu_weapon VALUES(null,5,"S12K","5s12k.jpg",48,35,25,12,"强");
INSERT INTO pu_weapon VALUES(null,5,"S686","5s686.jpg",48,35,25,12,"强");
INSERT INTO pu_weapon VALUES(null,5,"S1897","5s1897.jpg",48,35,25,12,"强");
INSERT INTO pu_weapon VALUES(null,3,"P18C","3p18c.jpg",48,35,25,12,"强");
INSERT INTO pu_weapon VALUES(null,3,"P92","3p92.jpg",48,35,25,12,"强");
INSERT INTO pu_weapon VALUES(null,3,"P1911","3p1911.jpg",48,35,25,12,"强");
INSERT INTO pu_weapon VALUES(null,3,"R45","3R45.jpg",48,35,25,12,"强");
INSERT INTO pu_weapon VALUES(null,3,"R1895","3r1895.jpg",48,35,25,12,"强");
INSERT INTO pu_weapon VALUES(null,3,"沙漠之鹰","3smzy.jpg",48,35,25,12,"强");
