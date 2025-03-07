// lib/widgets/navbar.dart
import 'package:flutter/material.dart';
import 'package:marriage_onchain_web/widgets/button.dart';

class CustomNavbar extends StatelessWidget implements PreferredSizeWidget {
  final bool authenticated;
  final VoidCallback onLogin;
  final VoidCallback onLogout;

  const CustomNavbar({
    required this.authenticated,
    required this.onLogin,
    required this.onLogout,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text('Marriage.eth'),
      actions: [
        if (authenticated)
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: onLogout,
          )
        else
          CustomButton(
            text: 'Connect Wallet',
            onPressed: onLogin,
          ),
      ],
    );
  }
  
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}