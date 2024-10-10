import 'package:flutter/material.dart';

import 'auth/login_screen.dart';
import 'package:provider/provider.dart';

import 'auth/signup/user_model.dart';
import 'splash/splash_screen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserModel()), // Provide UserModel
      ],
      child: const MyApp(),
    ),
  );
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
      home: const SplashScreenPage(),
    );
  }
}
