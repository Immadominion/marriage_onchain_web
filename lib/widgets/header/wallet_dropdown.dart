import 'package:flutter/material.dart';

class WalletDropdown extends StatefulWidget {
  final String? address;
  final VoidCallback onLogout;

  const WalletDropdown({this.address, required this.onLogout, super.key});

  @override
  _WalletDropdownState createState() => _WalletDropdownState();
}

class _WalletDropdownState extends State<WalletDropdown> {
  bool isOpen = false;

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<int>(
      onSelected: (value) {
        if (value == 1) widget.onLogout();
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: [
            Container(
              width: 24,
              height: 24,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: const LinearGradient(
                  colors: [Colors.tealAccent, Colors.teal],
                ),
              ),
            ),
            const SizedBox(width: 8),
            Text(
              widget.address != null
                  ? "${widget.address!.substring(0, 6)}...${widget.address!.substring(widget.address!.length - 4)}"
                  : 'Unknown',
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
            ),
            const Icon(Icons.arrow_drop_down, size: 20),
          ],
        ),
      ),
      itemBuilder:
          (context) => [
            PopupMenuItem(
              value: 1,
              child: Row(
                children: const [
                  Icon(Icons.logout, color: Colors.red),
                  SizedBox(width: 8),
                  Text('Disconnect', style: TextStyle(color: Colors.red)),
                ],
              ),
            ),
          ],
    );
  }
}
