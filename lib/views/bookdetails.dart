import 'dart:io';
import 'package:bookjuice/models/file_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animation_progress_bar/flutter_animation_progress_bar.dart';
import 'package:material_dialogs/material_dialogs.dart';
import 'package:material_dialogs/widgets/buttons/icon_button.dart';
import 'package:path_provider/path_provider.dart';
import 'Reader_screan.dart';

class BookDetails extends StatefulWidget {
  const BookDetails({required this.bookId, Key? key}) : super(key: key);
  final bookId;
  @override
  State<BookDetails> createState() => _BookDetailsState();
}

class _BookDetailsState extends State<BookDetails> {
  bool downloading = false;

  String progress = '0';

  bool isDownloaded = false;

  Future downloadFile(uri, fileName) async {
    setState(() {
      downloading = true;
    });

    String savePath = await getFilePath(fileName);

    Dio dio = Dio();

    dio.download(
      uri,
      savePath,
      onReceiveProgress: (rcv, total) {
        debugPrint(
            'received: ${rcv.toStringAsFixed(0)} out of total: ${total.toStringAsFixed(0)}');
        debugPrint(savePath);
        setState(() {
          progress = ((rcv / total) * 100).toStringAsFixed(0);
        });

        if (progress == '100') {
        } else if (double.parse(progress) < 100) {}
      },
      deleteOnError: true,
    ).then((_) {
      Dialogs.materialDialog(
          color: Colors.white,
         msgAlign: TextAlign.right,
          msg: 'تم تنزيل الملف! يمكنك رؤية ملفك في ملفات المحملة',
          title: 'تم تحميل الكتاب بنجاح',
          lottieBuilder: Lottie.asset(
            'assets/cong_example.json',
            fit: BoxFit.contain,
          ),
          context: context,
          actions: [
            IconsButton(
              onPressed: () {
                Navigator.of(context, rootNavigator: true).pop();
              },
              text: 'فهمت',
              iconData: Icons.done,
              color: Theme.of(context).primaryColor,
              textStyle: const TextStyle(
                color: Colors.white,
              ),
              iconColor: Colors.white,
            ),
          ]);

      setState(() {
        isDownloaded = true;
      });
      setState(() {
        if (progress == '100') {
          isDownloaded = true;
        }

        downloading = false;
      });
    });
  }

  Future<String> getFilePath(uniqueFileName) async {
    String path = '';

    Directory dir = await getApplicationDocumentsDirectory();

    path = '${dir.path}/$uniqueFileName.pdf';

    return path;
  }

  @override
  Widget build(BuildContext context) {
    final selectedBook = File.filesList.firstWhere(
      (element) => element.id == widget.bookId,
    );
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: Text("${selectedBook.title}"),
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 3),
              child: Image.asset("assets/images/logo.png"),
            )
          ],
        ),
        body: downloading
            ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width * 0.5,
                      child: FAProgressBar(
                        size: 15,
                        direction: Axis.horizontal,
                        maxValue: 100,
                        currentValue: double.parse(progress),
                        progressColor: Theme.of(context).primaryColor,
                        border: Border.all(
                          color: Colors.grey,
                          width: 0.1,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10,),
                  Text(
                    "جاري تحميل الكتاب: $progress %",
                    style: const TextStyle(
                      color: Colors.black,
                    ),
                  )
                ],
              )
            : SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * 0.4,
                        decoration: const BoxDecoration(
                            color: Color.fromRGBO(255, 231, 191, 1)),
                      ),
                      Positioned(
                        bottom: 8,
                        left: MediaQuery.of(context).size.width * 0.3,
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.4,
                          height: MediaQuery.of(context).size.height * 0.33,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(18),
                              image: DecorationImage(
                                  image: NetworkImage(
                                    "${selectedBook.img}",
                                  ),
                                  fit: BoxFit.fill)),
                        ),
                      ),
                    ]),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Icon(
                            Icons.description_outlined,
                            color: Theme.of(context).primaryColor,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          const Text(
                            "وصف الكتاب",
                            style: TextStyle(height: 3),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: Text(
                        "${selectedBook.description}",
                        style: const TextStyle(color: Colors.black54),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Icon(
                            Icons.dashboard_outlined,
                            color: Theme.of(context).primaryColor,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          const Text(
                            "معلومات اخرى",
                            style: TextStyle(height: 3),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Text.rich(
                        TextSpan(
                          children: [
                            const TextSpan(
                              text: 'المؤلف:  ',
                              style: TextStyle(color: Colors.black54),
                            ),
                            TextSpan(
                              text: '${selectedBook.author}',
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 3),
                      child: Text.rich(
                        TextSpan(
                          children: [
                            const TextSpan(
                              text: 'عدد الصفحات:  ',
                              style: TextStyle(color: Colors.black54),
                            ),
                            TextSpan(
                              text: '${selectedBook.pageNum}',
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 3),
                      child: Text.rich(
                        TextSpan(
                          children: [
                            const TextSpan(
                              text: 'حجم الملف:  ',
                              style: TextStyle(color: Colors.black54),
                            ),
                            TextSpan(
                              text: '${selectedBook.size}',
                            ),
                            const TextSpan(
                              text: ' ميجا بايت',
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 3),
                      child: Text.rich(
                        TextSpan(
                          children: [
                            const TextSpan(
                              text: 'سنة النشر:  ',
                              style: TextStyle(color: Colors.black54),
                            ),
                            TextSpan(
                              text: '${selectedBook.date}',
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 3),
                      child: Text.rich(
                        TextSpan(
                          children: [
                            const TextSpan(
                              text: 'دار النشر:  ',
                              style: TextStyle(color: Colors.black54),
                            ),
                            TextSpan(
                              text: '${selectedBook.dar}',
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton.icon(
                            onPressed: () {
                              // Navigator.pushNamed(context, AppRoutes.readscreen,arguments: {"url":selectedBook.url});
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          ReaderScreen(selectedBook)));
                            },
                            icon: Icon(
                              Icons.read_more,
                              color: Theme.of(context).primaryColor,
                            ),
                            label: FittedBox(
                              child: Text(
                                "قراءة ",
                                style: TextStyle(
                                    fontFamily: "Shamel",
                                    color: Theme.of(context).primaryColor,
                                    fontSize: 17),
                              ),
                            ),
                            style: ElevatedButton.styleFrom(
                                side: BorderSide(
                                  color: Theme.of(context).primaryColor,
                                  width: 1,
                                ),
                                primary: Colors.white,
                                fixedSize: Size(
                                    MediaQuery.of(context).size.width / 2.5,
                                    60),
                                textStyle: const TextStyle(
                                    fontSize: 30, fontWeight: FontWeight.bold)),
                          ),
                          const SizedBox(
                            width: 25,
                          ),
                          ElevatedButton.icon(
                            onPressed: () async {
                              downloadFile("${selectedBook.url}",
                                  "${selectedBook.title}");
                              // openBook(
                              //     uri: "${selectedBook.url}",
                              //     fileName: "${selectedBook.title}");
                            },
                            icon: Icon(
                              Icons.download,
                              color: Theme.of(context).primaryColor,
                            ),
                            label: FittedBox(
                              child: Text(
                                "تحميل ",
                                style: TextStyle(
                                    fontSize: 17,
                                    color: Theme.of(context).primaryColor,
                                    fontFamily: "Shamel"),
                              ),
                            ),
                            style: ElevatedButton.styleFrom(
                                side: BorderSide(
                                    color: Theme.of(context).primaryColor,
                                    width: 1),
                                primary: Colors.white,
                                fixedSize: Size(
                                    MediaQuery.of(context).size.width / 2.5,
                                    60),
                                textStyle: const TextStyle(
                                    fontSize: 30, fontWeight: FontWeight.bold)),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
