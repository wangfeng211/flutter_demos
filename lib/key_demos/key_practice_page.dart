//一个基于Key 的练习
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

//做一个拖动排序的小游戏
class KeyPracticePage extends StatefulWidget {
  const KeyPracticePage({Key? key}) : super(key: key);

  @override
  _KeyPracticePageState createState() => _KeyPracticePageState();
}

class _KeyPracticePageState extends State<KeyPracticePage> {

  final  _colors = List.generate(5, (index) => Colors.blue[(1 + index) * 100]);

  int _dragIndex = 0;
  double _offsetY = 0;
  final _globalKey = GlobalKey();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('practice'),
        ),
        body: Listener(
          //使用Listener 监听box 的滑动
          onPointerMove: (pointer) {
            final dy = pointer.delta.dy - _offsetY;

            if (_dragIndex >= _colors.length) return;
            if (dy > Box.height * (_dragIndex + 1)) {
              //交换两个的位置
              setState(() {
                final color = _colors[_dragIndex];
                _colors[_dragIndex + 1] = color;
                _colors[_dragIndex] = _colors[_dragIndex + 1];
                _dragIndex++;
              });

            // final color1 = _colors.removeAt(_dragIndex);
            }
          },
          child: Stack(
            key: _globalKey,
            children: List.generate(
                _colors.length,
                    (index) {
                  return Box(
                    color: _colors[index] as Color,
                    y: Box.height * index,
                    x: 50,
                    onDragStart: (){
                      _dragIndex = index;

                      //通过 globalKey 获取 到元素
                      final renderBox = (_globalKey.currentContext!.findRenderObject() as RenderBox);
                      //获取 当前控件在屏幕中位置
                      _offsetY = renderBox.localToGlobal(Offset.zero).dy;
                      print(_offsetY);
                    },
                  );
                }),
          ),
        ));
  }
}

class Box extends StatelessWidget {
  final Color color;
  final double x;//x 坐标
  final double y;//y 坐标
  final Function() ? onDragStart;

  static const width = 50.0;
  static const height = 50.0;
  static const space = 2.0;

  const Box({required this.color, this.x = 0, this.y = 0, this.onDragStart, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final box = Container(
      margin: const EdgeInsets.all(space),
      width: width - space * 2,
      height: height - space * 2,
      color: color,
    );

    return AnimatedPositioned(
      duration: const Duration(milliseconds: 100),
      top: y,
      left: x,
      child: Draggable(
        feedback: box,
        childWhenDragging: Container(
          margin: const EdgeInsets.all(space),
          width: width - space * 2,
          height: height - space * 2,
        ),
        onDragStarted: onDragStart,
        child: box,
      ),
    );
  }
}
