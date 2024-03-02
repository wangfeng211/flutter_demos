import 'dart:math';
import 'package:flutter/material.dart';

class SnowDemoPage extends StatefulWidget {
  const SnowDemoPage({Key? key}) : super(key: key);

  @override
  _SnowDemoPageState createState() => _SnowDemoPageState();
}

class _SnowDemoPageState extends State<SnowDemoPage> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  final _snowList = List.generate(100, (index) => SnowItem());

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: const Duration(seconds: 5));
    _controller.repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("snow"),),
      body: Center(
        child: AnimatedBuilder(
          animation: _controller,
          builder: (BuildContext context, Widget? child) {
            return Container(
              decoration: const BoxDecoration(
                color: Colors.blue,
                gradient: LinearGradient(
                  colors: [Colors.blue, Colors.lightBlue, Colors.white],
                      begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                    stops: [0.6, 0.85, 0.95]
                )
              ),
              constraints: const BoxConstraints.expand(),
              child: CustomPaint(
                painter: MyPainter(_snowList),
              ),
            );
          },
        ),
      ),
    );
  }
}

class MyPainter extends CustomPainter {

  final List<SnowItem> snowList;
  MyPainter(this.snowList);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = Colors.white;
    //画一个雪人头
    canvas.drawCircle(Offset(size.width/2, size.height/2 + 100), 50, paint);

    //雪人的身体
    canvas.drawOval(Rect.fromCenter(center: Offset(size.width/2, size.height/2 + 265), width: 220, height: 250), paint);

    //画一系列的雪花
    snowList.forEach((snow) {
      //雪花开始下落
      snow.fallDown();
      canvas.drawCircle(Offset(snow.x, snow.y), snow.radius, paint);
    });
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class SnowItem {
  // 雪花的坐标 x , y
  double x = Random().nextDouble() * 400;
  double y = Random().nextDouble() * 800;
  //半径
  double radius = Random().nextDouble() * 2 + 2;
  //下落速度
  double velocity = Random().nextDouble() * 4 + 2;

  fallDown(){
    y = y + velocity;
    if (y > 800) {
      y = 0;
      x = Random().nextDouble() * 400;
      radius = Random().nextDouble() * 2 + 2;
      velocity = Random().nextDouble() * 2 + 4;
    }
  }

}