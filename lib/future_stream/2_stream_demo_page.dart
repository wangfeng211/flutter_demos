import 'package:flutter/material.dart';

class StreamDemoPage extends StatefulWidget {
  const StreamDemoPage({Key? key}) : super(key: key);

  @override
  _StreamDemoPageState createState() => _StreamDemoPageState();
}

class _StreamDemoPageState extends State<StreamDemoPage> {

  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text("Stream"),), body: Container(),);
  }
}
