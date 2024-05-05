import 'package:flutter/material.dart';

class TweenAnimationBuilderPage extends StatefulWidget {
  const TweenAnimationBuilderPage({Key? key}) : super(key: key);

  @override
  _TweenAnimationBuilderPageState createState() =>
      _TweenAnimationBuilderPageState();
}

class _TweenAnimationBuilderPageState extends State<TweenAnimationBuilderPage> {


  _buildMain() {
    return TweenAnimationBuilder(
        tween: Tween<double>(begin: 0, end: 1),
        duration: Duration(
          seconds: 2,
        ),
        builder: (context, value, child) {
          return Container(
            width: 300,
            height: 300,
            color: Colors.blue,
            child: Center(
                child: Transform.scale(
                  scale: value,
                  child: Text(
                    'HI',
                    style: TextStyle(fontSize: 100),
                  ),
                )),
          );
        });
  }

  _buildMain2() {
    return TweenAnimationBuilder(
        tween: Tween<double>(begin: 0, end: 1),
        duration: Duration(
          seconds: 2,
        ),
        child: Center(
          child: Transform.scale(
            scale: 1,
            child: const Text(
              'HI',
              style: TextStyle(fontSize: 100),
            ),
          ),),
        builder: (context, value, child) {
          return Opacity(
            opacity: value,
            child: Container(
              margin: EdgeInsets.only(top: value * 100),
              width: 300,
              height: 300,
              color: Colors.blue,
              child: child,
            ),
          );
        });
  }


  var _big = false;

  _buildMain3() {
    return GestureDetector(
      onTap: () {
        setState(() {
          _big = !_big;
        });
      },
      child: TweenAnimationBuilder(
          tween: Tween<double>(end: _big ? 72 : 172),
          duration: Duration(
            seconds: 2,
          ),
          builder: (context, value, child) {
            return Container(
              width: 300,
              height: 300,
              color: Colors.blue,
              child: Center(
                  child: Transform.scale(
                    scale: 1,
                    child: Text(
                      'HI',
                      style: TextStyle(fontSize: value),
                    ),
                  )),
            );
          }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('TweenAnimationBuilderPage'),),
      body: _buildMain3(),
    );
  }
}
