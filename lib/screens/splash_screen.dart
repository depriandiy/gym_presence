import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gym_presence/screens/home_screen.dart';
import 'package:introduction_screen/introduction_screen.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({super.key});

  List<PageViewModel> listPagesViewModel = [
    PageViewModel(
      title: "Title of custom button page",
      body: "This is a description on a page with a custom button below.",
      image: Image.asset("assets/images/splash1.png", height: 175.0),
    ),
    PageViewModel(
      title: "Title of custom button page",
      body: "This is a description on a page with a custom button below.",
      image: Image.asset("assets/images/splash2.png", height: 175.0),
    ),
    PageViewModel(
      title: "Title of custom button page",
      body: "This is a description on a page with a custom button below.",
      image: Image.asset("assets/images/splash3.png", height: 175.0),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      pages: listPagesViewModel,
      showBackButton: true,
      showNextButton: true,
      back: const Icon(Icons.arrow_back),
      next: const Icon(Icons.arrow_forward),
      done: const Text("Done"),
      onDone: () {
        // Get.off(() => HomeScreen());
        Get.offNamed("/home");
      },
    );
  }
}
