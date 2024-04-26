import 'package:flutter/material.dart';

//下拉菜单
class DrapdownMenuDemoPage extends StatefulWidget {
  const DrapdownMenuDemoPage({Key? key}) : super(key: key);

  @override
  _DrapdownMenuDemoPageState createState() => _DrapdownMenuDemoPageState();
}

class _DrapdownMenuDemoPageState extends State<DrapdownMenuDemoPage> {
  final List<String> _data = [
    "苹果",
    "香蕉",
    "橘子",
    "鸭梨",
  ];

  String _dropData = "";
  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('下拉菜单'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('你选择的数据：$_dropData'),
          const SizedBox(
            height: 20,
          ),
          DropdownMenu<String>(
            //点击的时候是否可以弹出软键盘
            requestFocusOnTap: true,
            controller: _controller,
            hintText: "请选择",
            menuHeight: 200,
            //默认初始值
            initialSelection: _data.first,
            dropdownMenuEntries: _buildDropdownList(),
            onSelected: _onSelected,
            
            menuStyle: MenuStyle(
              backgroundColor: MaterialStateProperty.all(Colors.white),
              surfaceTintColor: MaterialStateProperty.all(Colors.white)
            ),
          )
        ],
      ),
    );
  }

  //自定义下拉选项
  List<DropdownMenuEntry<String>> _buildDropdownList() {
    return _data
        .map((e) => DropdownMenuEntry(
            value: e,
            label: e,
            labelWidget: Row(
              children: [ Text(e), const Icon(Icons.add, size: 30)],
            )))
        .toList();
  }

  _onSelected(String? data) {
    setState(() {
      _dropData = data ?? '';
    });
  }
}
