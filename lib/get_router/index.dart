import 'package:animate_demo1/getx_page/get_demo_page.dart';
import 'package:animate_demo1/getx_page/login_page.dart';
import 'package:animate_demo1/getx_page/register_page.dart';
import 'package:flutter/material.dart';


const routeNameLogin = "login";
const routeNameRegist = "regist";
const routeNameGetDemoPage = "getDemoPage";

Route<dynamic> onGenerate(RouteSettings settings) {

  var name = hookRouteName(settings.name ?? '');
  return MaterialPageRoute(builder: (context) {
    switch (name) {
      case routeNameLogin:
        return LoginPage();
      case routeNameRegist:
        return RegisterPage();
      case routeNameGetDemoPage:
        return GetDemoPage();
      default:
        return Scaffold(body: Center(child: Text('404'),),);
    }
  });
}
String hookRouteName(String routeName){
  String token = "123";//从本地获取token
  //判断如果没有token 并且不是注册、首页，则跳转到登录
  if (token == '') {
    if (routeName == 'register' || routeName == '/' || routeName == 'home') {
      return routeName;
    }
      routeName = 'login';
  }
  return routeName;
}