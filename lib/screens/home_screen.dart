import 'package:expenses/widgets/subscription.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Gastos Comunes', style: TextStyle(fontSize: 18)),
          backgroundColor: Colors.green[400],  
          toolbarHeight: 50,
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.green[400],
          onPressed: (){

          },
          child: const Icon(Icons.menu),
        ),
        body: const Subscription(),
    );
  }
}
