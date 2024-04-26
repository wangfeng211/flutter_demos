import 'package:flutter/material.dart';

class MyRenderBoxDemoPage extends StatefulWidget {
  const MyRenderBoxDemoPage({Key? key}) : super(key: key);

  @override
  _MyRenderBoxDemoPageState createState() => _MyRenderBoxDemoPageState();
}

class _MyRenderBoxDemoPageState extends State<MyRenderBoxDemoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text('RenderBox'),), body: Column(),);
  }
}
