import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

class PuzzleGamePage extends StatefulWidget {
  const PuzzleGamePage({Key? key}) : super(key: key);

  @override
  _PuzzleGamePageState createState() => _PuzzleGamePageState();
}

//一个小游戏
//根据显示的算式计算结果
class _PuzzleGamePageState extends State<PuzzleGamePage> {
  final _inputStream = StreamController.broadcast();
  final _scoreStream = StreamController.broadcast();

  @override
  void initState() {
    super.initState();
    _inputStream.stream.listen((event) {
    });
  }

  @override
  void dispose() {
    _inputStream.close();
    _scoreStream.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: StreamBuilder(
            stream: _inputStream.stream,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Text('YOU ENTER: ${snapshot.data}');
              }
              return Text("WAITTING...");
            }),
      ),
      body: Stack(
        children: [
          ...List.generate(5, (index) => PuzzleItem(_inputStream)),
          KeyBoard(_inputStream)
        ],
      ),
    );
  }
}

//下落的算式
class PuzzleItem extends StatefulWidget {

  //将键盘按下的结果通过stream 传进来
  StreamController scoreStreamController;
  PuzzleItem(this.scoreStreamController, {Key? key});

  @override
  State<PuzzleItem> createState() => _PuzzleItemState();
}

class _PuzzleItemState extends State<PuzzleItem> with SingleTickerProviderStateMixin{
  late int a, b;
  late double left;
  late AnimationController _animationController;
  late Color _color = Colors
      .primaries[Random().nextInt(Colors.primaries.length)][200]!.withOpacity(0.5);


  getRandomData(){
    //生成a,b 两个数字，是的a+b<=9
    //先生成一个小于9的数字作为结果，再生成一个小于结果的a, 再让9-a即为b
    final result = Random().nextInt(8) + 1;
    a = Random().nextInt(result) + 1;
    b = result - a;
    //item left 数据
    left = Random().nextDouble() * 300;
    _animationController.duration = Duration(milliseconds: Random().nextInt(5000) + 5000);
    _animationController.forward(from: 0);

  }


  @override
  void initState() {

    _animationController = AnimationController(vsync: this);
    _animationController.addListener(() {
      if (_animationController.status == AnimationStatus.completed) {
        getRandomData();
      }
    });
    getRandomData();

    widget.scoreStreamController.stream.listen((event) {
      if (event == a+b) {
        print('答对了：$a + $b = $event');
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) {
        return Positioned(
          left: left,
          top: MediaQuery.of(context).size.height * _animationController.value - 100,
            child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18),
                    color: _color),
                child: Text(
                  '$a + $b',
                  style: TextStyle(fontSize: 30),
                )));
      }
    );
  }
}

class KeyBoard extends StatelessWidget {
  StreamController controller;

  KeyBoard(this.controller, {super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          color: Colors.orange,
          child: GridView.count(
            shrinkWrap: true,
            crossAxisCount: 3,
            childAspectRatio: 2 / 1,
            padding: EdgeInsets.zero,
            children: List.generate(
                9,
                (index) => Container(
                    decoration: BoxDecoration(
                      color: Colors.primaries[
                          Random().nextInt(Colors.primaries.length)][200],
                    ),
                    child: TextButton(
                        onPressed: () {
                          controller.sink.add(index + 1);
                        },
                        child: Text(
                          '${index + 1}',
                          style: TextStyle(fontSize: 30),
                        )))),
          ),
        ));
  }
}
