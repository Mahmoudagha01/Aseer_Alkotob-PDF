import 'package:bookjuice/widgets/GridfixedHeight.dart';
import 'package:bookjuice/widgets/bookitem.dart';
import 'package:flutter/material.dart';
import 'package:material_dialogs/material_dialogs.dart';
import '../models/file_model.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  TextEditingController controller = TextEditingController();
  List books = [];
  bool? _wasEmpty;

  @override
  void initState() {
    books.addAll(File.filesList);
    super.initState();

    _wasEmpty = controller.text.isEmpty;
    controller.addListener(() {
      if (_wasEmpty != controller.text.isEmpty) {
        setState(() => {_wasEmpty = controller.text.isEmpty});
      }
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  List<String> dummydatalist = [];

  filterSearch(String query) {
    if (query.isNotEmpty) {
      for (var item in File.filesList) {
        if (item.title == query) {
          dummydatalist.add(item.title!);
        }
      }
      setState(() {
        books.clear();
        books.addAll(dummydatalist);
      });
      return;
    } else {
      setState(() {
        books.clear();
        books.addAll(File.filesList);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "عصير الكتب - PDF",
            style: TextStyle(color: Theme.of(context).primaryColor),
          ),
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back,
                color: Theme.of(context).primaryColor,
              )),
          elevation: 0,
          backgroundColor: Colors.transparent,
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 3),
              child: Image.asset("assets/images/logo.png"),
            )
          ],
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              child: TextField(
                controller: controller,
                onChanged: (value) {
                  filterSearch(value);
                },
                cursorColor: Theme.of(context).primaryColor,
                decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 20),
                    filled: true,
                    fillColor: Colors.white,
                    hintText: "ابحث عن كتاب",
                    suffixIcon: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.search,
                          color: Theme.of(context).primaryColor,
                        )),
                    prefixIcon: controller.text.isNotEmpty
                        ? Padding(
                            padding:
                                const EdgeInsetsDirectional.only(start: 12.0),
                            child: IconButton(
                              iconSize: 16.0,
                              icon: const Icon(
                                Icons.close,
                                color: Colors.grey,
                              ),
                              onPressed: () {
                                setState(() {
                                  controller.clear();
                                });
                              },
                            ),
                          )
                        : null,
                    border: const OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.all(Radius.circular(15.0)))),
              ),
            ),
            controller.text.isEmpty
                ? Lottie.asset(
                    'assets/search.json',
                    fit: BoxFit.cover,
                    repeat: true,
                  )
                : Expanded(
                    child: GridView(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCountAndFixedHeight(
                            height: 300, crossAxisCount: 2),
                    children: File.filesList
                        .where((book) =>
                            book.title == controller.text ||
                            book.author == controller.text)
                        .map((e) => BookItem(
                            id: e.id!,
                            title: e.title!,
                            author: e.author!,
                            dar: e.dar!,
                            date: e.date!,
                            description: e.description!,
                            img: e.img!,
                            url: e.url!))
                        .toList(),
                  ))
          ],
        ),
      ),
    );
  }
}
