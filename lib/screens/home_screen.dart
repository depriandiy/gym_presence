import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gym_presence/controllers/home_controller.dart';

class HomeScreen extends StatelessWidget {
  final homeC = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Belajar GetX"),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(
              () => Text(
                "${homeC.dataObs}",
                style: TextStyle(fontSize: 50),
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                homeC.addData();
              },
              child: Text("ADD DATA"),
            ),
          ],
        ),
      ),
    );
  }
}
