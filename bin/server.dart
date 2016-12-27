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


/*    ..get('/match', ToMatchPage)

    ..get('/fanchart', FanChart)
    ..get('/tablemenu', TableMenu)


    ;*/
    ..get('/login', ToLogIn)
    ..post('/signup', ToSignUp)
    ..get('/calculate',ToCalculate);
  io.serve(myRouter.handler, '127.0.0.1', 8080);

}
ToCalculate(request) async {
  var singledata=new Map<String,String>();//存放单个用户数据
  var alldata=new List();//存放所有用户的数据
  var finaldata=new Map<String,String>();//存放最终的用户数据
  var pool=new ConnectionPool(host: "localhost", port: 3306, user:'root', password:'wqwtsr', db: 'database', max: 5);
  var data=await pool.query('select foodname,calory from food');
  //下面这个语句比较慢，一定要等它
  await data.forEach((row){
    singledata={'"Foodname"':'"${row.foodname}"','"Calory"':'"${row.calory}"'};//按照这个格式存放单条数据
    alldata.add(singledata);//将该数据加入数组中
  });
  //将用户数据存入数组中
  finaldata={'"Food"':alldata};
  return (new Response.ok(finaldata.toString(),headers: _headers));
}
//从数据库取出数据（用户登录时）
ToLogIn(request) async {
  var singledata=new Map<String,String>();//存放单个用户数据
  var userdata=new List();//存放所有用户的数据
  var finaluserdata=new Map<String,String>();//存放最终的用户数据
  var pool=new ConnectionPool(host: "localhost", port: 3306, user:'root', password:'wqwtsr', db: 'database', max: 5);
  var data=await pool.query('select username,password,signup_taboo from user');
  //下面这个语句比较慢，一定要等它
  await data.forEach((row){
    singledata={'"UserName"':'"${row.username}"','"Password"':'"${row.password}"'};//按照这个格式存放单条数据
    userdata.add(singledata);//将该数据加入数组中
  });
  //将用户数据存入数组中
  finaluserdata={'"Userinfo"':userdata};
  return (new Response.ok(finaluserdata.toString(),headers: _headers));
}

ToSignUp(request)async{
  //注册数据写入数据库
  request.readAsString().then(InsertData);
  return (new Response.ok('success!',headers: _headers));

}
InsertData(data) async{
  var  newusername;
  var  newpassword;
  var  taboo;
  Map newuser=JSON.decode(data);
  newusername=newuser['Username'];
  newpassword=newuser['Password'];
  taboo=newuser['Taboo'];
  //todo 将数据存入数据库
  var pool = new ConnectionPool(host: "localhost", port: 3306, user:'root', password:'wqwtsr', db: 'database', max: 5);//与数据库相连
  var query=await pool.prepare('insert into user (username,password,signup_taboo) values (?, ?,?)');
  var result=await query.execute([newusername,newpassword,taboo]);

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
