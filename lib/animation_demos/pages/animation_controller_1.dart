import 'package:flutter/material.dart';

class AnimationController1 extends StatefulWidget {
  const AnimationController1({Key? key}) : super(key: key);

  @override
  _AnimationController1State createState() => _AnimationController1State();
}

class _AnimationController1State extends State<AnimationController1> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: Duration(seconds: 2));
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
      appBar: AppBar(title: Text('AnimationController1'),),
      body: Center(
        child: GestureDetector(
          onTap: (){
            if (_loading) {
              _controller.stop();
            } else {
              _controller.repeat();
            }
            _loading = !_loading;
          },
          child: RotationTransition(
            turns: _controller,
            child: Container(
              width: 200,
              height: 200,
              color: Colors.blue,
            ),
          ),
        ),
      ),
    );
  }
}
