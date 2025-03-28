import 'package:flutter/material.dart';
import 'package:marriage_onchain_web/widgets/landing/footer.dart';
import 'package:marriage_onchain_web/widgets/landing/hero_section.dart';
import 'package:marriage_onchain_web/widgets/landing/recent_certificates.dart';
import 'package:marriage_onchain_web/widgets/navbar.dart';

class MarriageCertificateApp extends StatelessWidget {
  const MarriageCertificateApp({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const CustomNavbar(),
            const HeroSection(),
            RecentCertificates(),
            const Footer(),
          ],
        ),
      ),
    );
  }
}
