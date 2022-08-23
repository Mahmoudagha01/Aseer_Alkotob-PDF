import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class Copy extends StatelessWidget {
  const Copy({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("حقوق الملكية الفكرية"),
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 3),
              child: Image.asset("assets/images/logo.png"),
            )
          ],
        ),
        body: const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            "جميع الكتب والروايات الواردة في هذا التطبيق تخضع لحقوق الملكية الفكرية  وحقوق الطبع والنشر  والى مؤلف  الكتاب ودور الطباعة وفي حالة وجود اعتراض على نشر كتاب معين يرجى ابلاغنا وسيتم التعامل معه فورا",
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
