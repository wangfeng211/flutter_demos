import 'package:flutter/material.dart';

class ControllerDemoPage extends StatefulWidget {
  const ControllerDemoPage({Key? key}) : super(key: key);

  @override
  _ControllerDemoPageState createState() => _ControllerDemoPageState();
}

class _ControllerDemoPageState extends State<ControllerDemoPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      // lowerBound: 3,
      // upperBound: 5,
      duration: Duration(seconds: 2),
    );

    _controller.addListener(() {
      print(_controller.value);
    });
  }

  @override
  void dispose() {
    if (_controller.isAnimating) {
      _controller.stop();
    }
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('动画控制器'),
      ),
      body: Center(
        child: _buildRotation(
          child: GestureDetector(
            onTap: () {
              _controller.repeat(reverse: true);
            },
            child: Container(
              width: 200,
              height: 200,
              color: Colors.blue,
            ),
          )
        ),
      ),
    );
  }

  // 旋转动画
  Widget _buildRotation({required Widget  child}){
    return RotationTransition(
      turns: _controller,
      child: child,
    );
  }

  // 渐变动画
  Widget _buildFade({required Widget  child}){
    return FadeTransition(
      opacity: _controller,
      child: child,
    );
  }

  // 缩放动画
  Widget _buildScale({required Widget  child}){
    return ScaleTransition(
      scale: _controller,
      child: child,
    );
  }
}
