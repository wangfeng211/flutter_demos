import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';

class FlareDemo extends StatefulWidget {
  const FlareDemo({Key? key}) : super(key: key);

  @override
  _FlareDemoState createState() => _FlareDemoState();
}

class _FlareDemoState extends State<FlareDemo> {

  String _name = "drawer";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Flare'),),
      body: Center(

        child: GestureDetector(
          onTap: (){
            setState(() {
              _name = "open";
            });
          },
          child: Container(
            width: 300,
            height: 300,
            child: FlareActor(
              'assets/slideout-menu.flr',
              animation: _name,
            ),
          ),
        ),
      ),
    );
  }
}
