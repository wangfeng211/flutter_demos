import 'package:flutter/material.dart';

class AnimatedCounter extends StatelessWidget {
  const AnimatedCounter(
      {Key? key,
      required this.count,
      this.duration = const Duration(seconds: 1)})
      : super(key: key);

  final int count;
  final Duration duration;

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      duration: duration,
      tween: Tween<double>(end: count.toDouble()),
      builder: (context, val, child) {
        //整数部分
        int whole = val ~/ 1;
        //小数部分
        double decimal = val - whole;
        return DefaultTextStyle(
          style: TextStyle(fontSize: 100),
          child: Stack(
            children: [
              Positioned(
                  top: 0 - 100 * decimal,
                  child: Opacity(opacity: 1 - decimal, child: Text('$whole'))),
              Positioned(
                  top: 100 - 100 * decimal,
                  child:
                      Opacity(opacity: decimal, child: Text('${whole + 1}'))),
            ],
          ),
        );
      },
    );
  }
}
