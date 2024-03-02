import 'package:animate_demo1/animation_demos/widgets/animated_counter.dart';
import 'package:flutter/material.dart';

class AnimatedCounterPage extends StatefulWidget {
  const AnimatedCounterPage({Key? key}) : super(key: key);

  @override
  _AnimatedCounterPageState createState() => _AnimatedCounterPageState();
}

class _AnimatedCounterPageState extends State<AnimatedCounterPage> {


  int _counter = 8;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('AnimatedCounter'),),
      body: Center(
        child: Container(
          color: Colors.blue,
          height: 100,
          child: AnimatedCounter(count: _counter),
        ),
      ),
      floatingActionButton: ElevatedButton(onPressed: () {
        setState(() {
          _counter++;
        });
        print(_counter);
      },
      child: Text('refresh'),),
    );
  }
}
