// lib/widgets/mint_success_alert.dart
import 'package:flutter/material.dart';

class MintSuccessAlert extends StatelessWidget {
  final int tokenId;
  final String partnerAddress;
  final VoidCallback onClose;

  const MintSuccessAlert({
    required this.tokenId,
    required this.partnerAddress,
    required this.onClose,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('🎉 Mint Successful!'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('Token ID: $tokenId'),
          Text('Partner Address: $partnerAddress'),
        ],
      ),
      actions: [
        TextButton(
          onPressed: onClose,
          child: const Text('Close'),
        ),
      ],
    );
  }
}