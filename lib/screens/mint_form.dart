// lib/screens/mint_form.dart
import 'package:flutter/material.dart';
import '../widgets/input.dart';
import '../widgets/button.dart';
import '../widgets/card.dart';

class MintForm extends StatefulWidget {
  final bool authenticated;
  final Function onMint;

  const MintForm({
    required this.authenticated,
    required this.onMint,
    Key? key,
  }) : super(key: key);

  @override
  _MintFormState createState() => _MintFormState();
}

class _MintFormState extends State<MintForm> {
  final _formKey = GlobalKey<FormState>();
  final _partnerAddressController = TextEditingController();
  final _partnerNameController = TextEditingController();
  final _secondPartnerNameController = TextEditingController();
  final _locationController = TextEditingController();
  final _officiantController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Mint Marriage Certificate')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              CustomInput(
                label: "Partner's Ethereum Address",
                placeholder: "0x...",
                controller: _partnerAddressController,
              ),
              const SizedBox(height: 16),
              CustomInput(
                label: "Your Name",
                placeholder: "Your Full Name",
                controller: _partnerNameController,
              ),
              const SizedBox(height: 16),
              CustomInput(
                label: "Partner's Name",
                placeholder: "Partner's Full Name",
                controller: _secondPartnerNameController,
              ),
              const SizedBox(height: 16),
              CustomInput(
                label: "Location",
                placeholder: "City, Country",
                controller: _locationController,
              ),
              const SizedBox(height: 16),
              CustomInput(
                label: "Officiant",
                placeholder: "Officiant Name",
                controller: _officiantController,
              ),
              const SizedBox(height: 24),
              CustomButton(
                text: 'Mint Certificate',
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    widget.onMint();
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}