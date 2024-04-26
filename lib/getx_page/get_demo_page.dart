import 'package:animate_demo1/get_router/index.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class GetDemoPage extends StatefulWidget {
  const GetDemoPage({super.key});

  @override
  State<GetDemoPage> createState() => _GetDemoPageState();
}

class _GetDemoPageState extends State<GetDemoPage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(appBar: AppBar(title: Text('GetX'),), body: Column(
      children: [
        ElevatedButton(onPressed: (){
          Get.defaultDialog(title: "Alert Dialog提示");
        }, child: Text('Get Dialog')),

        ElevatedButton(onPressed: (){
          Get.snackbar("title", "message", snackPosition: SnackPosition.BOTTOM);
        }, child: Text('Get 展示 snackbar')),


        ElevatedButton(onPressed: (){
          Get.toNamed(routeNameLogin);
        }, child: Text('路由跳转 to login page'))
      ],
    ),);
  }
}
