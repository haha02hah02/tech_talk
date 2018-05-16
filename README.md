tech_talk
=======
Help Adventure Story to open source it
基于Adventure 1.0.5  进行破解

AdventureStory 破解指南
======

该项目使用Cocos for lua 进行编写
程序主要脚本通过luac 编译之后进行以下加密操作,解密操作使用相同的方法   
```c
密钥
uint_8 key[] = {
      0xA1, 0xA4, 0xA7, 0xAA, 0xAD, 0xB1, 0xB4, 0xB7, 0xBA, 0xBD, 0xC1, 0xC4, 0xC7, 0xCA, 0xCD, 0xD1, 0xD4
};
uint_8 *fileBuffer;
for (int i = 0; i < fileBuffer.length; i++) 
{
    fileBuffer[i] = (uint_8) (fileBuffer[i] ^ key[i % 0x11]);
}
```
网络通信使用RESTful 风格API，通信走HTTP协议，将数据通过过自定义加密之后进行传输
加密方式：
```java
int rand1 = rand() % 128;
int rand2 = rand() % 128;

byte[] bs = str.getBytes();
byte[] encodeByte = new byte[bs.length + 2];

encodeByte[0] = (byte) (rand1 ^ 0xA1);
encodeByte[1] = (byte) (key[(rand1 % 0x11) & 0x0FF] ^ rand2);

for (int i = 2; i < bs.length + 2; i++, rand2++) {
  int index = (rand2 % 0x11);
  encodeByte[i] = (byte) (bs[i - 2] ^ key[index]);
}
String outStr = new String(encodeBase64(encodeByte));
```
解密方式：
```java
byte[] base64 = Base64.decodeBase64(input.getBytes());
rand1 =  (base64[0] ^ 0xA1) & 0x0FF;
rand2 =  (base64[1] ^ funneyBox[rand1 % 0x11]) & 0x0FF;

byte decodeDatas[] = new byte[base64.length - 2];
for (int i = 0; i < base64.length - 2; i++, rand2++) {
  int index = rand2 % 0x11;
  decodeDatas[i] = (byte) (base64[i + 2] ^ funneyBox[index]);
}
String string = new String(decodeDatas);
return  new String(decodeDatas);
```
具体的实现参考Server端的实现


Server描述：
======
#### Server端使用SpringMVC +Spring 实现，项目使用Maven进行管理，由于时间关系数据库直接使用JDBC进行实现。RESETful风格的API。
#### 当前的Server实现了登录-创建角色-进入游戏的功能。大致架构已经成型，如需更多功能，请读者自己实现其余接口。如需抓包通过Server端的test方法进行代理访问remote服务器

## API
#### 接口实现：参考客户端发过来的数据进行模拟，Server返回给客户端的数据在部分API上有对应的描述，参考并设计数据库表即可。

Client描述：
======
#### 客户端稍后上传，如果有adventure客户端的读者可以自行尝试。
1. 在 Client/Script 下为当前项目所有的脚本，由luac反编译获得，由于反编译的不确定性，部分需要自己修复语法之后再次编译即可。
2. 反编译使用unluac即可。 java -jar unluac.jar testin.nts > testout.lua.
3. 当前程序使用了签名校验的机制，因此需要替换对应的签名。签名描述记录在了Config.lua中，在加载Security.lua中描述了详细的签名校验过程。
因此在加载Security.lua之前修改掉Config.lua中的签名即可。具体参考FixedScript/Security.lua 和 FixedScript/Hook.lua的实现
4. 重定向URL ，重定向当前APP的服务端地址，在Main.lua中直接修改即可，参考FixedScript中对应的实现即可
5. 修改上述脚本之后，通过luac -s -o 进行编译 ，编译完成之后进行加密操作并修改后缀为.nts，最后替换到APK对应目录后、然后进行重打包操作。切记签名的一致性。
简单操作可以使用APKDB。




感想
=====

>本人呢，和作者一样是程序员，可能相比较老一点儿。曾经也是冒险岛骨灰玩家，当年手头几个200多级号，要是能找回账户，应该还是一身神装啊，哈哈哈哈。最近阴差阳错发现有人做了手游，就找来玩了玩，又接道儿知道了这个，中间发生了点有意思的事情。算是都有所了解吧，看了看包，看了看代码，又看到了作者的远思，嗯～怎么说呢，逼我发帖。
>
>首先我想说，没有多人在线，冒险岛就没了精髓。我不懂这种单机有什么可玩的。100块的游戏啊！我是真的玩不起！加点钱我去玩COD了。
>
>重点说说这个……远思吧。
>
>单机游戏破解难，嗯～这个同意！100块的游戏居然做不好防破解？大神真是该谦虚的时候一点不客气，可是这个价格……是不是就太不谦虚了，不过也是……谦虚伤钱。
>
>有人给我说你吃相不雅，也有人发帖喷觉得要价高。我就是觉得的，app store大作也没有几个要100块高价的游戏，想必号称人均赞助100块的昂贵服务器仅仅用来下发几个玩家的配置数据真是有点浪费了。
>
>可是吃相不雅又谎话连篇，就过分了吧！用aws的vps服务器欺骗玩家说服务器多少来着？3800一个月？这个价格我可能记错了。不过这么好的服务器为啥还用Github来下发补丁？？？https://github.com/Norzt/AdventureStory/ 补丁还是zip格式的？？？哈哈 能说啥呢？。哎，为了控制玩家数据做了联网，用以上传下发玩家角色数据来达到赚的目的，吃相很雅观？作者做这个玩意儿明摆着就为了挣钱，口口声声说不为了赚钱，何必这么虚伪呢，大方点儿多好，明码标价改装备多少钱不就行了，不然你做个伪网游控制玩家数据干嘛呢，还不如阉掉联网功能，不用租号称那么贵的服务器了，玩家就不用赞助服务器了不是，皆大欢喜，多好！哦，提醒一句，你确定你的操作不违规？不违法？！小心一点，别会写几行破代码就不知道自己是谁了。
>
>加固？还市面上价格……我也是彻底无语了，自己不会学啊，玩家数据在你面前是什么？抓了包之后，看看你那些明明白白的段表，代码……想吐！一点工作都没做……是不是想坑钱想得太着急了？看完你的东西，觉得你也就这点能耐……
>
```json
{
  "code": 0,
  "data": [
    "insert.into.Account{serial = 1,name = 'xxx@qq.com',password = '17330F18BDC8483700B1A55E10248899BF1DF243',invitation = '',sex = 1,gm = false,ip = '183.x.x.x',version = 100003,ctime = 1520178329,sign_time = 1526256000,last_time = 1526289910,ban = false,ban_time = 0,check_code = '',}",
    "insert.into.Userinfo{serial = 1,name = 'xxx',belong = 1,hp = 3992,mp = 420,exp = 0,body = 2000,hair = 35550,face = 20035,eardrop = 1032021,cap = 1004472,longcoat = 1053116,shoes = 1072189,glove = 1082685,cape = 1102801,weapon = 1702170,job = 100,map = 100000000,rmap = 100000100,ctime = 0,mtime = 1526039913,check_code = '',}",
    "insert.into.Userinfo{serial = 2,name = 'xxx',belong = 1,hp = 727,mp = 85,exp = 61793,body = 2000,hair = 35280,face = 20000,eardrop = 1032003,cap = 1003847,coat = 1040041,pants = 1060060,shoes = 1072007,glove = 1082001,weapon = 1432013,job = 530,map = 105070300,ctime = 0,mtime = 1522595861,check_code = '',}",
    "insert.into.Integral{serial = 1, belong = 1, quantity = 2910, limit = 0, provenance = 'system', check_code = '0044bd555a0551f169b88fd280c45a6866e4f8e0'}",
    "insert.into.Integral{serial = 2, belong = 1, quantity = 8772, limit = 1, provenance = 'system', check_code = '17b025264b0684c42dbbd27791ce99c5c3cc19e2'}",
    "update.config.value{SystemExpMultiple = 0, SystemDropMultiple = 0}"
  ],
  "mask": 1368326100
}
```

>哦……还有道高一尺 魔高一丈，你没有一丈的高度我是确定的了，有没有一尺…………也很怀疑！
>
>你要做联网了！？你不是鄙夷那个别的手机冒险岛是私服吗？你确定你这个玩意儿做全程联网就没问题？不对，你确定你又这个能耐做出来？说真的，别人的东西，真的就比你的好太多了，既然是做技术的，就要尊重技术，看清现实……看你的东西，我觉得给你1年，你也做不出来的样子，就算cocos和lua。
>
>年轻人，谦虚一点，老老实实，别侮辱了冒险岛。




