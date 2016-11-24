// Copyright (c) 2016, <your name>. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'dart:html';
import 'dart:core';
import 'package:route_hierarchical/client.dart';

String login_username;//登录界面的用户名变量
String login_password;//登录界面的密码变量
String signup_username;//注册界面的用户名变量
String signup_password;//注册界面的密码变量
String signup_confirmpw;//注册界面确认密码的变量
var select_element; //用户选择所需元素
var select_taboo1;//用户注册页面选择忌口食物
var select_taboo2;//用户APP主页选择忌口食物
var select_calory;//用户设定热量控制
var select_food;//用户选择食物
var selcet_quantity;//用户选择食物重量

var localhost="127.0.0.1";
void main() {
  var router = new Router();
  router.root
        ..addRoute(
              name: 'home',
              path: '/',
              mount: (router) =>
              router
                ..addRoute(
                    name: 'login',
                    path: '/login',
                    defaultRoute: true,
                    enter: showLoginPage)
                ..addRoute(
                    name: 'SignUp',
                    path: '/signup',
                    defaultRoute: true,
                    enter: showSignupPage)
                ..addRoute(
                    name: 'match',
                    path: '/match',
                    defaultRoute: true,
                    enter: showMatchResult)))


  /// 登录界面
  login_username = querySelector('#LogIn_Username'); //输入用户名
  login_password = querySelector('#LogIn_Password'); //输入密码
  querySelector('#LogIn_Btn')
    ..text = '登录'
    ..onClick.listen(LogIn); //用户登录按钮
  querySelector('#SignUp_Btn1')
    ..text = '注册'
    ..onClick.listen(SignuUp); //用户注册按钮

  /// 注册界面
  signup_username = querySelector('#SignUp_Username'); //输入用户名
  signup_taboo1 = querySelector('#SignUp_Taboo'); //选择忌口食物
  signup_password = querySelector('#SignUp_Password'); //输入密码
  signup_confirmpw = querySelector('#SignUp_ConfirmPW'); //确认密码
  signup_taboo1 = querySelector('#SignUp_Taboo1'); //确认密码
  querySelector('#SignUp_Btn2')
    ..text = '注册'
    ..onClick.listen(SignUpOK); //注册按钮


  /// 注册成功界面
  querySelector('#SucSignUp_Btn')
    ..text = '确定'
    ..onClick.listen(ReturnSignIn); //返回登录界面按钮


  ///APP主页开始搭配界面
  select_element = querySelector('#Select_Element')
    ..text = Checkbox_Element; //用户选择所需元素
  select_calory = querySelector('#Select_Calory')
    ..text = Checkbox_Calory; //用户选择热量控制范围
  select_taboo2 = querySelector('#Select_Taboo2')
    ..text = Checkbox_Taboo2; //用户选择忌口食物
  querySelector('#ToMatch_Btn')
    ..text = '开始搭配'
    ..onClick.listen(GetFoodMenu); //开始搭配返回食谱


  ///APP主页开始计算页面
  select_food = querySelector('#ChooseFood')
    ..text = Checkbox_Food; //用户选择所需元素
  select_calory = querySelector('#FoodQuantity')
    ..text = Checkbox_Quantity; //用户选择食物重量
  querySelector('#ToCalculate_Btn')
    ..text = '开始计算'
    ..onClick.listen(GetCalNum); //开始计算返回热量总值

  /// 个性菜谱界面
  querySelector('#Fan_Chart')
    ..text = Fan_Chart_Show; //扇形图
  querySelector('#Table_Menu')
    ..text = Table_Menu_Show; //食谱表格


  /// 用来接受用户点击登录按钮以后的响应工作
  /// 参数[event]是鼠标事件....


void showLoginPage(RouteEvent e){
//todo 显示登录页面
}
void showSignupPage(RouteEvent e){
  //todo 显示注册页面

}
void showMatchResult(RouteEvent e){
  //todo 显示搭配页面

}

  void LogIn(RouteEvent e) {
    //todo 将用户键入的用户名密码与数据库中用户信息表user比较
    //todo 若对比成功，隐藏登录界面，显示App主页
  }

  /// 用来接受用户点击注册按钮以后的响应工作
  /// 参数[event]是鼠标事件....
  void SignUp(MouseEvent event) {
    //todo 隐藏登录界面，显示注册界面
  }

  /// 接受用户点击注册页面的注册按钮的响应
  /// 参数[event]是鼠标事件....
  void SignUpOk(MouseEvent event) {
    //todo 将数据写入数据库中的用户信息表
    //todo 显示注册成功界面
  }

  /// 接受用户点击注册成功页面的确定按钮的响应
  /// 参数[event]是鼠标事件....
  void ReturnSignIn(MouseEvent event) {
    //todo 隐藏注册界面和注册成功界面，显示登录界面
  }

  ///开始搭配中用户选择控制热量范围
  void checkbox_calory() {
    //todo 设置数值
    //todo 将用户控制热量范围赋值给变量做约束条件
  }

  /// 开始搭配中用户选择所需营养元素
  void Checkbox_Element() {
    //todo 勾选复选框
    // todo 将用户所需营养元素赋值给变量做约束条件
  }

  ///开始搭配中用户选择忌口食物
  void Checkbox_Taboo2() {
    //todo 勾选复选框
    // todo 将用户忌口食物赋值给变量做约束条件
  }

  /// 接受用户点击开始搭配按钮的响应
  /// 参数[event]是鼠标事件....
  void GetFoodMenu(MouseEvent event) {
    //todo 隐藏APP主页，显示开始搭配菜谱页面
  }

  /// 显示扇形图
  void Fan_Chart_Show() {
    //todo 取出数据库的数据
    // todo 根据数据库数据与Json文件数据计算所含元素比例并返回扇形图
  }

  /// 显示菜谱表格
  void Table_Menu_Show() {
    //todo 取出数据库的数据
    // todo 根据数据库数据与Json文件数据设计菜谱表格并返回
  }

  /// 开始计算中用户选择食物
  void Checkbox_Food() {
    //todo 选择下拉菜单
    // todo 将用户选择的食物写入Json文件
  }

  /// 开始计算中用户选择食物重量
  void Checkbox_Quantity() {
    //todo 设置数值
    //todo 将用户设置的食物重量写入Json文件
  }

  /// 接受用户点击开始计算的按钮的响应
  /// 参数[event]是鼠标事件....
  void GetCalNum(MouseEvent event) {
    //todo 从数据库中取出相应数据
    //todo 根据数据库数据与Json文件数据计算热量值并返回
  }
}





