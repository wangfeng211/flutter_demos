import 'package:animate_demo1/key_demos/key_practice_page.dart';
import 'package:animate_demo1/key_demos/key_types_page.dart';
import 'package:flutter/material.dart';

class KeyDemosPage extends StatefulWidget {
  const KeyDemosPage({Key? key}) : super(key: key);

  @override
  _KeyDemosPageState createState() => _KeyDemosPageState();
}

class _KeyDemosPageState extends State<KeyDemosPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('KeyDemo')),
      body: Column(
        children: [
          ElevatedButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context){
              return KeyTypesPage();
            }));
          }, child: Text('Key Types')),

          ElevatedButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context){
              return KeyPracticePage();
            }));
          }, child: Text('Key Practice '))
        ],
      ),
    );
  }
}
