//
// import 'package:flutter/material.dart';
// import 'package:wechat_assets_picker/wechat_assets_picker.dart';
//
// class DragAssetAnoReorderDemoPage extends StatefulWidget {
//   const DragAssetAnoReorderDemoPage({Key? key}) : super(key: key);
//
//   @override
//   _DragAssetAnoReorderDemoPageState createState() =>
//       _DragAssetAnoReorderDemoPageState();
// }
//
// class _DragAssetAnoReorderDemoPageState
//     extends State<DragAssetAnoReorderDemoPage> {
//   final List<AssetEntity> dataList = [
//     AssetEntity(id: '-1', typeInt: -1, width: 0, height: 0)
//   ];
//
//   //正在被拖拽
//   bool _isDragNow = false;
//   //即将被删除
//   bool _willDelete = false;
//   //将要被排序
//   bool _willOrder = false;
//   //被拖拽的元素id
//   String dragId = "";
//   AssetEntity ? dragAsset;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('DragAssetAndReorder'),
//       ),
//       bottomSheet: _isDragNow ? DragTarget<AssetEntity>(
//         // onMove: (detail){
//         //   print('-----');
//         // },
//         onWillAccept: (data) {
//           setState(() {
//             _willDelete = true;
//           });
//           return true;
//         },
//         onLeave: (_) {
//           setState(() {
//             _willDelete = false;
//           });
//         },
//         onAccept: (data) {
//           setState(() {
//             dataList.remove(data);
//             _willDelete = false;
//           });
//         },
//         builder: (BuildContext context, List<Object?> candidateData,
//             List<dynamic> rejectedData) {
//           return Container(
//             width: double.infinity,
//             height: 150,
//             color: _willDelete ? Colors.pink[200] : Colors.pink,
//             child: Icon(
//               Icons.delete_forever,
//               size: 70,
//               color: Colors.white,
//             ),
//           );
//         },
//       ) : null,
//       body: Container(
//         child: Column(
//           children: [
//             Wrap(
//               spacing: 5,
//                 runSpacing: 5,
//                 alignment: WrapAlignment.center,
//                 children: dataList.map((asset) {
//                   if (asset.id == '-1') {
//                     //添加图片按钮
//                     return _buildAddPhotoWidget();
//                   }
//                   return DragTarget <AssetEntity>(
//                     onWillAccept: (data){
//                       setState(() {
//                         _willOrder = true;
//                         dragId = data!.id;
//                       });
//                       return true;
//                     },
//                     onLeave: (data) {
//                       setState(() {
//                         _willOrder = false;
//                       });
//                     },
//                     onAccept: (data){
//
//                       print('on accept id:${ data.id}');
//
//                       setState(() {
//                         var oriIndex = dataList.indexOf(dragAsset!);
//                         var curIndex = dataList.indexOf(data);
//                         dataList.removeAt(curIndex );
//                         dataList.insert(oriIndex, data);
//                         _willDelete = false;
//                       });
//
//                     },
//                     builder: (BuildContext context, List<Object?> candidateData, List<dynamic> rejectedData) {
//                       return  Container(
//                         child: childItem(asset, onDragStart: () {
//                           setState(() {
//                             _isDragNow = true;
//                             dragAsset = asset;
//                             print('drag start id:${ asset.id}');
//                           });
//                         }, onDragCanceled: () {
//                           setState(() {
//                             _isDragNow = false;
//                           });
//                         }),
//                       );
//                     },
//                   );
//                 }).toList()),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget _buildAddPhotoWidget(){
//     return Container(
//       width: 100,
//       height: 100,
//       decoration: BoxDecoration(
//           border: Border.all(width: 1, color: Colors.orange)),
//       child: IconButton(
//           onPressed: () async {
//             final List<AssetEntity>? result =
//             await AssetPicker.pickAssets(context);
//
//             if (result != null && result.length > 0) {
//               setState(() {
//                 result.forEach((_asset) {
//                   dataList.insert(0, _asset);
//                 });
//               });
//             }
//           },
//           icon: const Icon(
//             Icons.add,
//             size: 50,
//           )),
//     );
//   }
//
//   Widget childItem(AssetEntity assetEntity,
//       {VoidCallback? onDragStart, VoidCallback? onDragCanceled}) {
//     final box = Container(
//       width: 100,
//       height: 100,
//       child: Image(
//         image: AssetEntityImageProvider(assetEntity, isOriginal: false),
//       ),
//     );
//
//     return Draggable<AssetEntity>(
//       //如果要配合DragTarget 适应，data 属性必传
//       data: assetEntity,
//       onDragStarted: onDragStart,
//       onDraggableCanceled: (_, __) {
//         onDragCanceled != null ? onDragCanceled() : null;
//       },
//       childWhenDragging: Opacity(opacity: 0.5, child: box),
//       feedback: box,
//       child: box,
//     );
//   }
// }
