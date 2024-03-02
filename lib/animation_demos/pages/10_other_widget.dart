import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OtherWidgetPage extends StatefulWidget {
  const OtherWidgetPage({Key? key}) : super(key: key);

  @override
  _OtherWidgetPageState createState() => _OtherWidgetPageState();
}

class _OtherWidgetPageState extends State<OtherWidgetPage> {
  bool _show = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('title'),
      ),
      body: Column(
        children: [
          ElevatedButton(
              onPressed: () {
                setState(() {
                  _show = !_show;
                });
              },
              child: Text('点击')),
          if (_show)
            Flexible(
                child: ModalBarrier(
              dismissible: true,
              color: Colors.black38,
            ))
        ],
      ),
    );
  }
}
