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
        title: const Text(
          "BELAJAR TIPE DATA RX",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue,
      ),
      body: ListView(
        padding: EdgeInsets.all(30),
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Obx(
                () => Text(
                  "${homeC.dataInt}",
                  style: TextStyle(fontSize: 30),
                ),
              ),
              Row(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      homeC.decrementInt();
                    },
                    child: const Text(
                      "-",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: () {
                      homeC.incrementInt();
                    },
                    child: const Text(
                      "+",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 25),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Obx(
                () => Text(
                  "${homeC.dataString}",
                  style: TextStyle(fontSize: 20),
                ),
              ),
              Row(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      homeC.updateString();
                    },
                    child: const Text(
                      "Update",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: () {
                      homeC.resetString();
                    },
                    child: const Text(
                      "Reset",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 25),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Obx(
                () => Text(
                  "${homeC.dataBool}",
                  style: TextStyle(fontSize: 20),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  homeC.switchBool();
                },
                child: const Text(
                  "Switch",
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ],
          ),
          SizedBox(height: 25),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Obx(
                () => Text(
                  "${homeC.dataList}",
                  style: TextStyle(fontSize: 20),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  homeC.addNumber();
                },
                child: const Text(
                  "Add Number",
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ],
          ),
          Divider(thickness: 2),
          Row(
            children: [
              Expanded(
                child: Obx(
                  () => ListTile(
                    leading: CircleAvatar(
                      child: Text(
                        "${homeC.dataMap['id']}",
                      ),
                    ),
                    title: Text("${homeC.dataMap['name']}"),
                    subtitle: Text("${homeC.dataMap['age']} tahun"),
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  homeC.changeName();
                },
                child: const Text(
                  "Change",
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
