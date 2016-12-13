import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart' as io;
import 'package:shelf_route/shelf_route.dart';
import 'package:sqljocky/sqljocky.dart';
import 'dart:core';
import 'dart:io';
import 'dart:convert';

final _headers={"Access-Control-Allow-Origin":"*",
  "Access-Control-Allow-Methods": "POST, GET, OPTIONS",
  "Access-Control-Allow-Headers":"Origin, X-Requested-With, Content-Type, Accept"};




void main() {
  var myRouter = router()
/*    ..get('/', ToHomePage)*/


/*    ..get('/match', ToMatchPage)
    ..get('/calculate', ToCalculatePage)
    ..get('/fanchart', FanChart)
    ..get('/tablemenu', TableMenu)


    ;*/
    ..post('/login', ToLogIn)
    ..post('/signup', ToSignUp);
  io.serve(myRouter.handler, '127.0.0.1', 8080);
}

//从数据库取出数据（用户登录时）
ToLogIn(request) async {
  request.readAsString().then(CompareData);
  return (new Response.ok('success!',headers: _headers));
}
CompareData(jsondata) async{
  var  username1;
  var password1;
  Map user1=JSON.decode(jsondata);
  username1=user1['Username'];
  password1=user1['Password'];
  var pool = new ConnectionPool(host: "localhost", port: 3306, user:'root', password:'wqwtsr', db: 'database', max: 5);//与数据库相连
  var data=await pool.query('select username,password from user ');


  var confirm=new Map<String,String>();
  await data.forEach((row) {
    if ("${row.username}" == username1 && "${row.password}" == password1)
      confirm = {'number':'1'};
    else confirm = {'number':'0'};
  });
  var ConfirmData = JSON.encode(confirm);
  return (new Response.ok(ConfirmData,headers: _headers));

}

ToSignUp(request)async{
  //注册数据写入数据库
  request.readAsString().then(InsertData);
  return (new Response.ok('success!',headers: _headers));

}
InsertData(data) async{
  var  newusername;
  var newpassword;
  Map newuser=JSON.decode(data);
  newusername=newuser['Username'];
  newpassword=newuser['Password'];
  //todo 将数据存入数据库
  var pool = new ConnectionPool(host: "localhost", port: 3306, user:'root', password:'wqwtsr', db: 'database', max: 5);//与数据库相连
  var query=await pool.prepare('insert into user (username,  password) values (?, ?)');
  var result=await query.execute([newusername,newpassword]);

}

/*


ToHomePage(_){
  //todo 登录成功后跳转到主页
  return new Response.ok("Hello_HomePage");
}



ToMatchPage(_){
  //todo 将数据写入Json文件并取出数据库数据联合处理数据
  //todo 点击开始搭配后进入开始搭配界面
  return new Response.ok("Hello_MatchPage");
}
ToCalculatePage(_){
  //todo 将数据写入Json文件并取出数据库数据联合处理数据，返回卡路里数值
  return new Response.ok("Hello_CalculatePage");
}
FanChart(_){
  //todo 将数据写入Json文件并取出数据库数据，返回扇形图
  return new Response.ok("Hello_FanChart");
}
TableMenu(_){
  //todo 将数据写入Json文件并取出数据库数据，返回搭配食谱
  return new Response.ok("Hello_TableMenu");
}*/
