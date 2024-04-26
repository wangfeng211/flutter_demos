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
              size: 30,
            ),
          ),
          // SliverToBoxAdapter(child: SizedBox(height: 20,),),
          //还可以嵌套 滚动列表，其实ListView就是封装了SliverList.builder
          SliverList.builder(
              itemCount: 3,
              itemBuilder: (context, index) {
                return Container(
                  height: 80,
                  color: Colors.primaries[index % Colors.primaries.length],
                );
              }),
          SliverPadding(padding: EdgeInsets.all(10)),

          //Sliver 中的网格
          SliverGrid.builder(
              itemCount: 7,
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 100,
              ),
              itemBuilder: (context, index) {
                return Container(
                  color: Colors.primaries[index % 5],
                );
              }),

          SliverLayoutBuilder(builder: (context, constrain){
            print(constrain);
            return SliverToBoxAdapter();
          }),
          //页面没有沾满屏幕时 用于填充剩余空间
          SliverFillRemaining(
            //使用一个组件在剩余空间居中
            child: Center(
              child: FlutterLogo(),
            ),
          ),
        ],
      ),
    );
  }
}
