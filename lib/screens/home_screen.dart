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
            // realtime changing.
            // Obx(
            //   () => Text(
            //     "${homeC.dataObs}",
            //     style: TextStyle(fontSize: 50),
            //   ),
            // ),

            // simple SM, make a trigger to change state.
            GetBuilder<HomeController>(
              builder: (controller) => Text(
                "${controller.dataObs}",
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
            SizedBox(height: 10),
            // button for trigger state changed.
            ElevatedButton(
              onPressed: () {
                homeC.refreshData();
              },
              child: Text("REFRESH"),
            ),
          ],
        ),
      ),
    );
  }
}
