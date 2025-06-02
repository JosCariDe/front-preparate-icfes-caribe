import 'package:caribe_app/presentation/screens/clase_screen.dart';
import 'package:caribe_app/presentation/screens/home_screen.dart';
import 'package:caribe_app/presentation/screens/splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: ClaseScreen(),
      debugShowCheckedModeBanner : false,
      title: 'Caribe App',
    );
  }
}
