import 'package:flutter/material.dart';

/// 使用 CustomMultiChildLayout 使用
class MyCustomMultiChildLayoutPage extends StatefulWidget {
  const MyCustomMultiChildLayoutPage({Key? key}) : super(key: key);

  @override
  _MyCustomMultiChildLayoutPageState createState() =>
      _MyCustomMultiChildLayoutPageState();
}

class _MyCustomMultiChildLayoutPageState
    extends State<MyCustomMultiChildLayoutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CustomMultiChildLayout'),
      ),
      body: _build1(),
    );
  }

  //自定义一个带下划线的文字
  _build1() {
    return CustomMultiChildLayout(delegate: MyDelegate1(thickness: 1), children: [
      LayoutId(
          id: "text",
          child: Text(
            "Hello",
            style: TextStyle(fontSize: 75),
          )),
      LayoutId(id: 'underline', child: Container(color: Colors.red)),
    ]);
  }

  //对角线布局两个FlutterLogo
  _build2() {
    return CustomMultiChildLayout(delegate: MyDelegate2(), children: [
      LayoutId(
          id: 1,
          child: FlutterLogo(
            size: 100,
          )),
      LayoutId(id: 2, child: FlutterLogo()),
    ]);
  }
}

//自定义带下划线的文字
class MyDelegate1 extends MultiChildLayoutDelegate {

  //下划线的粗细
  double thickness;

  MyDelegate1({this.thickness = 4}) : super();

  @override
  void performLayout(Size size) {
    var textSize;
    //确定有两个元素，不用判断hasChild
    // if (hasChild('text')) {
    textSize = layoutChild('text', BoxConstraints.loose(size));
    //将文字画在屏幕的中间位置
    double top = (size.height - textSize.height) / 2;
    double left = (size.width - textSize.width) / 2;
    positionChild('text', Offset(left, top));
    // }
    // if (hasChild('underline')) {
    layoutChild(
        'underline',
        BoxConstraints(
            minHeight: thickness,
            minWidth: textSize.width,
            maxHeight: thickness,
            maxWidth: textSize.width));
    positionChild('underline', Offset(left, top + textSize.height));
    // }
  }

  @override
  bool shouldRelayout(covariant MultiChildLayoutDelegate oldDelegate) {
    return true;
  }
}

class MyDelegate2 extends MultiChildLayoutDelegate {
  @override
  void performLayout(Size size) {
    var size1, size2;
    if (hasChild(1)) {
      size1 = layoutChild(1, BoxConstraints.loose(size));
      positionChild(1, Offset(0, 0));
    }
    if (hasChild(2)) {
      size2 = layoutChild(2, BoxConstraints.loose(size));
      positionChild(2, Offset(size1.width, size1.height!));
    }
  }

  @override
  bool shouldRelayout(covariant MultiChildLayoutDelegate oldDelegate) {
    return true;
  }
}
