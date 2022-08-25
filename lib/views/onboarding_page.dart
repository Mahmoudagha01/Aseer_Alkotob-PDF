
import 'package:bookjuice/views/splash.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:material_dialogs/material_dialogs.dart';

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: SafeArea(
        child: Scaffold(
          body: IntroductionScreen(
            pages: [
              PageViewModel(
                title: ' تصفح العديد من المؤلفات ',
                body:
                    'يحتوي التطبيق على العديد من المؤلفات كما يتم تقسيمهم الى عدة اقسام تبعا لتصنيفهم',
                image: Lottie.asset(
                  'assets/book1.json',
                  fit: BoxFit.contain,
                ),
                decoration: getPageDecoration(context),
              ),
              PageViewModel(
                title: 'قراءة الكتب مباشرة من خلال التطبيق',
                body:
                    'يمكنك تصفح الكتب والروايات وقرأتها مباشرة دون الحاجة الى تحميلها في جهازك',
                image:Lottie.asset(
                  'assets/book3.json',
                  fit: BoxFit.contain,
                ),
                decoration: getPageDecoration(context),
              ),
              PageViewModel(
                title: 'تحميل الكتب بكل سهولة',
                body: 'يمكنك تحميل الكتاب الذي تريده بصيغة PDF',
                image: Lottie.asset(
                  'assets/book2.json',
                  fit: BoxFit.contain,
                ),
                decoration: getPageDecoration(context),
              ),
              PageViewModel(
                title: 'حدد الكتب المفضلة',
                body:
                    'يمكنك اختيار الكتب المفضلة لديك لوضعهم في قائمة المفضلة لتطمن سهولة الوصول لها',
                footer: InkWell(
                  onTap:  () => goToHome(context),
                  child: Container(
                    width: MediaQuery.of(context).size.width/2,
                    height: 50,
                decoration: BoxDecoration(color:  Theme.of(context).primaryColor,borderRadius: BorderRadius.circular(15)),
                    child: const Center(child: Text("ابدأ في  استخدام التطبيق",style: TextStyle(color: Colors.white),)),
                  ),
                ),
                image: Lottie.asset(
                  'assets/book4.json',
                  fit: BoxFit.contain,
                ),
                decoration: getPageDecoration(context),
              ),
            ],

            done: const SizedBox(),
            onDone: () => goToHome(context),
            showNextButton: true,

            showSkipButton: true,
            skip: const Text(
              'تخطي',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                  color: Colors.grey),
            ),
            onSkip: () => goToHome(context),
            next: Text(
              'التالي',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                  color: Theme.of(context).primaryColor),
            ),
            dotsDecorator: getDotDecoration(),
            onChange: (index) => debugPrint('Page $index selected'),
            rtl: true,

            nextFlex: 0,
            // isProgressTap: false,
            // isProgress: false,
            // showNextButton: false,
            // freeze: true,
            // animationDuration: 1000,
          ),
        ),
      ),
    );
  }

  void goToHome(context) => Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => const SplashScreen()),
      );

  Widget buildImage(String path) =>
      Center(child: Image.asset(path, width: 350));

  DotsDecorator getDotDecoration() => DotsDecorator(
        color: const Color(0xFFBDBDBD),
        //activeColor: Colors.orange,
        size: const Size(10, 10),
        activeSize: const Size(22, 10),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
      );

  PageDecoration getPageDecoration(BuildContext context) => PageDecoration(
        titleTextStyle: TextStyle(
          fontSize: 28,
          fontWeight: FontWeight.bold,
          color: Theme.of(context).primaryColor,
        ),
        bodyTextStyle: const TextStyle(
            fontSize: 20, color: Color.fromARGB(255, 122, 122, 122)),
        imagePadding: const EdgeInsets.all(24),
        pageColor: Colors.white,
      );
}
