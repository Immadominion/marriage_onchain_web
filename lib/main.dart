// lib/main.dart
import 'package:flutter/material.dart';
import 'screens/marriage_certificate_app.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Marriage.eth',
      debugShowCheckedModeBanner: true,
      theme: ThemeData(primarySwatch: Colors.purple),
      home: const MarriageCertificateApp(),
    );
  }
}
