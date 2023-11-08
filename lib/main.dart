import 'package:flutter/material.dart';
import 'package:green_grocer/src/pages/auth/sing_in_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Green Grocer',
      theme: ThemeData(
        primarySwatch: Colors.green,
        scaffoldBackgroundColor:
            const Color.fromARGB(255, 241, 241, 241).withAlpha(180),
      ),
      debugShowCheckedModeBanner: false,
      home: const SignInScreen(),
    );
  }
}
