import 'package:flutter/material.dart';
import 'ui/login/login_screen.dart';  // <-- Import your new screen

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LivingAI App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.orange),
        useMaterial3: true,
      ),

      // Load your LoginScreen as the homepage
      home: const LoginScreen(),
    );
  }
}
