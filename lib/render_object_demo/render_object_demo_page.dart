import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class RenderObjectDemoPage extends StatefulWidget {
  const RenderObjectDemoPage({super.key});

  @override
  State<RenderObjectDemoPage> createState() => _RenderObjectDemoPageState();
}

class _RenderObjectDemoPageState extends State<RenderObjectDemoPage> {
  @override
  Widget build(BuildContext context) {

    print("MediaQuery: ${MediaQuery.of(context).size}" );
    return Scaffold(
      appBar: AppBar(
        title: Text('RenderObject'),
      ),
      body: CustomCenter(child: FlutterLogo(size: 20,),),
    );
  }
}

class CustomCenter extends SingleChildRenderObjectWidget {

  const CustomCenter({super.key,  super.child});

  @override
  RenderObject createRenderObject(BuildContext context) {
    return RenderCustomCenter();
  }
}

class RenderCustomCenter extends RenderShiftedBox {
  RenderCustomCenter({RenderBox? child}) : super(child);

  @override
  void performLayout() {
    //将约束变为松约束，传递给子节点
    child!.layout(constraints.loosen(), parentUsesSize: true);
    // print(constraints);
    // child!.layout(BoxConstraints(maxHeight: 200,minHeight: 200, maxWidth: 200, minWidth: 200), parentUsesSize: true);

    //2、根据子组件大小确定自身size
    size = constraints.constrain(Size(
        constraints.maxWidth == double.infinity
            ? child!.size.width
            : double.infinity,
        child!.constraints.maxHeight == double.infinity
            ? child!.size.height
            : double.infinity));
    //3、
    BoxParentData parentData = child!.parentData as BoxParentData;
    parentData.offset = ((size - child!.size) as Offset)/2;
  }

  @override
  void paint(PaintingContext context, Offset offset) {

    if (child != null) {
      final BoxParentData parentData = child!.parentData as BoxParentData;
      // 从 child.parentData 取出子节点相对当前节点的偏移 加上当前节点在屏幕中相对偏移
      context.paintChild(child!, parentData.offset + offset);

    }
  }
}
