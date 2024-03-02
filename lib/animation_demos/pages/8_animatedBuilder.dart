import 'package:flutter/material.dart';

class AnimatedBuilderDemoPage extends StatefulWidget {
  const AnimatedBuilderDemoPage({Key? key}) : super(key: key);

  @override
  _AnimatedBuilderDemoPageState createState() =>
      _AnimatedBuilderDemoPageState();
}

class _AnimatedBuilderDemoPageState extends State<AnimatedBuilderDemoPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 2));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final heightAnimation = Tween(begin: 100.0, end: 200.0)
        .chain(CurveTween(curve: Interval(0, 0.5)))
    .chain(CurveTween(curve: Curves.elasticOut))
        .animate(_controller);
    final opacityAnimation = Tween(begin: 0.5, end: 1.0).animate(_controller);

    print('heightAnimation: ${heightAnimation.value}' );
    print('opacityAnimation: ${opacityAnimation.value}' );
    return Scaffold(
      appBar: AppBar(
        title: Text('AnimationBuilder'),
      ),
      body: Center(
        child: AnimatedBuilder(
          animation: _controller,
          builder: (BuildContext context, Widget? child) {
            return Opacity(
              opacity: opacityAnimation.value,
              child: GestureDetector(
                onTap: () {
                  _controller.forward();
                },
                child: Container(
                  width: 200,
                  height: heightAnimation.value,
                  color: Colors.blue,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
