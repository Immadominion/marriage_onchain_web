import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marriage_onchain_web/widgets/landing/particles_background.dart';
import 'package:marriage_onchain_web/widgets/mint/buttons.dart';
import 'package:marriage_onchain_web/widgets/mint/ens_verified.dart';
import 'package:marriage_onchain_web/widgets/mint/input_field.dart';
import 'package:marriage_onchain_web/widgets/mint/preview_modal.dart';


class MintForm extends StatefulWidget {
  final bool authenticated;
  final Function onMint;

  const MintForm({
    required this.authenticated,
    required this.onMint,
    super.key,
  });

  @override
  _MintFormState createState() => _MintFormState();
}

class _MintFormState extends State<MintForm>
    with SingleTickerProviderStateMixin {
  final _formKey = GlobalKey<FormState>();
  final _userAddressController = TextEditingController();
  final _partnerAddressController = TextEditingController();
  final _userNameController = TextEditingController();
  final _partnerNameController = TextEditingController();
  final _locationController = TextEditingController();
  final _officiantController = TextEditingController();

  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;

  bool _showAdvancedOptions = false;
  bool showPreview = false;

  String? _userEns;
  String? _partnerEns;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0.0, 0.6, curve: Curves.easeOut),
      ),
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.2),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0.0, 0.6, curve: Curves.easeOut),
      ),
    );

    _animationController.forward();

    // Add listeners to wallet address fields to simulate ENS lookup
    _userAddressController.addListener(_checkUserEns);
    _partnerAddressController.addListener(_checkPartnerEns);
  }

  void _checkUserEns() async {
    // final ensName = await EnsResolver.resolveAddressToEns(
    //   _userAddressController.text,
    // );
    // setState(() {
    //   _userEns = ensName ?? "Not Found";
    // });
  }

  void _checkPartnerEns() async {
    // final ensName = await EnsResolver.resolveAddressToEns(
    //   _partnerAddressController.text,
    // );
    // setState(() {
    //   _partnerEns = ensName ?? "Not Found";
    // });
  }

  @override
  void dispose() {
    _userAddressController.dispose();
    _partnerAddressController.dispose();
    _userNameController.dispose();
    _partnerNameController.dispose();
    _locationController.dispose();
    _officiantController.dispose();
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          // Background gradient
          Container(
            height: MediaQuery.of(context).size.height,
            width: double.infinity,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color(0xFF111111), Color(0xFF101935)],
              ),
            ),
            child: const ParticlesBackground(),
          ),

          // Main content
          SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: FadeTransition(
                  opacity: _fadeAnimation,
                  child: SlideTransition(
                    position: _slideAnimation,
                    child: Center(
                      child: ConstrainedBox(
                        constraints: BoxConstraints(maxWidth: 800.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(height: 40.h),

                            // Heading
                            Text(
                              'Mint Your Marriage Certificate',
                              style: TextStyle(
                                fontFamily: 'Satoshi',
                                fontSize: 40.sp,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                              textAlign: TextAlign.center,
                            ),

                            SizedBox(height: 16.h),

                            // Subheading
                            SizedBox(
                              width: 600.w,
                              child: Text(
                                'Immortalize your commitment with an NFT marriage certificate on Base.',
                                style: TextStyle(
                                  fontFamily: 'Satoshi',
                                  fontSize: 18.sp,
                                  color: Colors.white.withOpacity(0.8),
                                  height: 1.5,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),

                            SizedBox(height: 40.h),

                            // Form Card
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.black.withOpacity(0.6),
                                borderRadius: BorderRadius.circular(20.r),
                                border: Border.all(
                                  color: Colors.white.withOpacity(0.1),
                                  width: 1,
                                ),
                              ),
                              padding: EdgeInsets.all(30.w),
                              child: Form(
                                key: _formKey,
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    // Essential Fields
                                    buildInputField(
                                      label: "Your Ethereum Address",
                                      placeholder: "0x...",
                                      controller: _userAddressController,
                                    ),

                                    if (_userEns != null)
                                      buildEnsVerification(_userEns!),

                                    SizedBox(height: 24.h),

                                    buildInputField(
                                      label: "Partner's Ethereum Address",
                                      placeholder: "0x...",
                                      controller: _partnerAddressController,
                                    ),

                                    if (_partnerEns != null)
                                      buildEnsVerification(_partnerEns!),

                                    SizedBox(height: 24.h),

                                    // Advanced Options Toggle
                                    Center(
                                      child: TextButton(
                                        onPressed: () {
                                          setState(() {
                                            _showAdvancedOptions =
                                                !_showAdvancedOptions;
                                          });
                                        },
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Text(
                                              _showAdvancedOptions
                                                  ? "Hide Additional Details"
                                                  : "Add Additional Details",
                                              style: TextStyle(
                                                color: Colors.blue,
                                                fontSize: 16.sp,
                                                fontFamily: 'Satoshi',
                                              ),
                                            ),
                                            SizedBox(width: 8.w),
                                            Icon(
                                              _showAdvancedOptions
                                                  ? Icons.keyboard_arrow_up
                                                  : Icons.keyboard_arrow_down,
                                              color: Colors.blue,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),

                                    // Advanced Options Fields
                                    if (_showAdvancedOptions) ...[
                                      // Essential name fields
                                      buildInputField(
                                        label: "Your Display Name (optional)",
                                        placeholder:
                                            "Leave blank to use ENS name",
                                        controller: _userNameController,
                                      ),

                                      SizedBox(height: 24.h),

                                      buildInputField(
                                        label:
                                            "Partner's Display Name (optional)",
                                        placeholder:
                                            "Leave blank to use ENS name",
                                        controller: _partnerNameController,
                                      ),
                                      SizedBox(height: 24.h),
                                    ],

                                    SizedBox(height: 40.h),

                                    // Mint Certificate Button
                                    buildButton(
                                      text: "Mint Certificate",
                                      isPrimary: true,
                                      // onTap: () {
                                      //   if (_formKey.currentState!.validate()) {
                                      //     widget.onMint();
                                      //   }
                                      // },
                                      onTap: () {
                                        if (_formKey.currentState!.validate()) {
                                          setState(() {
                                            showPreview = true;
                                          });
                                        }
                                      },
                                    ),

                                    SizedBox(height: 16.h),

                                    // Minting Fee Information
                                    Center(
                                      child: Text(
                                        "Minting fee: \$10 worth of ETH on Base",
                                        style: TextStyle(
                                          color: Colors.white.withOpacity(0.6),
                                          fontSize: 14.sp,
                                          fontFamily: 'Satoshi',
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),

                            SizedBox(height: 60.h),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),

          // Preview Modal
          if (showPreview)
            PreviewModal(
              onClose: () {
                setState(() {
                  showPreview = false;
                });
              },
              onMint: () {
                setState(() {
                  showPreview = false;
                });
                widget.onMint();
              },
            ),
        ],
      ),
    );
  }
}
