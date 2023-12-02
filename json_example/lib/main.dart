import 'package:flutter/material.dart';
import 'package:json_example/veri.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter JSON UYGULAMASI',
      theme: ThemeData(primarySwatch: Colors.pink),
       home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Json Api İle Veri Getirme'),),
        body: Center(
          child:ElevatedButton(onPressed:(){
           Navigator.of(context).push(MaterialPageRoute(builder: (context)=>VeriPage()));
          } ,child: const Text('Butona Basarak Verileri Getirebilirsiniz'),) 
          ),
    );
  }
}