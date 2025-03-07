// lib/screens/join_marriage.dart
import 'package:flutter/material.dart';
import 'package:marriage_onchain_web/utils/styles_util.dart';
import '../widgets/button.dart';
import '../widgets/card.dart';

class JoinMarriage extends StatelessWidget {
  final bool authenticated;
  final VoidCallback onJoin;

  const JoinMarriage({
    required this.authenticated,
    required this.onJoin,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Join Marriage Certificate')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            CustomCard(
              child: Column(
                children: [
                  Text(
                    "You've been invited to join a marriage certificate",
                    style: StylesUtil.textStyle(fontSize: 18),
                  ),
                  const SizedBox(height: 16),
                  CustomButton(
                    text: 'Join Marriage Certificate',
                    onPressed: authenticated ? onJoin : () {},
                  ),
                  if (!authenticated)
                    Text(
                      'Please connect your wallet to join.',
                      style: StylesUtil.textStyle(fontSize: 14),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}