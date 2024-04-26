import 'package:animate_demo1/sliver_demos/1_sliver.dart';
import 'package:animate_demo1/sliver_demos/2_sliver_appbar.dart';
import 'package:animate_demo1/sliver_demos/3_sliver_list_demo.dart';
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
          }, child: Text('初识CustomScrollView')),

          ElevatedButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return SliverAppBarDemoPage();
            }));
          }, child: Text('SliverAppBar')),
          ElevatedButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return SliverListDemoPage();
            }));
          }, child: Text('滚动列表demo'))

        ],
      ),
    );
  }
}
