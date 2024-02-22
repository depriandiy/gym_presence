import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
            ElevatedButton(
              onPressed: () {
                Get.snackbar("Messages", "Tes 2");
              },
              child: Text("SNACKBAR"),
            ),
            ElevatedButton(
              onPressed: () {
                Get.defaultDialog(
                  title: "Dialog",
                  content: Text("Ini adalah contoh dialog."),
                  actions: [
                    OutlinedButton(
                      onPressed: () {},
                      child: Text("Cancel"),
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      child: Text("Done"),
                    ),
                  ],
                );
              },
              child: Text("DIALOG"),
            ),
            ElevatedButton(
              onPressed: () {
                Get.bottomSheet(
                  Container(
                    height: 250,
                    color: Colors.blue,
                    child: ListView(
                      children: const [
                        ListTile(
                          title: Text("Home"),
                          leading: Icon(Icons.home),
                        ),
                        ListTile(
                          title: Text("Profile"),
                          leading: Icon(Icons.person),
                        ),
                        ListTile(
                          title: Text("Settings"),
                          leading: Icon(Icons.settings),
                        ),
                      ],
                    ),
                  ),
                );
              },
              child: Text("BOTTOM SHEET"),
            ),
          ],
        ),
      ),
    );
  }
}
