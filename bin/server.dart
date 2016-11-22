import 'package:shelf/shelf.dart';
import 'package:shelf_route/shelf_route.dart';


import 'package:sqljocky/sqljocky.dart';

main() async {
   //登录数据取出数据库
    var pool = new ConnectionPool(host: "localhost", port: 3306, user:'root', password:'', db: 'database', max: 5);//与数据库相连
    var results = await pool.query('select username,userid,password from user');
    results.forEach((row) {
      print('Username: ${row.username}, Userid: ${row.userid}, Password: ${row.password}');
    });
   //注册数据写入数据库
    var query = await pool.prepare('insert into users (username, userid, password) values (杨洋, 2, 19910909)');
    var result = await query.execute(['杨洋', '2', '19910909']);
    print("New user's name: ${result.username}");
    var myRouter = router()
    ..get('/', ToHomePage)
    ..get('/login',ToLogIn)
    ..get('/signup',ToSignUp)
    ..get('/match', ToMatchPage)
    ..get('/calculate', ToCalculatePage)
    ..get('/fanchart',FanChart)
    ..get('/tablemenu',TableMenu);
     io.serve(myRouter.handler, 'localhost', 8080);
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