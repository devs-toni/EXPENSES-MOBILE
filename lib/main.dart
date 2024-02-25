import 'package:expenses/screens/login_screen.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    const String appTitle = 'Common Expenses';

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: appTitle,
      color: Colors.black12,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255,0,175,177)),
        useMaterial3: true,
      ),
      home: const Login(),
    );
  }
}

