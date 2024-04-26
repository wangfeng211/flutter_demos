import 'package:animate_demo1/get_router/index.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text('注册')), body: Center(
      child: ElevatedButton(onPressed: (){
        Get.offAllNamed(routeNameGetDemoPage);
      }, child: Text('点击注册 返回到首页'),),
    ),);
  }
}
