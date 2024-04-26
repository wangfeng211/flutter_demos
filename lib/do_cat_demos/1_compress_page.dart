import 'package:flutter/material.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:path_provider/path_provider.dart';
// import 'package:wechat_assets_picker/wechat_assets_picker.dart';

class CompressPage extends StatefulWidget {
  const CompressPage({Key? key}) : super(key: key);

  @override
  _CompressPageState createState() => _CompressPageState();
}

class _CompressPageState extends State<CompressPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text('Compress'),),
    body: Column(
      children: [
        ElevatedButton(onPressed: () async{
          // List<AssetEntity>? result = await AssetPicker.pickAssets(context);
          // if (result != null) {
          //   final asset = result.last;
          //   var file = await asset.file;
          //   var dir = await getTemporaryDirectory();
          //   var descDir = dir.absolute.path + '/' + DateTime.now().millisecondsSinceEpoch.toString() + 'jpg';
          //   var rest = await FlutterImageCompress.compressAndGetFile(file!.absolute.path, descDir);
          //   int len = await rest!.length();
          //   print("压缩后： ${len}");
          // }
        }, child: Text('选择一个图片进行压缩'))
      ],
    ),
    );
  }
}
