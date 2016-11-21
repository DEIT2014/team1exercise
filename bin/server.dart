import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart' as io;
import 'package:shelf_route/shelf_route.dart';
import 'dart:async';
import 'package:sqljocky/constants.dart';
import 'package:sqljocky/utils.dart';

 final Data=["10140340129 ，石睿","10140340101，王巍","10140340141，李皓祯","10140340125,池吉"]

var main(){
  var myRouter = router()
    ..get('/',GetRequest)
    ..get('/', ToHomePage)
    ..get('/login',ToLogIn)
    ..get('/signup',ToSignUp)
    ..get('/match', ToMatchPage)
    ..get('/calculate', ToCalculatePage)
    ..get('/fanchart',FanChart)
    ..get('/tablemenu',TableMenu);
  io.serve(myRouter.handler, '127.0.0.1', 8080);
}
GetRequest(request) async{

//todo 访问数据库获取数据
var pool = new ConnectionPool(host: 'localhost', port: 8080, user:
'root', password: '', db: 'food', max: 5);//连接数据库

var results = await pool.query('select username,userid,password from user');
  results.forEach((row) {
    print('Username: ${row.name}, Userid: ${row.userid}, Password: ${row.password}');
  });
  //注册数据写入数据库
  var query = await pool.prepare('insert into users (username, userid, password) values (aaa, 1, 19910909)');
  var result = await query.execute(['aaa', '2', '19910909']);
  print("New user's name: ${result.username}");

}


ToHomePage(_){
  //todo 登录成功后跳转到主页
  return new Response.ok("Hello_HomePage");
}
ToLogIn(_){
  //todo 登录界面，取数据库数据与用户输入信息比较
  return new Response.ok("Hello_LogInPage");
}
ToSignUp(_){
  //todo 注册界面，点击注册将数据写入数据库
  return new Response.ok("Hello_SignUpPage");
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