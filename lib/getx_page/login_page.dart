import 'package:animate_demo1/get_router/index.dart';
import 'package:animate_demo1/getx_page/register_page.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text('登录'),), body: Column(children: [
      ElevatedButton(onPressed: (){
        Get.back();
      }, child: Text('点击登录 然后返回上页')),
      ElevatedButton(onPressed: (){
        // Get.offNamed(routeNameRegist);
        // Get.toNamed(routeNameRegist);
        Get.off(RegisterPage());
      }, child: Text('去注册->')),

    ],),);
  }
}
