import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AnimationContainerDemoPage extends StatefulWidget {
  const AnimationContainerDemoPage({Key? key}) : super(key: key);

  @override
  _AnimationContainerDemoPageState createState() =>
      _AnimationContainerDemoPageState();
}

class _AnimationContainerDemoPageState
    extends State<AnimationContainerDemoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AnimationContainer'),
      ),
      body: Center(
        child: Container(
          width: 300,
          height: 300,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(150),
            boxShadow: [BoxShadow(spreadRadius: 25, blurRadius: 25)],
              gradient: LinearGradient(
            colors: [Colors.orange, Colors.white],
            stops: [0.2, 0.3],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter
          )),
        ),
      ),
    );
  }
}
