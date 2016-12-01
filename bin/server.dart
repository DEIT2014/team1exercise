import 'package:shelf/shelf.dart';
import 'package:shelf_route/shelf_route.dart';
import 'dart:async';
import 'package:sqljocky/constants.dart';
import 'package:sqljocky/utils.dart';
import 'package:sqljocky/sqljocky.dart';
import 'dart:io';
import 'dart:convert';
import 'package:args/args.dart';
import 'package:shelf/shelf.dart' as shelf;
import 'package:shelf/shelf_io.dart' as io;
import 'package:shelf_cors/shelf_cors.dart' as shelf_cors;



Map<String, String> data = new Map();
var pool = new ConnectionPool(host: "localhost", port: 3306, user:'root', password:'wqwtsr', db: 'database', max: 5);//与数据库相连


main(List<String> args) async{






  var parser = new ArgParser()
    ..addOption('port', abbr: 'p', defaultsTo: '8080');
  var result = parser.parse(args);
  var port = int.parse(result['port'], onError: (val) {
    stdout.writeln('Could not parse port value "$val" into a number.');
    exit(1);
  });
/*    var myRouter = router()
    ..get('/',GetRequest)
    ..get('/', ToHomePage)
    ..get('/login',ToLogIn)
    ..get('/signup',ToSignUp)
    ..get('/match', ToMatchPage)
    ..get('/calculate', ToCalculatePage)
    ..get('/fanchart',FanChart)
    ..get('/tablemenu',TableMenu);*/

  var myRouter = router();
  myRouter.get('/login/{userid}', _echoUserLogin);
  myRouter.post('/signup ', _echoRequest);
  //配置cors参数
  Map <String, String> corsHeader = new Map();
  corsHeader["Access-Control-Allow-Origin"] = "*";
  corsHeader["Access-Control-Allow-Methods"] = 'POST,GET,OPTIONS';
  corsHeader['Access-Control-Allow-Headers'] =
  'Origin, X-Requested-With, Content-Type, Accept';
  var routerHandler = myRouter.handler;
  //配置shelf中间件和路由handle
  var handler = const shelf.Pipeline()
      .addMiddleware(shelf.logRequests())
      .addMiddleware(
      shelf_cors.createCorsHeadersMiddleware(corsHeaders: corsHeader))
      .addHandler(routerHandler);

  //启动服务器
  io.serve(handler, '127.0.0.1', 8080).then((server) {
    print('Serving at http://${server.address.host}:${server.port}');
  });
}
//从数据库取出数据
Future<String> getDataFromDb() async {
  var results = await pool.query('select username,userid,password from user');
  int i = 0;
  results.forEach((row) {
    //列出所有用户名
    String index1 = "Username" + i.toString();
    data[index1] = row.username;
    String index2 = "Userid" + i.toString();
    data[index2] = row.userid;
    String index3 = "Password" + i.toString();
    data[index3] = row.password;
    i++;
    print('Username: ${row.username}, Userid: ${row.userid}, Password: ${row.password}');
  });
  String jsonData = JSON.encode(data);
  return jsonData;

}

Future<shelf.Response> _echoUserLogin(shelf.Request request) async {
  //从数据库获取数据
  String userInfor = await getDataFromDb();
  //把这个post过来的数据有返回给客户端
  return new shelf.Response.ok(
      'server successfully get data from database: "${userInfor}');
}

Future<String>PostDataToDb() async{
  //注册数据写入数据库
  var query = await pool.prepare('insert into user (username, userid, password) values (?, ?, ?)');
  var result2 = await query.execute(['王巍', 25, '19910909']);
  print("New user's name: ${result2.insertId}");
}

Future<shelf.Response> _echoRequest(shelf.Request request) async {
  //接受post过来的数据
/*  String content = await request.readAsString();*/
  String content = await PostDataToDb();
  //把这个post过来的数据有返回给客户端
  return new shelf.Response.ok(
      'server susscefullly get the post data from client ');
}




GetRequest(request) async{

//todo 访问数据库获取数据

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