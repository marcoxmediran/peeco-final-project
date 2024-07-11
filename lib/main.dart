import 'package:flutter/material.dart';
import 'package:peeco_final_project/ui/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Renewable Energy IEC',
      theme: ThemeData.dark(
        useMaterial3: true,
      ),
      home: const Home(),
    );
  }
}
