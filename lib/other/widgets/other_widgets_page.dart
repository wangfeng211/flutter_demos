import 'package:animate_demo1/other/widgets/drapdown_menu_page.dart';
import 'package:flutter/material.dart';

class OtherPage extends StatefulWidget {
  const OtherPage({Key? key}) : super(key: key);

  @override
  _OtherWidgetPageState createState() => _OtherWidgetPageState();
}

class _OtherWidgetPageState extends State<OtherPage> {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('下拉菜单'),
      ),
      body: Column(
        children: [

          ElevatedButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return DrapdownMenuDemoPage();
            }));
          }, child: Text('下拉菜单')),

        ],
      ),
    );
  }
}
