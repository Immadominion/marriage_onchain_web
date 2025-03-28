import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marriage_onchain_web/providers/theme_switch.dart';
import 'package:marriage_onchain_web/screens/join_marriage.dart';
import 'package:marriage_onchain_web/screens/marriage_certificate_app.dart';
import 'package:marriage_onchain_web/screens/mint_form.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';

final GoRouter _router = GoRouter(
  debugLogDiagnostics: true,
  errorBuilder: (context, state) => const Placeholder(),
  routes: [
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const MarriageCertificateApp();
      },
    ),
    GoRoute(
      path: '/mint',
      builder: (BuildContext context, GoRouterState state) {
        return MintForm(authenticated: true, onMint: () {});
      },
    ),
    GoRoute(
      path: '/join',
      builder: (BuildContext context, GoRouterState state) {
        return JoinMarriage(authenticated: true, onJoin: () {});
      },
    ),
  ],
);

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => ThemeProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return ScreenUtilInit(
      designSize: const Size(1080, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp.router(
          routerConfig: _router,
          title: 'Marriage OnChain',
          themeMode: themeProvider.themeMode,
          debugShowCheckedModeBanner: false,
          theme: ThemeProvider.lightTheme,
          darkTheme: ThemeProvider.darkTheme,
        );
      },
    );
  }
}