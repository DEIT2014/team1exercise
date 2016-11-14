// Copyright (c) 2016, <your name>. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'dart:html';

String login_name;
String login_psw;
String signup_name;
String signup_psw;
String signup_psw;


void main() {
  /// 登录
  login_name=querySelector('#login_name');
  login_psw=querySelector('#login_psw');
  querySelector('#login_Btn')
    ..text='登录'
    ..onClick.listen(login);
  querySelector('#signup_Btn')
    ..text='注册'
    ..onClick.listen(gosignpage);

  /// 注册
  signup_name=querySelector('#signup_name');
  signup_psw=querySelector('#signup_psw');
   querySelector('#signup_Btn')
    ..text='注册'
    ..onClick.listen(signup);


 ///功能1：开始搭配食物
   //？记录用户选中的信息
  querySelector('#toMatch')
    ..text='开始搭配'
    ..onClick.listen(requestData);

///功能2：开始计算卡路里
  //？记录用户选中的信息
  querySelector('#toCalculate')
    ..text="开始计算";
    ..onClick.listen(calculateCAL);

}


void requestData()
{
  //todo 向服务器发送请求，要求数据
}
 void getData(){
   //todo 与服务器相连，获取JSON数据
 }

void outputData(){
  //todo 将数据按要求填入各位置id
}

void nutriChart(){
  //todo 画营养结构图
}

void calculateCAL(){
  //todo 计算选中食物的热量
}

void signin(MouseEvent event){
  //todo 用户注册 姓名&密码
}

void signup(MouseEvent event) {
  //todo 将用户注册账号密码写入数据库
}

void gohomepage(MouseEvent event){
  //todo 隐藏当前页，显示首页
  //todo 清除本次计算出的数据
  }
void gopage1(MouseEvent event) {
//todo 隐藏当前页，显示用户搭配界面
//todo 清除本次存储的内容
}
void gologpage(MouseEvent event) {
//todo 隐藏当前页，显示用户登录界面
}
void gosignpage(MouseEvent event) {
//todo 隐藏当前页，显示用户注册界面
}