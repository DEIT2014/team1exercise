import 'package:sqljocky/sqljocky.dart';

class Food{
  //食物属性 返回营养值（每百克）
  static String cal  = 'cal';
  static String VE = 'VE';
  static String DGC = 'DGC';//胆固醇
  static String pro = 'pro';//蛋白质
  static String Pr;
  static String K;
  static String fat;
  static String Na;
  static String CHO;//碳水化合物
  static String Ca;
  static String XW;//纤维素
  static String Mg;
  static String BC;//胡萝卜素
  static String Fe;
  static String VA;
  static String Zn;
  static String VC;

  ConnectionPool pool = new ConnectionPool( host: 'localhost', port: 3306,
      user: 'chiji', password: 'chiji#0315',
      db: 'dart', max: 5);

  /*
  * 查找某个元素最多的一种食物
  * @param String
  * @return map
  * */
  find(String ele) async{
    var sql = 'select * from food ' + 'order by ' + ele + ' desc limit 10';
    var data = await pool.query(sql);
    data.forEach((row) {
      print('Name: ${row[0]}, cal: ${row[1]}');
    });
  }


}
