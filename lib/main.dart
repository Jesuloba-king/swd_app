import 'package:flutter/material.dart';

import 'auth/login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SWD',
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
          useMaterial3: true,
          fontFamily: "Aeonik"),
      debugShowCheckedModeBanner: false,
      home: const LoginScreen(),
    );
  }
}
