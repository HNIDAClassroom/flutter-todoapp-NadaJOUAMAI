import 'package:flutter/material.dart';
import 'package:login_app/widgets/login.dart';

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData(
        appBarTheme: const AppBarTheme(elevation: 0),
        useMaterial3: true,colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blueGrey).copyWith(background: Colors.red.shade50),
        scaffoldBackgroundColor: Color.fromARGB(255, 143, 143, 193),
        ),
      home: const Login(),
        ),
  );
} 
