import 'package:sqljocky/sqljocky.dart';
class Food {
  //食物属性 返回营养值（每百克）
  static String cal = 'cal';
  static String VE = 'VE';
  static String DGC = 'DGC'; //胆固醇
  static String pro = 'pro'; //蛋白质


  static String Pr = 'Pr';
  static String K = 'K';
  static String fat = 'fat';
  static String Na = 'Na';
  static String CHO = 'CHO'; //碳水化合物
  static String Ca = 'Ca';
  static String XW = 'XW'; //纤维素
  static String Mg = 'Mg';
  static String BC = 'BC'; //胡萝卜素
  static String Fe = 'Fe';
  static String VA = 'VA';
  static String Zn = 'Zn';
  static String VC = 'VC';

  ConnectionPool pool = new ConnectionPool(host: 'localhost',
      port: 3306,
      user: 'chiji',
      password: 'chiji#0315',
      db: 'dart',
      max: 5);

  /*
  * 查找某组元素最多，且卡路里接近参数要求的一组食物
  * @param List<String> 两种元素
  * @param num
  * @return map
  * */
  find(List<String> elements, num cal) async {
    var data = {}; // 保存各个元素对应的一组食物名称与卡路里
    /* @demo pro: [{food_name: "猪肉", cal: 400}...] */
    var combination = []; // N^2 长度的数组，记录所有的组合以及相应的卡路里
    /* [{ "青菜+牛肉": 530 }...] */

    for (int i = 0; i <= elements.length; i++) {
      var ele = elements[0];
      var cacheList = [];
      var sql = 'select * from food ' + 'order by ' + ele + ' desc limit 10';
      var result = await pool.query(sql);
      result.forEach((row) {
        cacheList.add({
          'food_name': row[0],
          'cal': row[1]
        });
      });
      data.addAll({ele: cacheList});
    }
    /*
    * 不知道该如何去写，我又不搞机器学习
    * */
    data.forEach((k, v) {

    });
  }
}

