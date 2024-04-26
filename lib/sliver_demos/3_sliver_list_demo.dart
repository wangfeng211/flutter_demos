import 'package:flutter/material.dart';

class SliverListDemoPage extends StatefulWidget {
  const SliverListDemoPage({Key? key}) : super(key: key);

  @override
  _SliverListDemoPageState createState() => _SliverListDemoPageState();
}

class _SliverListDemoPageState extends State<SliverListDemoPage> {
  List<Member> _dataList = [];

  @override
  void initState() {
    super.initState();
    _dataList = List.generate(40, (index) {
      return Member(
          id: index, name: "textName:$index", gName: "${index ~/ 10}");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('滚动列表'),
      ),
      body: CustomScrollView(
        slivers: [
          SliverPersistentHeader(
            delegate: HeaderDelegate('Header - 0'),
            pinned: false,
            floating: false,
          ),
          _list('0'),
          SliverPersistentHeader(
            delegate: HeaderDelegate('Header - 1'),
            pinned: false,
          ),
          _list('1'),
          SliverPersistentHeader(
              delegate: HeaderDelegate('Header - 2'), pinned: false),
          _list('2'),
          SliverPersistentHeader(
              delegate: HeaderDelegate('Header - 3'), pinned: false),
          _list('3'),
          SliverToBoxAdapter(
            child: _buildOverflowBox(),
          )
        ],
      ),
    );
  }

  //测试OverflowBox 组件
  //使用 OverflowBox 可以突破父组件的约束
  Widget _buildOverflowBox() {
    return Center(
      child: Container(
        width: 100,
        height: 100,
        color: Colors.blue,
        child: OverflowBox(
            minHeight: 50,
            minWidth: 200,
            maxHeight: 50,
            maxWidth: 200,
            child: Container(
              color: Colors.pink,
            )),
      ),
    );
  }

  Widget _list(String gName) {
    final gMember = _dataList.where((m) => m.gName == gName).toList();
    return SliverList.builder(
        itemCount: gMember.length,
        itemBuilder: (context, index) {
          final m = gMember[index];
          return Column(children: [Text('name:m.name'), Text('id: ${m.id}')]);
        });
  }
}

class HeaderDelegate extends SliverPersistentHeaderDelegate {
  String header;

  HeaderDelegate(this.header);

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: Colors.pink,
      height: 40,
      child: Text('header ${header}'),
    );
  }

  @override
  double get maxExtent => 40;

  @override
  double get minExtent => 40;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}

class Member {
  int id;
  String name;
  String gName; //组名称
  Member({required this.id, required this.name, required this.gName});

  @override
  String toString() {
    return "$id-$gName-$name";
  }
}
