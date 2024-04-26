import 'dart:ui';

import 'package:animate_demo1/algorithm_demo/algorithm_page.dart';
import 'package:animate_demo1/animation_demos/animation_demos.dart';
import 'package:animate_demo1/animation_demos/pages/10_other_widget.dart';
import 'package:animate_demo1/drag_asset_and_re_order/DragAssetAndReorderDemoPage.dart';
import 'package:animate_demo1/file/file_storage.dart';
import 'package:animate_demo1/future_stream/future_stream_demo_page.dart';
import 'package:animate_demo1/get_router/index.dart';
import 'package:animate_demo1/getx_page/login_page.dart';
import 'package:animate_demo1/key_demos/key_demos.dart';
import 'package:animate_demo1/layout_demo_page/layout_demo_page.dart';
import 'package:animate_demo1/practice_demo/water_wark_page.dart';
import 'package:animate_demo1/practice_demo/text_transpart_page.dart';
import 'package:animate_demo1/render_object_demo/render_object_demo_page.dart';
import 'package:animate_demo1/scroll_demos/scroll_demos_page.dart';
import 'package:animate_demo1/sliver_demos/sliver_demos.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/route_manager.dart';

import 'func/factory_funcs.dart';
import 'other/widgets/other_widgets_page.dart';
import 'package:flutter_dynamic_icon/flutter_dynamic_icon.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
      onGenerateRoute: onGenerate,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  final fileStorage = FileStorage();
  late FlutterView viwe;

  @override
  void initState()  {
    super.initState();
  }
  void _incrementCounter() async{
    final res = await fileStorage.readData();
    print("read data: $res");
  }

  writeData() async{
    final res = await fileStorage.writeData(10);
    print(res);

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body:
          SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [

                ElevatedButton(onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return AnimationDemos();
                  }));
                }, child: Text('Animation Demos')),

                ElevatedButton(onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return KeyDemosPage();
                  }));
                }, child: Text('Key Demos')),

                ElevatedButton(onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return ScrollDemosPage();
                  }));
                }, child: Text('Scroll Demos')),
                ElevatedButton(onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return SliverDemosPage();
                  }));
                }, child: Text('Sliver Demos')),
                // ElevatedButton(onPressed: (){
                //   Navigator.push(context, MaterialPageRoute(builder: (context) {
                //     return DragAssetAnoReorderDemoPage();
                //   }));
                // }, child: Text('拖拽移除 和 重新排序demo')),

                ElevatedButton(onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return OtherPage();
                  }));
                }, child: Text('其他组件')),

                ElevatedButton(onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return LayoutDemoPage();
                  }));
                }, child: Text('布局原理')),

                ElevatedButton(onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return FutureStreamDemoPage();
                  }));
                }, child: Text('FutureAndStream')),

                ElevatedButton(onPressed: () async{
                  try {
                    if (await FlutterDynamicIcon.supportsAlternateIcons) {
                      //在iOS项目中配置好了3个图标，分别是vip 、svip、apple 三个图片
                      //FlutterDynamicIcon 具体使用方法可查看pub
                      await FlutterDynamicIcon.setAlternateIconName("apple", showAlert: false);
                      print("change app icon ok---");
                    }
                  } catch (e) {
                    print("change app icon error: $e");
                  }

                }, child: Text('更换AppIcon')),

                ElevatedButton(onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return FactoryFuncText();
                  }));
                }, child: Text('FactoryFuncText')),

                ElevatedButton(onPressed: () {
                  writeData();
                }, child: Text('writeData')),

                ElevatedButton(onPressed: () {
                  Get.toNamed(routeNameGetDemoPage);
                }, child: Text('GetX')),

                ElevatedButton(onPressed: () {
                  Get.to(const RenderObjectDemoPage());
                }, child: const Text('RenderObject')),


                ElevatedButton(onPressed: () {
                  Get.to(const AlgorithmPage());
                }, child: const Text('Algorithm - 算法')),

                ElevatedButton(onPressed: () {
                  Get.to(const TextTransparentPage());
                }, child: const Text('文字镂空效果')),

                ElevatedButton(onPressed: () {
                  Get.to(const WaterMarkPage());
                }, child: const Text('水印')),
              ],
            ),
          ),
      // Center(
      //   // Center is a layout widget. It takes a single child and positions it
      //   // in the middle of the parent.
      //   child: AnimatedContainer(
      //     duration: Duration(seconds: 1),
      //     alignment: Alignment.center,
      //     width: 300,
      //     height: 300,
      //     // child: Text('Welcome', style: TextStyle(fontSize: 50), textAlign: TextAlign.center,),
      //     decoration: BoxDecoration(
      //         gradient: const LinearGradient(
      //           end: Alignment.topCenter,
      //           begin: Alignment.bottomCenter,
      //           colors: [Colors.orange, Colors.white],
      //           stops: [0.2, 0.3]
      //         ),
      //         boxShadow: [BoxShadow(spreadRadius: 25, blurRadius: 25)],
      //         borderRadius: BorderRadius.circular(150)),
      //   ),
      // ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
