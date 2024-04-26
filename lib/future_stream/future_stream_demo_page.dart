import 'package:animate_demo1/future_stream/1_future_demo_page.dart';
import 'package:animate_demo1/future_stream/3_puzzle_game_page.dart';
import 'package:flutter/material.dart';

import '2_stream_demo_page.dart';

class FutureStreamDemoPage extends StatefulWidget {
  const FutureStreamDemoPage({Key? key}) : super(key: key);

  @override
  _FutureStreamDemoPageState createState() => _FutureStreamDemoPageState();
}

class _FutureStreamDemoPageState extends State<FutureStreamDemoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('FutureAndStream'),), body: Column(
      children: [
        ElevatedButton(onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return FutureDemoPage();
          }));
        }, child: Text('Future')),
        ElevatedButton(onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return StreamDemoPage();
          }));
        }, child: Text('Stream')),

        ElevatedButton(onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return PuzzleGamePage();
          }));
        }, child: Text('PuzzleGame'))
      ],
    ),);
  }
}
