import 'package:flutter_meedu/meedu.dart';

class CounterController extends SimpleNotifier {
  int counter = 0;
  // String name = "";

  void increment() {
    counter++;
    notify();
  }

  // void generateName() {
  //   name = DateTime.now().toString();
  //   notify();
  // }
}
