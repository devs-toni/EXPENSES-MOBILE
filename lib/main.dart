import 'package:expenses/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    const String appTitle = 'Common Expenses';

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: appTitle,
      color: const Color.fromARGB(255, 0, 175, 175),
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255,0,175,177)),
        useMaterial3: true, 
      ),
      home: const Login(),
      builder: EasyLoading.init(),
    );
  }
}

