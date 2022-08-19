// import 'dart:io';

// import 'package:dio/dio.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:open_file/open_file.dart';
// import 'package:path_provider/path_provider.dart';

// Future openBook({required String url, String? name}) async {
//   final file = await downloadBook(url, name!);
//   if (file == null) return;
//   debugPrint("path ${file.path}");
//   OpenFile.open(file.path);
// }

// Future downloadBook(String url, String name) async {
//   final appStorage = await getApplicationDocumentsDirectory();
//   final file = File('${appStorage.path}/bookjuice.pdf');
//   try {
//     final response = await Dio().get(url,
//         options: Options(
//           responseType: ResponseType.bytes,
//           followRedirects: false,
//           receiveTimeout: 0,
//         ));
//     final raf = file.openSync(mode: FileMode.write);
//     raf.writeFromSync(response.data);
//     await raf.close();
//     return file;
//   } catch (e) {
//     return null;
//   }
// }

// import 'dart:io';

// import 'package:dio/dio.dart';

// Future download2(Dio dio, String url, String savePath) async {
//     try {
//       Response response = await dio.get(
//         url,
//         onReceiveProgress: showDownloadProgress,
//         //Received data with List<int>
//         options: Options(
//             responseType: ResponseType.bytes,
//             followRedirects: false,
//             validateStatus: (status) {
//               return status! < 500;
//             }),
//       );
//       print(response.headers);
//       File file = File(savePath);
//       var raf = file.openSync(mode: FileMode.write);
//       // response.data is List<int> type
//       raf.writeFromSync(response.data);
//       await raf.close();
//     } catch (e) {
//       print(e);
//     }
//   }

//   void showDownloadProgress(received, total) {
//     if (total != -1) {
//       print((received / total * 100).toStringAsFixed(0) + "%");
//     }
//   }
