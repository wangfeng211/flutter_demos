import 'package:animate_demo1/sliver_demos/1_sliver.dart';
import 'package:flutter/material.dart';

class SliverDemosPage extends StatefulWidget {
  const SliverDemosPage({Key? key}) : super(key: key);

  @override
  _SliverDemosPageState createState() => _SliverDemosPageState();
}

class _SliverDemosPageState extends State<SliverDemosPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SliverDemos'),
      ),
      body: Column(
        children: [
          ElevatedButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return SliverPageOne();
            }));
          }, child: Text('初识CustomScrollView'))
        ],
      ),
    );
  }
}
