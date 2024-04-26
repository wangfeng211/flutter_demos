import 'dart:io';

import 'package:path_provider/path_provider.dart';

class FileStorage {

  //获取存储的路径
  Future<String> get _localPath async{
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  //获取文件路径
  Future<File> get _localFile async{
    final path = await _localPath;
    return File("$path/counter.txt");
  }

  //写入数据
  Future<File> writeData(int count) async{
    final file = await _localFile;
    return file.writeAsString("$count");
  }
  Future<int> readData()async{
    try {
      final file = await _localFile;
      final data = await file.readAsString();
      return int.parse(data);
    } catch (e) {
      print("readData err:$e");
      return 0;
    }

  }
}