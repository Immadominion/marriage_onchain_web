// lib/screens/marriage_certificate_app.dart
import 'package:flutter/material.dart';
import 'package:marriage_onchain_web/widgets/navbar.dart';


class MarriageCertificateApp extends StatelessWidget {
  const MarriageCertificateApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomNavbar(
        authenticated: false,
        onLogin: () {},
        onLogout: () {},
      ),
      body: const Center(
        child: Text('Marriage Certificate App'),
      ),
    );
  }
}