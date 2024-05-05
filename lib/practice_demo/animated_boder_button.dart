import 'dart:ui';

import 'package:flutter/material.dart';

class CustomAnimatedBorderButtonPage extends StatefulWidget {
  const CustomAnimatedBorderButtonPage({super.key});

  @override
  State<CustomAnimatedBorderButtonPage> createState() =>
      _CustomAnimatedBorderButtonPageState();
}

class _CustomAnimatedBorderButtonPageState
    extends State<CustomAnimatedBorderButtonPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('自定义动画边框按钮'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedBorderButton(
              text: '开始',
              width: 200,
              height: 200,
              borderWidth: 5,
            ),
          ],
        ),
      ),
    );
  }
}

enum AnimatedBorderButtonType {
  //空闲状态
  typeIdle,
  //倒计时
  typeProgress,
  //完成
  typeDone,
}

class AnimatedBorderButton extends StatefulWidget {
  AnimatedBorderButton({
    required this.text,
    required this.width,
    required this.height,
    this.duration = const Duration(seconds: 5),
    this.borderRadius = 0,
    this.borderWidth = 1,
    super.key,
  });

  String text;
  double width;
  double height;
  double borderWidth;
  Duration duration;
  double borderRadius;

  @override
  State<AnimatedBorderButton> createState() => _AnimatedBorderButtonState();
}

class _AnimatedBorderButtonState extends State<AnimatedBorderButton>
    with SingleTickerProviderStateMixin {
  AnimatedBorderButtonType _currentType = AnimatedBorderButtonType.typeIdle;

  String label = "开始";
  late final AnimationController _controller =
      AnimationController(vsync: this, duration: widget.duration)
        ..addStatusListener((status) {
          if (status == AnimationStatus.completed) {
            _currentType = AnimatedBorderButtonType.typeDone;
            setState(() {
              label = "完成";
            });
          }
          print("status: ${status}");
        });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CustomPaint(
          painter: BorderPainter(
              animation: _controller,
              width: widget.width,
              height: widget.height,
              borderWidth: widget.borderWidth,
              borderRadius: widget.borderRadius),
        ),
        SizedBox(
          width: widget.width,
          height: widget.height,
          child: TextButton(
            style: TextButton.styleFrom(
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(widget.borderRadius))),
            onPressed: () {
              if (_currentType == AnimatedBorderButtonType.typeIdle || _currentType == AnimatedBorderButtonType.typeDone) {
                //点击后进入倒计时
                _currentType = AnimatedBorderButtonType.typeProgress;
                _controller.forward();
                setState(() {
                  label = "取消";
                });
              } else if (_currentType ==
                  AnimatedBorderButtonType.typeProgress) {
                //倒计时过程中 点击 进入取消状态
                _currentType = AnimatedBorderButtonType.typeIdle;
                _controller.reset();
                setState(() {
                  label = "开始";
                });
              }
            },
            child: Text(label, style: TextStyle(fontSize: 50),),
          ),
        ),
      ],
    );
  }
}

class BorderPainter extends CustomPainter {
  BorderPainter(
      {required this.animation,
      required this.width,
      required this.height,
      required this.borderRadius,
      required this.borderWidth})
      : super(repaint: animation) {
    shape = RRect.fromRectAndRadius(
        Rect.fromCenter(center: Offset.zero, width: width, height: height),
        Radius.circular(borderRadius));
    final path = Path()..addRRect(shape);
    pathMetric = path.computeMetrics().single;
  }

  AnimationController animation;
  double width;
  double height;
  double borderRadius;
  double borderWidth;

  late RRect shape;
  late PathMetric pathMetric;

  final Paint bluePaint = Paint()
    ..style = PaintingStyle.stroke
    ..color = Colors.blue
    ..strokeWidth = 5;
  final Paint grayPaint = Paint()
    ..style = PaintingStyle.stroke
    ..color = Colors.grey
    ..strokeWidth = 5;

  @override
  void paint(Canvas canvas, Size size) {
    final path = Path();
    final totalLength = pathMetric.length;
    final currentLength = totalLength * animation.value;
    path.addPath(pathMetric.extractPath(0, currentLength), Offset.zero);

    canvas.translate(width / 2, height / 2);
    canvas.drawRRect(shape, bluePaint);
    canvas.drawPath(path, grayPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
