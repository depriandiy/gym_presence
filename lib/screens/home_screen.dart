import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gym_presence/controllers/home_controller.dart';
import 'package:gym_presence/screens/profile_screen.dart';

class HomeScreen extends StatelessWidget {
  HomeController homeC = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Dependencies Managament Getx",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "${homeC.data['name']} - ${homeC.data['age']} Tahun.",
                style: TextStyle(fontSize: 25),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Get.toNamed("/profile");
                },
                child: Text("Next >>"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
