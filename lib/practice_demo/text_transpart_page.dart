import 'package:flutter/material.dart';

class TextTransparentPage extends StatefulWidget {
  const TextTransparentPage({super.key});

  @override
  State<TextTransparentPage> createState() => _TextTransparentPageState();
}

class _TextTransparentPageState extends State<TextTransparentPage> {
  double _distance = 2.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("文字镂空效果"),
        ),
        body: Column(
          children: [
            _buildBody1(),
            _buildBody2(),
            _buildBody3(),
          ],
        ));
  }

  //使用shadow 实现文字镂空效果
  Widget _buildBody1() {
    return Text(
      "WSBT",
      style: TextStyle(fontSize: 50, color: Colors.white, shadows: [
        Shadow(color: Colors.orange, offset: Offset(_distance, 0)),
        Shadow(color: Colors.orange, offset: Offset(0, _distance)),
        Shadow(color: Colors.orange, offset: Offset(-_distance, 0)),
        Shadow(color: Colors.orange, offset: Offset(0, -_distance)),
        Shadow(color: Colors.orange, offset: Offset(_distance, _distance)),
        Shadow(color: Colors.orange, offset: Offset(-_distance, _distance)),
        Shadow(color: Colors.orange, offset: Offset(_distance, -_distance)),
        Shadow(color: Colors.orange, offset: Offset(-_distance, -_distance)),
      ]),
    );
  }

  Widget _buildBody2() {
    return Stack(
      children: [
        Text(
          "WSBT",
          style: TextStyle(
              fontSize: 40,
              foreground: Paint()..strokeWidth=2 ..color=Colors.orange..style=PaintingStyle.stroke),
        ),
        //再叠加一个Text 消除描边效果
        Text(
          "WSBT",
          style: TextStyle(
              fontSize: 40, color: Colors.white)
        )
      ],
    );
  }

  Widget _buildBody3() {
    //英文就不行了
    String str = "只能显示中文";
    // String str = "ABCDEFG";
    return Stack(
      children: [
        Text(
          str,
          style: TextStyle(
              fontSize: 40,
            fontWeight: FontWeight.w900,color: Colors.orange
          ),
        ),
        //再叠加一个Text 消除描边效果
        Text(
            str,
            style: TextStyle(
                fontWeight: FontWeight.w100,
                fontSize: 40, color: Colors.white)
        )
      ],
    );
  }
}
