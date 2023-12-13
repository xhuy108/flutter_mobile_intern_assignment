import 'package:flutter/material.dart';
import 'package:flutter_mobile_intern_assignment/config/app_color.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:flutter_mobile_intern_assignment/screens/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sneaker Store',
      theme: ThemeData(
        textTheme: GoogleFonts.rubikTextTheme(
          Theme.of(context).textTheme,
        ),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}
