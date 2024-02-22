import 'package:get/get.dart';

class HomeController extends GetxController {
  RxInt dataInt = 0.obs;

  void change() => dataInt++;

  @override
  void onInit() {
    ever(dataInt, (callback) => print("Changed"));
    once(dataInt, (callback) => print("Calls 1x in starting state"));
    debounce(
      dataInt,
      (callback) => print("Calls in 3 seconds"),
      time: const Duration(
        seconds: 3,
      ),
    );
    interval(
      dataInt,
      (callback) => print("Calls in every 2 seconds"),
      time: Duration(seconds: 2),
    );
    super.onInit();
  }
}
