import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightBlue),
        textTheme: GoogleFonts.ralewayTextTheme(),
        useMaterial3: true,
      ),
      home: const Home(),
    );
  }
}
