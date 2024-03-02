import 'package:flutter/material.dart';

class TweenDemoPage extends StatefulWidget {
  const TweenDemoPage({Key? key}) : super(key: key);

  @override
  _TweenDemoPageState createState() => _TweenDemoPageState();
}

class _TweenDemoPageState extends State<TweenDemoPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 5))
          ..forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tween 详解'),
      ),
      body: Center(
        child: SlideTransition(
          position: Tween(begin: Offset(0, 0), end: Offset(0.5, 0))
              .chain(CurveTween(curve: Curves.elasticOut))
              .chain(CurveTween(curve: Interval(0.8, 1)))
              .animate(_controller),
          child: Container(
            width: 200,
            height: 200,
            color: Colors.blue,
          ),
        ),
      ),
    );
  }
}
