import 'package:sqljocky/sqljocky.dart';

class Food{
  //食物属性 返回营养值（每百克）
  static String cal  = 'cal';
  static String VE = 'VE';
  static String DGC = 'DGC';//胆固醇
  static String pro = 'pro';//蛋白质
  static String Pr='Pr';
  static String K='K';
  static String fatK='fat';
  static String Na='Na';
  static String CHO='CHO';//碳水化合物
  static String Ca='Ca';
  static String XW='XW';//纤维素
  static String Mg='Mg';
  static String BC='BC';//胡萝卜素
  static String Fe='Fe';
  static String VA='VA';
  static String Zn='Zn';
  static String VC='VC';

  ConnectionPool pool = new ConnectionPool( host: 'localhost', port: 3306,
      user: 'jenny', password: 'weloveplay2016',
      db: 'dart', max: 5);

  /*
  * 查找某个元素最多的一种食物
  * @param String
  * @return map
  * sql多重排序
  * 加权 食物热量的设置　
  *
  * */


  find(List <String> elements,num cal) async{
    Map data;
    for (int i=0;i<elements.length;i++){
    String ele = elements[i];
    var sql = 'select food_name,cal from food ' + 'order by ' + ele + ' desc limit 10';
    data[ele]=await pool.query(sql);
    }
  }
}



