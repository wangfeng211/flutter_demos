import 'package:flutter/material.dart';

//排序算法
class AlgorithmPage extends StatefulWidget {
  const AlgorithmPage({super.key});

  @override
  State<AlgorithmPage> createState() => _AlgorithmPageState();
}

class _AlgorithmPageState extends State<AlgorithmPage> {
  //选择排序 冒泡排序 练习
  List arr = [3, 5, 2, 7, 1, 8, 9];

  @override
  void initState() {
    super.initState();

    //选择排序
    for (int i = 0; i < arr.length; i++) {
      int minIndex = i;
      for (int j = i + 1; j < arr.length - 1; j++) {
        if (arr[minIndex] > arr[j]) {
          switchNum(minIndex, j);
        }
      }
    }
    print(arr);

    //冒泡排序
  }

  //交换两个数的位置
  switchNum(int i1, int i2) {
    int tem = arr[i1];
    arr[i1] = arr[i2];
    arr[i2] = tem;
  }

  double _distance = 2.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Algorithm'),
      ),
    );
  }
}
