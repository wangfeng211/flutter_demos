import 'package:animate_demo1/layout_demo_page/1_custom_multichild_layout_page.dart';
import 'package:animate_demo1/layout_demo_page/2_my_render_box_demo_page.dart';
import 'package:flutter/material.dart';

class LayoutDemoPage extends StatefulWidget {
  const LayoutDemoPage({Key? key}) : super(key: key);

  @override
  _LayoutDemoPageState createState() => _LayoutDemoPageState();
}

class _LayoutDemoPageState extends State<LayoutDemoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('')),
      body: Column(
        children: [
          ColoredBox(color: Colors.red),// SingleChildRenderObjectWidget
          Padding(padding: EdgeInsets.all(9)),//SingleChildRenderObjectWidget
          // Text("data"),
          RichText(text: TextSpan()),// MultiChildRenderObjectWidget
          // Image(image: AssetImage('')),
          RawImage(), //  LeafRenderObjectWidget
          ElevatedButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context){
              return MyCustomMultiChildLayoutPage();
            }));
          }, child: Text('CustomMultiChildLayout')),

          ElevatedButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context){
              return MyRenderBoxDemoPage();
            }));
          }, child: Text('MyRenderBoxDemoPage'))
        ],
      ),
    );
  }
}
