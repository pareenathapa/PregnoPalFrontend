// import 'dart:async';
// import 'dart:ui' as ui;
//
// import 'package:flutter/foundation.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_svg/flutter_svg.dart';
//
// import 'contract/base_cache_service.dart';
//
// class AssetPngCacheService extends BaseCacheService<Uint8List> {
//   @override
//   bool get shouldCache => !kDebugMode;
//
//   @override
//   Future<Uint8List?> convert(String key) async {
//     try {
//       final pictureInfo = await vg.loadPicture(
//         SvgNetworkLoader(key),
//         null,
//       );
//       final ui.PictureRecorder pictureRecorder = ui.PictureRecorder();
//       final ui.Canvas canvas = ui.Canvas(pictureRecorder);
//       final ui.Image markerImage = await pictureRecorder.endRecording().toImage(
//         size.toInt() + 20,
//         size.toInt() + 35,
//       );
//       final ui.Paint fillPaint = ui.Paint()
//         ..color = Colors.white;
//       final ui.Path path_0 = ui.Path();
//       path_0.moveTo(29.2857 * scaleFactor, 4 * scaleFactor);
//       final ByteData? byteData =
//       await markerImage.toByteData(format: ui.ImageByteFormat.png);
//       if (byteData == null) return null;
//       return byteData;
//     } catch (e) {
//       return null;
//     }
//   }
// }
