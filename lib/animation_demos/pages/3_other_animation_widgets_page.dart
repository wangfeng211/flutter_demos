import 'package:flutter/material.dart';

class OtherAnimationWidgets extends StatefulWidget {
  const OtherAnimationWidgets({Key? key}) : super(key: key);

  @override
  _OtherAnimationWidgetsState createState() => _OtherAnimationWidgetsState();
}

class _OtherAnimationWidgetsState extends State<OtherAnimationWidgets> {
  // curve
  _buildBody() {
    return AnimatedPadding(
      padding: const EdgeInsets.all(20),
      duration: Duration(seconds: 2),
      child: AnimatedContainer(
        curve: Curves.bounceOut,
        duration: Duration(seconds: 2),
        width: 300,
        height: 300,
        color: Colors.blue,
      ),
    );
  }

  _buildBody2() {
    return AnimatedOpacity(
      opacity: 1,
      duration: Duration(seconds: 2),
      child: Container(
        width: 300,
        height: 300,
        color: Colors.blue,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Other'),
      ),
      body: _buildBody(),
    );
  }
}
