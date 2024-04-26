import 'package:flutter/material.dart';

class DoCatDemosPage extends StatefulWidget {
  const DoCatDemosPage({Key? key}) : super(key: key);

  @override
  _DoCatDemosPageState createState() => _DoCatDemosPageState();
}

class _DoCatDemosPageState extends State<DoCatDemosPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text('DoCat Demos'),),body: Column(
      children: [
        ElevatedButton(onPressed: (){

        }, child: Text('compress'))
      ],
    ),);
  }
}
