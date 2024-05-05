import 'package:flutter/material.dart';


class CustomPaintAndPath extends StatefulWidget {
  const CustomPaintAndPath({super.key});

  @override
  State<CustomPaintAndPath> createState() => _CustomPaintAndPathState();
}

class _CustomPaintAndPathState extends State<CustomPaintAndPath> {

  @override
  void initState() {
    super.initState();



  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text("自定义绘制+ Path"),),body: Container(
      child: CustomPaint(),
    ),);
  }
}

class MyPaint extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path = Path();
    path.moveTo(100, 100);
    path.lineTo(200, 200);
    path.lineTo(200, 200);
    path.lineTo(100, 200);
    path.close();
    canvas.drawPath(path, Paint()..color = Colors.red..strokeWidth = 3);
  }
  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
