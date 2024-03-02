import 'package:flutter/material.dart';

class SliverPageOne extends StatefulWidget {
  const SliverPageOne({Key? key}) : super(key: key);

  @override
  _SliverPageOneState createState() => _SliverPageOneState();
}

class _SliverPageOneState extends State<SliverPageOne> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('初识 CustomScroll'),
      ),
      body: CustomScrollView(
        slivers: [
          // Sliver 系列有各种各样的Sliver,通常用的比较多的有SliverToBoxAdapter
          const SliverToBoxAdapter(
            child: FlutterLogo(
              size: 50,
            ),
          ),
          //还可以嵌套 滚动列表，其实ListView就是封装了SliverList.builder
          SliverList.builder(
              itemCount: 20,
              itemBuilder: (context, index) {
                return Container(
                  height: 80,
                  color: Colors.primaries[index % Colors.primaries.length],
                );
              }),
          SliverGrid.builder(
              itemCount: 10,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 5,
              ),
              itemBuilder: (context, index) {
                return Container(
                  color: Colors.primaries[index % 5],
                );
              })
        ],
      ),
    );
  }
}
