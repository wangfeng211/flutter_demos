import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

class WaterMarkPage extends StatefulWidget {
  const WaterMarkPage({super.key});

  @override
  State<WaterMarkPage> createState() => _WaterMarkPageState();
}

class _WaterMarkPageState extends State<WaterMarkPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("data"),
      ),
      body: Container(
        child: Center(
          child: SizedBox(
            width: 200,
            height: 300,
            child: WaterMark(
              child: Container(
                color: Colors.orange,
              ),
              text: "WSBT",
            ),
          ),
        ),
      ),
    );
  }
}

class WaterMark extends StatelessWidget {
  WaterMark({required this.child, this.text, Key? key}) : super(key: key);
  Widget child;
  String? text;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        child,
        if (text != null)
          Positioned.fill(
              child: Center(
            child: AspectRatio(
              aspectRatio: 1,
              child: ImageFiltered(
                imageFilter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
                child: Transform.rotate(
                  angle: -pi / 4,
                  child: FittedBox(
                    child: Text(text!),
                  ),
                ),
              ),
            ),
          ))
      ],
    );
  }
}
