import 'package:bookjuice/models/file_model.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class ReaderScreen extends StatelessWidget {
  ReaderScreen(this.file,{Key? key}) : super(key: key);
  File file;
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(title: Text("${file.title}"),actions: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 3),
              child: Image.asset("assets/images/logo.png"),
            )
          ],),
        body: SfPdfViewer.network("${file.url}"),
      ),
    );
  }
}
