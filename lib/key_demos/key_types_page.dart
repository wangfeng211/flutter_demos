import 'package:flutter/material.dart';

class KeyTypesPage extends StatefulWidget {
  const KeyTypesPage({Key? key}) : super(key: key);

  @override
  _KeyTypesPageState createState() => _KeyTypesPageState();
}

class _KeyTypesPageState extends State<KeyTypesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Key'),),
      body: Column(
        children: [
          Text('name'),
          TextField(key: ValueKey('name'),),

          Text('address'),
          TextField(key: ObjectKey('address'),),

          Text('phone'),
          TextField(key: UniqueKey(),),

          //global 可以在不同层级之间切换，保持状态不丢失
          //globalKey 还以获取currentWidget/ currentState/ currentContext  等信息
          Text('age'),
          TextField(key: GlobalKey(),),


        ],
      ),
    );
  }
}
