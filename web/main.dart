// Copyright (c) 2016, <your name>. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.
import 'dart:html';
import 'dart:core';
import 'package:route_hierarchical/client.dart';
import 'dart:convert' show JSON;
import'dart:async';
var login_username;//登录界面的用户名变量
var login_password;//登录界面的密码变量
var signup_username;//注册界面的用户名变量
var signup_password;//注册界面的密码变量
var signup_confirmpw;//注册界面确认密码的变量
var select_element; //用户选择所需元素
var select_taboo1;//用户注册页面选择忌口食物
var select_taboo2;//用户APP主页选择忌口食物
var select_calory;//用户设定热量控制
var select_food;//用户选择食物
var select_quantity;//用户选择食物重量


var host="http://127.0.0.1:8080";
void main() {
  /// 登录界面
  login_username = querySelector('#LogIn_Username'); //输入用户名
  login_password = querySelector('#LogIn_Password'); //输入密码
/*  var router = new Router(useFragment: true);
  router.root
    ..addRoute(name: 'tosignup', path: '/tosignup', enter: ToSignUp);*/
/*    ..addRoute(name:'home',path:'/',enter: (_) => null);
  querySelector("#SignUp_Btn1").attributes['href'] = router.url('tosignup');
  router.listen();//显示用户注册界面*/
  querySelector("#LogIn_Btn1").onClick.listen(LogIn);

  /// 注册界面
  signup_username = querySelector('#SignUp_Username'); //输入用户名
/*  select_taboo1 = querySelector('#SignUp_Taboo1') //选择忌口食物
    ..text ='忌口食物'
   ..onClick.listen(Checkbox_Taboo1);*/
  signup_password = querySelector('#SignUp_Password'); //输入密码
  signup_confirmpw = querySelector('#SignUp_ConfirmPW'); //确认密码
  querySelector("#SignUp_Btn2").onClick.listen(SignUp);//用户注册按钮

/*  /// 注册成功界面
  querySelector('#SucSignUp_Btn')
    ..onClick.listen(ReturnSignIn); //返回登录界面按钮


  ///APP主页开始搭配界面
querySelector('#Select_Element')
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
    ..onClick.listen(GetFanChart);


///APP主页开始计算页面
  select_food = querySelector('#ChooseFood')
    ..text ='食物'
    ..onClick.listen(Checkbox_Food); //用户选择食物
  select_calory = querySelector('#FoodQuantity')
    ..text ='重量'
    ..onClick.listen(Checkbox_Quantity); //用户选择食物重量
  querySelector('#ToCalculate_Btn')
    ..text = '开始计算'
    ..onClick.listen(GetCalNum); //开始计算返回热量总值*/


}
/// 用来接受用户点击登录按钮以后的响应工作
/// 参数[event]是鼠标事件....
void LogIn(MouseEvent event) {
  //todo 将用户键入的用户名密码与数据库中用户信息表user比较
  //todo 若对比成功，隐藏登录界面，显示App主页
  var request=HttpRequest.getString("http://127.0.0.1:8080/login").then(onLogIn);
}
void onLogIn(responseText) {
  var jsonString = responseText;
  var user = JSON.decode(jsonString);
  var userlist = user["User"];
  int a = 0;
  for (var x in userlist) {
    print(x["Username"]);
    if (x["Username"] == login_username.value) {
      print(x["Password"]);
      if (x["Password"] == login_password.value) {
        print(x["Userid"]);
        var router = new Router(useFragment: true);
        router.root
          ..addRoute(name: 'login', path: '/login', enter: tosignup);
        querySelector('#LogIn_Btn1').attributes['href'] =
            router.url('login');
        router.listen();
        a = 1;
      }
    }
/*    if (a == 0) {
      querySelector("#SignIn_Error").text = "用户名或者密码错误，请重新登录";
    }*/
  }
}
void tosignup(RouteEvent e) {
  document.querySelector('#Signup_div').style.display="block";
  document.querySelector('#LogIn_div').style.display="none";

}
void SignUp(MouseEvent event) {
  //todo 将用户键入的用户名密码加入数据库
  var request=HttpRequest.getString("http://127.0.0.1:8080/signup").then(onSignUp);
}
/// 接受用户点击注册页面的注册按钮的响应
/// 参数[event]是鼠标事件....
void onSignUp(responseText) {
  //todo 隐藏登录界面，显示注册界面
}
/*
///注册界面中用户选择忌口食物
void Checkbox_Taboo1(MouseEvent event) {
  //todo 勾选复选框
  // todo 将用户忌口食物赋值给变量做约束条件
}
*/













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





