// Copyright (c) 2016, <your name>. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'dart:html';

+String login_username;//登录界面的用户名变量
+String login_password;//登录界面的密码变量
+String signup_username;//注册界面的用户名变量
+String signup_password;//注册界面的密码变量
+String signup_confirmpw;//注册界面确认密码的变量
+var select_element; //用户选择所需元素
+var select_taboo1;//用户注册页面选择忌口食物
+var select_taboo2;//用户APP主页选择忌口食物
+var select_calory;//用户设定热量控制
+var select_food;//用户选择食物
+var selcet_quantity;//用户选择食物重量


void main() {
  
}



void LogIn(MouseEvent event){
+  //todo 将用户键入的用户名密码与数据库中用户信息表user比较
+  //todo 若对比成功，隐藏登录界面，显示App主页
+}
+
+/// 用来接受用户点击注册按钮以后的响应工作
+/// 参数[event]是鼠标事件....
+void SignUp(MouseEvent event){
+  //todo 隐藏登录界面，显示注册界面
+}
+
+/// 接受用户点击注册页面的注册按钮的响应
+/// 参数[event]是鼠标事件....
+void SignUpOk(MouseEvent event){
+  //todo 将数据写入数据库中的用户信息表
+  //todo 显示注册成功界面
+}
+
+/// 接受用户点击注册成功页面的确定按钮的响应
+/// 参数[event]是鼠标事件....
+void ReturnSignIn(MouseEvent event){
+  //todo 隐藏注册界面和注册成功界面，显示登录界面
 }
+
+///开始搭配中用户选择控制热量范围

