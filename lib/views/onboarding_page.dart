import 'package:bookjuice/services/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:bookjuice/views/pages.dart';

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: IntroductionScreen(
          pages: [
            PageViewModel(
              title: 'Answer the survey easily',
              body:
                  'You can diagnose by answering the survey and the result will appear immediately.',
              image: buildImage('assets/images/survey.png'),
              decoration: getPageDecoration(),
            ),
            PageViewModel(
              title: 'Upload child image easily',
              body:
                  'You can diagnose by uploading child image and the result will appear immediately',
              image: buildImage('assets/images/Upload1.png'),
              decoration: getPageDecoration(),
            ),
            PageViewModel(
              title: 'Choose the suitable activity',
              body:
                  'We will tell you child shortcomings in which category and recommend any activity to choose',
              image: buildImage('assets/images/gaming.png'),
              decoration: getPageDecoration(),
            ),
            PageViewModel(
              title: 'Your child will learn a lot',
              body:
                  'We will learn your child a lot of daily activites like reading clock ',
              image: buildImage('assets/images/Clock.png'),
              decoration: getPageDecoration(),
            ),
            PageViewModel(
              title: 'Take a lot of advice',
              body:
                  'You will learn more about Autism and how to deal with autistic child',
              footer: ElevatedButton(
                  onPressed: () => goToHome(context),
                  child: const Text("أبدا في  استخدام التطبيق")),
              image: buildImage('assets/images/communication.png'),
              decoration: getPageDecoration(),
            ),
          ],

          done: const SizedBox(),
          onDone: () => goToHome(context),
          showNextButton: true,

          showSkipButton: true,
          skip: const Text(
            'Skip',
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 20, color: Colors.grey),
          ),
          onSkip: () => goToHome(context),
          next: const Text(
            'Next',
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 20, color: Colors.grey),
          ),
          dotsDecorator: getDotDecoration(),
          onChange: (index) => debugPrint('Page $index selected'),
          globalBackgroundColor: Theme.of(context).primaryColor,

          nextFlex: 0,
          // isProgressTap: false,
          // isProgress: false,
          // showNextButton: false,
          // freeze: true,
          // animationDuration: 1000,
        ),
      ),
    );
  }

  void goToHome(context) => Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => const Pages()),
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

  PageDecoration getPageDecoration() => const PageDecoration(
        titleTextStyle: TextStyle(
          fontSize: 28,
          fontWeight: FontWeight.bold,
          color: Color.fromARGB(255, 39, 143, 221),
        ),
        bodyTextStyle:
            TextStyle(fontSize: 20, color: Color.fromARGB(255, 122, 122, 122)),
        imagePadding: EdgeInsets.all(24),
        pageColor: Colors.white,
      );
}
