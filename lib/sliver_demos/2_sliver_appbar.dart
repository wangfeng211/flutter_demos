import 'package:flutter/material.dart';

class SliverAppBarDemoPage extends StatefulWidget {
  const SliverAppBarDemoPage({Key? key}) : super(key: key);

  @override
  _SliverAppBarDemoPageState createState() => _SliverAppBarDemoPageState();
}

class _SliverAppBarDemoPageState extends State<SliverAppBarDemoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const SliverAppBar(
            title: Text('SliverAppBar'),
            // pinned: true,//pinned 为true appbar 固定在顶部，不会随滚动而往上滑动
            floating: true,//设置为true 时，当滚动到下面页面时，向回滚动，appbar 立即从顶部出现
            snap: true,//floating 为true时才能设置snap 为true
            expandedHeight: 300,
            collapsedHeight: 300,
            // backgroundColor: Colors.pink,
            flexibleSpace: FlutterLogo(size: 500),//可以通过flexibleSpace 设置可拉伸背景
          ),
          const SliverToBoxAdapter(child: FlutterLogo(size: 200,),),
          SliverList.builder(itemCount: 30, itemBuilder: (context, index) {
            return Container(height: 50,color: Colors.primaries[ index % 5]);
          })
        ],
      ),
    );
  }
}
