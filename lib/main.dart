import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:gym_presence/controllers/home_controller.dart';
import 'firebase_options.dart';
import 'package:get/get.dart';
import 'package:gym_presence/screens/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  // final homeC = Get.put(HomeController()); // proses Get.put dilakukan di awal state.
  final homeC = Get.lazyPut(() =>
      HomeController()); // akan memproses Get.put ketika ada screen yg membutuhkan.

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Gym Presence',
      home: HomeScreen(),
    );
  }
}
