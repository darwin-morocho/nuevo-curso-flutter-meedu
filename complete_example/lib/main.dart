import 'package:complete_example/app/inject.dart';
import 'package:flutter/material.dart';
import 'app/my_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await injectDependencies();
  runApp(const MyApp());
}
