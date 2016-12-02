import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart' as io;
import 'package:shelf_route/shelf_route.dart';
import 'package:sqljocky/sqljocky.dart';
import 'dart:core';
import 'dart:io';

final DATA_FILE="E:\\dart\\project\\team1exercise\\bin\\user.json";

final _headers={"Access-Control-Allow-Origin":"*",
  "Access-Control-Allow-Methods": "POST, GET, OPTIONS",
  "Access-Control-Allow-Headers":"Origin, X-Requested-With, Content-Type, Accept"};

var pool = new ConnectionPool(host: "localhost", port: 3306, user:'root', password:'wqwtsr', db: 'database', max: 5);//与数据库相连


void main() {
  var myRouter = router()
    ..get('/', ToHomePage)
    ..get('/login', ToLogIn)

    ..get('/match', ToMatchPage)
    ..get('/calculate', ToCalculatePage)
    ..get('/fanchart', FanChart)
    ..get('/tablemenu', TableMenu)


    ..post('/signup', ToSignUp);

  io.serve(myRouter.handler, '127.0.0.1', 8080);
}

//从数据库取出数据（用户登录时）
ToLogIn(request) async {
  var _1userdata =new Map<String,String>();
  var userdata=new List();
  var usersdata=new Map<String,String>();
  var data=await pool.query('select username,userid,password from user');

  await data.forEach((row) {
    _1userdata={'"Username"':'"${row.username}"','"Userid"':'"${row.userid}"','"Password"':'"${row.password}"'};//按照这个格式存放单条数据
    userdata.add(_1userdata);//将该数据加入数组中
  });

  usersdata={'"User"':userdata};
  return (new Response.ok(usersdata.toString(),headers: _headers));
}


ToSignUp(request)async{
  //注册数据写入数据库
  var query = await pool.prepare('insert into user (username, userid, password) values (?, ?, ?)');
  var result = await query.execute(['王巍', 21, '19960226']);
  print("New user's name: ${result.insertId}");
}



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
}