import 'package:flutter/material.dart';

import 'package:material_dialogs/material_dialogs.dart';
import 'package:url_launcher/url_launcher.dart';

class Ask extends StatelessWidget {
  const Ask({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("طلب كتاب"),
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 3),
              child: Image.asset("assets/images/logo.png"),
            )
          ],
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.all(20.0),
              child: Text(
                '''يمكنكم طلب كتاب او رواية عبر ارسال رسالة على صفحة التيليجرام تحتوي على اسم الكتاب والكاتب وسيتم اضافتها في التطبيق على الفور''',
                textAlign: TextAlign.center,
              ),
            ),
            InkWell(
              onTap: () async {
                const url = 'https://t.me/Mahm0ud_Agha';
                await launch(url);
              },
              child: Lottie.asset('assets/tele.json',
                  fit: BoxFit.cover, repeat: false),
            ),
          ],
        ),
      ),
    );
  }
}
