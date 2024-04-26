import 'dart:typed_data';

import 'package:animate_demo1/func/PhoneClass.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FactoryFuncText extends StatefulWidget {
  const FactoryFuncText({Key? key}) : super(key: key);

  @override
  _FactoryFuncTextState createState() => _FactoryFuncTextState();
}

class _FactoryFuncTextState extends State<FactoryFuncText> {

  Uint8List? imageData;
  @override
  void initState() {
    super.initState();
    final p1 = PhoneClass();
    final p2 = PhoneClass();
    print("p1 is equal p2");
    print(p1 == p2);

    getImageData();
  }
  getImageData () async{
    imageData = (await rootBundle.load("assets/AppIcon.png")).buffer.asUint8List();
    setState(() {
    });
    NetworkAssetBundle;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('工厂函数'),
      ),
      body: Column(
        children: [
          Container(
            width: 100,
            height: 100,
            color: Colors.orange,
          ),
          SizedBox(height: 50,),

          (imageData == null ? SizedBox(child:  CircularProgressIndicator() , width: 100, height: 100,):
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(image: DecorationImage(image: MemoryImage(imageData!))),
          ))
        ],
      ),
    );
  }
}
