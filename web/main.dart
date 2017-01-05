// Copyright (c) 2016, <your name>. All rights reserved. Use of this source code

// is governed by a BSD-style license that can be found in the LICENSE file.
import 'dart:html';
import 'dart:core';
import 'dart:convert' show JSON;
import 'package:route_hierarchical/client.dart';
import 'dart:async';
import 'package:jsonx/jsonx.dart';

InputElement login_username; //登录界面的用户名变量
InputElement login_password; //登录界面的密码变量

InputElement signup_username; //注册界面的用户名变量
InputElement signup_password; //注册界面的密码变量
InputElement signup_confirmpw; //注册界面确认密码的变量

CheckboxInputElement select_element; //用户选择所需元素
CheckboxInputElement signup_taboo1; //用户注册页面选择忌口食物

CheckboxInputElement signup_taboo2;
CheckboxInputElement signup_taboo3;
CheckboxInputElement signup_taboo4;

CheckboxInputElement beef; //用户开始计算模块选择食物
CheckboxInputElement pork;
CheckboxInputElement chicken;
CheckboxInputElement mutton;
CheckboxInputElement potato;
CheckboxInputElement tomato;
CheckboxInputElement bamboo;
CheckboxInputElement rape;
CheckboxInputElement rice;
CheckboxInputElement corn;
CheckboxInputElement bread;
CheckboxInputElement egg;
TextAreaElement chosen_area; //开始计算版块选择食物区域

InputElement quantity; //用户选择食物重量

TextAreaElement calculate_result; //开始计算热量结果

var Beef_Num;
var Pork_Num;
var Chicken_Num;
var Mutton_Num;
var Potato_Num;
var Tomato_Num;
var Bamboo_Num;
var Rape_Num;
var Rice_Num;
var Corn_Num;
var Bread_Num;
var Egg_Num;

String Beef_Chosen;
String Pork_Chosen;
String Chicken_Chosen;
String Mutton_Chosen;
String Potato_Chosen;
String Tomato_Chosen;
String Bamboo_Chosen;
String Rape_Chosen;
String Rice_Chosen;
String Corn_Chosen;
String Bread_Chosen;
String Egg_Chosen;

var localhost = "http://127.0.0.1:8080";

void main() {
  /// 登录界面
  document
      .querySelector('#LogIn_div')
      .style
      .display = "block";
  document
      .querySelector('#Signup_div')
      .style
      .display = "none";
  document
      .querySelector('#Homepage_div')
      .style
      .display = "none";
  login_username = querySelector('#LogIn_Username'); //输入用户名
  login_password = querySelector('#LogIn_Password'); //输入密码
  var router = new Router(useFragment: true);
  router.root
    ..addRoute(name: 'tosignup', path: '/signup', enter: ToSignUp)
    ..addRoute(name:'home',path:'/',enter: (_) => null);
  querySelector("#SignUp_Btn1").attributes['href'] = router.url('tosignup');
  router.listen();//显示用户注册界面
  querySelector("#LogIn_Btn1").onClick.listen(LogIn);

  /// 注册界面
  signup_username = querySelector('#SignUp_Username'); //输入用户名
  signup_password = querySelector('#SignUp_Password'); //输入密码
  signup_confirmpw = querySelector('#SignUp_ConfirmPW'); //确认密码
  querySelector("#SignUp_Btn2").onClick.listen(SignUp); //用户注册按钮

  signup_taboo1 = querySelector('#signup_taboo1'); //选择忌口食物
  signup_taboo2 = querySelector('#signup_taboo2');
  signup_taboo3 = querySelector('#signup_taboo3');
  signup_taboo4 = querySelector('#signup_taboo4');


  ///APP主页开始搭配界面
/*querySelector('#Select_Element')
    ..text ='元素'
    ..onClick.listen(Checkbox_Element); //用户选择所需元素
  select_calory = querySelector('#Select_Calory')
    ..text ='热量'
    ..onClick.listen(Checkbox_Calory); //用户选择热量控制范围
  select_taboo2 = querySelector('#Select_Taboo2')
    ..text ='忌口食物'
    ..onClick.listen(Checkbox_Taboo2); //用户选择忌口食物
  querySelector('#ToMatch_Btn')
    ..text = '开始搭配'
    ..onClick.listen(GetFoodMenu) //开始搭配返回食谱
    ..onClick.listen(GetFanChart);*/

  ///APP主页开始计算页面
  beef = querySelector('#beef'); //用户选择食物
  pork = querySelector('#pork');
  chicken = querySelector('#chicken');
  mutton = querySelector('#mutton');
  potato = querySelector('#potato');
  tomato = querySelector('#tomato');
  bamboo = querySelector('#bamboo');
  rape = querySelector('#rape');
  rice = querySelector('#rice');
  corn = querySelector('#corn');
  bread = querySelector('#bread');
  egg = querySelector('#egg');
  chosen_area = querySelector('#Chosen_Area'); //开始计算版块选择食物区域
  calculate_result = querySelector('#Calculate_Result');
  quantity = querySelector('#Quantity');
  querySelector('#Calculate_Btn').onClick.listen(GetCalNum); //开始计算返回热量总值
  querySelector('#Add_Btn').onClick.listen(AddFood); //开始计算返回热量总值
}

/// 用来接受用户点击开始计算版块的添加按钮的响应工作
/// 参数[event]是鼠标事件....
void AddFood(MouseEvent event) {

  if (beef.checked) {
    Beef_Chosen = beef.value;
    Beef_Num = quantity.value;
    chosen_area.appendText(Beef_Chosen.toString() + Beef_Num.toString() + "克" + "\n");

  }
  if (pork.checked) {
    Pork_Chosen = pork.value;
    Pork_Num = quantity.value;
    chosen_area.appendText(Pork_Chosen.toString() + Pork_Num.toString() + "克" + "\n");

  }
  if (chicken.checked) {
    Chicken_Chosen = chicken.value;
    Chicken_Num = quantity.value;
    chosen_area.appendText(Chicken_Chosen.toString() + Chicken_Num.toString() + "克" + "\n");

  }
  if (mutton.checked) {
    Mutton_Chosen = mutton.value;
    Mutton_Num = quantity.value;
    chosen_area.appendText(Mutton_Chosen.toString() + Mutton_Num.toString() + "克" + "\n");

  }
  if (potato.checked) {
    Potato_Chosen = potato.value;
    Potato_Num = quantity.value;
    chosen_area.appendText(Potato_Chosen.toString() + Potato_Num.toString() + "克" + "\n");

  }
  if (tomato.checked) {
    Tomato_Chosen = tomato.value;
    Tomato_Num = quantity.value;
    chosen_area.appendText(Tomato_Chosen.toString() +Tomato_Num.toString() + "克" + "\n");

  }
  if (bamboo.checked) {
    Bamboo_Chosen = bamboo.value;
    Bamboo_Num = quantity.value;
    chosen_area.appendText(Bamboo_Chosen.toString() +Bamboo_Num.toString() + "克" + "\n");

  }
  if (rape.checked) {
    Rape_Chosen = rape.value;
    Rape_Num = quantity.value;
    chosen_area.appendText(Rape_Chosen.toString() + Rape_Num.toString() + "克" + "\n");

  }
  if (rice.checked) {
    Rice_Chosen = rice.value;
    Rice_Num = quantity.value;
    chosen_area.appendText(Rice_Chosen.toString() +Rice_Num.toString() + "克" + "\n");

  }
  if (corn.checked) {
    Corn_Chosen = corn.value;
    Corn_Chosen = quantity.value;
    chosen_area.appendText(Corn_Chosen.toString() + Corn_Chosen.toString() + "克" + "\n");

  }
  if (bread.checked) {
    Bread_Chosen = bread.value;
    Bread_Num = quantity.value;
    chosen_area.appendText(Bread_Chosen.toString() + Bread_Num.toString() + "克" + "\n");

  }
  if (egg.checked) {
    Egg_Chosen = egg.value;
    Egg_Num = quantity.value;
    chosen_area.appendText(Egg_Chosen.toString() + Egg_Num.toString() + "克" + "\n");

  }
  beef.checked = false;
  pork.checked = false;
  chicken.checked = false;
  mutton.checked = false;
  potato.checked = false;
  tomato.checked = false;
  bamboo.checked = false;
  rape.checked = false;
  rice.checked = false;
  corn.checked = false;
  bread.checked = false;
  egg.checked = false;
  quantity.value = "";
}

/// 用来接受用户点击开始计算按钮以后的响应工作
/// 参数[event]是鼠标事件....
void GetCalNum(MouseEvent event) {
  var request = HttpRequest.getString("http://127.0.0.1:8080/calculate").then(
      toCalculate);
}

void toCalculate(responseText) {
  var jsonString = responseText;
  var fooddata = JSON.decode(jsonString);
  var food = fooddata["Food"];
  int number = 0;
  for (var x in food) {
    if (x["Foodname"] ==Beef_Chosen) {
      var beefcal=double.parse(x["Calory"]);
      number +=beefcal*int.parse(Beef_Num);
    }
    if (x['Foodname'] == Pork_Chosen) {
      var porkcal=double.parse(x["Calory"]);
      number +=porkcal * int.parse(Pork_Num);
    }
    if (x['Foodname'] == Chicken_Chosen) {
      var chickencal=double.parse(x["Calory"]);
      number +=chickencal * int.parse(Chicken_Num);
    }

    if (x['Foodname'] == Mutton_Chosen) {
      var muttoncal=double.parse(x["Calory"]);
      number +=muttoncal * int.parse(Mutton_Num);
    }
    if (x["Foodname"] ==Potato_Chosen) {
      var potatocal=double.parse(x["Calory"]);
      number +=potatocal*int.parse(Potato_Num);
    }
    if (x['Foodname'] == Tomato_Chosen) {
      var tomatocal=double.parse(x["Calory"]);
      number +=tomatocal * int.parse(Tomato_Num);
    }
    if (x['Foodname'] == Bamboo_Chosen) {
      var bamboocal=double.parse(x["Calory"]);
      number +=bamboocal * int.parse(Bamboo_Num);
    }
    if (x['Foodname'] == Rape_Chosen) {
      var rapecal=double.parse(x["Calory"]);
      number +=rapecal * int.parse(Rape_Num);
    }
    if (x['Foodname'] == Rice_Chosen) {
      var ricecal=double.parse(x["Calory"]);
      number +=ricecal * int.parse(Rice_Num);
    }
    if (x['Foodname'] == Corn_Chosen) {
      var corncal=double.parse(x["Calory"]);
      number +=corncal * int.parse(Corn_Num);
    }
    if (x['Foodname'] == Bread_Chosen) {
      var breadcal=double.parse(x["Calory"]);
      number +=breadcal * int.parse(Bread_Num);
    }
    if (x['Foodname'] == Egg_Chosen) {
      var eggcal=double.parse(x["Calory"]);
      number +=eggcal * int.parse(Egg_Num);
    }
  }
  calculate_result.value =number.toString();
}




void ToSignUp(RouteEvent e) {
  document
      .querySelector('#Signup_div')
      .style
      .display = "block";
  document
      .querySelector('#LogIn_div')
      .style
      .display = "none";
}
void LogInOk(RouteEvent e) {
  document
      .querySelector('#Homepage_div')
      .style
      .display = "block";
  document
      .querySelector('#LogIn_div')
      .style
      .display = "none";
}
void SignUpOk(RouteEvent e) {
  document
      .querySelector('#LogIn_div')
      .style
      .display = "block";
  document
      .querySelector('#Signup_div')
      .style
      .display = "none";
}

/// 用来接受用户点击登录按钮以后的响应工作
/// 参数[event]是鼠标事件....
///   //todo 将用户键入的用户名密码与数据库中用户信息表user比较
//todo 若对比成功，隐藏登录界面，显示App主页
void LogIn(MouseEvent event) {
  var request = HttpRequest.getString("http://127.0.0.1:8080/login").then(
      onLogIn);
}
void onLogIn(responseText) {
  var jsonString = responseText;
  var userinfo = JSON.decode(jsonString);
  var userinfolist = userinfo["Userinfo"];
  int a = 0;
  for (var x in userinfolist) {
    if (x["UserName"] == login_username.value) {
      if (x["Password"] == login_password.value) {
        a = 1;
      }
    }
  }
  if (a == 0) {
    querySelector("#SignUp_Btn1").text = "登录失败！";
  }
  if (a == 1) {
    querySelector("#LogIn_Btn1").text = "登录成功！";
    var router = new Router(useFragment: true);
    router.root
      ..addRoute(
          name: 'login',
          path: '/login',
          enter: LogInOk);
    querySelector('#LogIn_Btn1').attributes['href'] =
        router.url('login');
    router.listen();
/*    querySelector("#SignUp_Btn1").text = "登录成功！";*/
  }
}


/*void tosignup(RouteEvent e) {
  document.querySelector('#Signup_div').style.display="block";
  document.querySelector('#LogIn_div').style.display="none";

}*/
void SignUp(MouseEvent event) {
  //todo 将用户键入的用户名密码加入数据库
  var SignUpUsername = signup_username.value;
  var SignUpPassword = signup_password.value;
  var SignUpConfirpw = signup_confirmpw.value;
  var SignUp_Taboo1;
  var SignUp_Taboo2;
  var SignUp_Taboo3;
  var SignUp_Taboo4;
  if (signup_taboo1.checked) { SignUp_Taboo1 = signup_taboo1.value;}
  if (signup_taboo2.checked) { SignUp_Taboo2 = signup_taboo2.value;}
  if (signup_taboo3.checked) { SignUp_Taboo3 = signup_taboo3.value;}
  if (signup_taboo4.checked) { SignUp_Taboo4 = signup_taboo4.value;}
  if (SignUpUsername == '' || SignUpPassword == '' || SignUpConfirpw == '') {
    querySelector("#SignUp_Btn2").text = "用户名和密码不能为空！";
  }
  //if(SignUpUserName!=null && SignUpPassword!=null && SignUpConPassword!=null)
  else {
    if (signup_password.value == signup_confirmpw.value) {
      Map data = {
        "Username":'${SignUpUsername}',
        "Password":'${SignUpPassword}',
        "Taboo" : ''
      };
      if (signup_taboo1.checked) { SignUp_Taboo1 = signup_taboo1.value;data.addAll({"Taboo":SignUp_Taboo1});}
      if (signup_taboo2.checked) { SignUp_Taboo2 = signup_taboo2.value;  data.addAll({"Taboo":SignUp_Taboo2});}
      if (signup_taboo3.checked) { SignUp_Taboo3 = signup_taboo3.value; data.addAll({"Taboo":SignUp_Taboo3});}
      if (signup_taboo4.checked) { SignUp_Taboo4 = signup_taboo4.value; data.addAll({"Taboo":SignUp_Taboo4});}
      var jsonData = JSON.encode(data);
      HttpRequest request = new HttpRequest();
      //add a event handler that is called when the request is finished
      request.onReadyStateChange.listen((_) {
        if (request.readyState == HttpRequest.DONE &&
            (request.status == 200 || request.status == 0)) {
          if (request.responseText == 'success') {
            var router2 = new Router(useFragment: true);
            router2.root
              ..addRoute(
                  name: 'signup',
                  path: '/signup',
                  enter: SignUpOk);
            querySelector('#SignUp_Btn2').attributes['href'] =
                router2.url('signup');
            router2.listen();
          }
          else {
            querySelector("#SignUp_Btn2").text = "该用户已注册，请重新注册";
          }
        }
      });
      //post data to the server
      var url = "http://127.0.0.1:8080/signup";
      request.open("POST", url, async: false);
      request.send(jsonData);
      querySelector("#SignUp_Btn2").text = "注册成功！";
      //显示注册成功界面
    }
    else {
      querySelector("#SignUp_Btn2").text = "两次输入密码不同，请重新输入！";
    }
  }
}


/*
  void Checkbox_Calory(MouseEvent event) {
    //todo 设置数值
    //todo 将用户控制热量范围赋值给变量做约束条件
  }

  /// 开始搭配中用户选择所需营养元素
  void Checkbox_Element(MouseEvent event) {
    //todo 勾选复选框
    // todo 将用户所需营养元素赋值给变量做约束条件
  }


  ///APP主页中用户选择忌口食物
  void Checkbox_Taboo2(MouseEvent event) {
    //todo 勾选复选框
    // todo 将用户忌口食物赋值给变量做约束条件
  }

  /// 接受用户点击开始搭配按钮的响应
  /// 参数[event]是鼠标事件....
  void GetFoodMenu(MouseEvent event) {
    //todo 隐藏APP主页，显示开始搭配菜谱页面
  }

  /// 显示扇形图
  void GetFanChart(MouseEvent event) {
    //todo 取出数据库的数据
    // todo 根据数据库数据与Json文件数据计算所含元素比例并返回扇形图
  }

/// 接受用户点击开始计算按钮的响应
/// 开始计算中用户选择食物
  void Checkbox_Food(MouseEvent event) {
    //todo 选择下拉菜单
    // todo 将用户选择的食物写入Json文件
  }

  /// 开始计算中用户选择食物重量
  void Checkbox_Quantity(MouseEvent event) {
    //todo 设置数值
    //todo 将用户设置的食物重量写入Json文件
  }

  /// 接受用户点击开始计算的按钮的响应
  /// 参数[event]是鼠标事件....
  void GetCalNum(MouseEvent event) {
    //todo 从数据库中取出相应数据
    //todo 根据数据库数据与Json文件数据计算热量值并返回
  }

*/





