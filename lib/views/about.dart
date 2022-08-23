import 'package:flutter/material.dart';


class About extends StatelessWidget {
  const About({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
            title: const Text("حول التطبيق"),
            actions: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 3),
                child: Image.asset("assets/images/logo.png"),
              )
            ],
          ),
          body: const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text("هذا التطبيق هو مشروع فردي هدفه توفير مجموعة ضخمة من الكتب والروايات  تشجيعا للقراءة.",textAlign: TextAlign.center,),
          ),
      ),
    );
  }
}
