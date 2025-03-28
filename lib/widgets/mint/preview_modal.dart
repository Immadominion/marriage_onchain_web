import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marriage_onchain_web/widgets/mint/buttons.dart';

class PreviewModal extends StatelessWidget {
  final VoidCallback onClose;
  final VoidCallback onMint;

  const PreviewModal({
    required this.onClose,
    required this.onMint,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClose, // Close modal when tapping outside
      child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Colors.black.withOpacity(0.7),
        child: Center(
          child: GestureDetector(
            onTap: () {}, // Prevent closing when tapping on content
            child: Container(
              width: 600.w,
              margin: EdgeInsets.symmetric(horizontal: 24.w),
              padding: EdgeInsets.all(30.w),
              decoration: BoxDecoration(
                color: const Color(0xFF101935),
                borderRadius: BorderRadius.circular(20.r),
                border: Border.all(
                  color: Colors.white.withOpacity(0.1),
                  width: 1,
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Certificate Preview",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24.sp,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Satoshi',
                    ),
                  ),

                  SizedBox(height: 30.h),

                  // Certificate Preview Image
                  Container(
                    width: double.infinity,
                    height: 400.h,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(12.r),
                      border: Border.all(
                        color: Colors.white.withOpacity(0.2),
                        width: 1,
                      ),
                      image: const DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(
                          'assets/images/certificate_template.png',
                        ),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        "Certificate Preview",
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.7),
                          fontSize: 18.sp,
                          fontFamily: 'Satoshi',
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: 24.h),

                  Text(
                    "Your NFT will look like this when minted on-chain",
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.8),
                      fontSize: 16.sp,
                      fontFamily: 'Satoshi',
                    ),
                    textAlign: TextAlign.center,
                  ),

                  SizedBox(height: 8.h),

                  Text(
                    "Minting fee: \$10 worth of ETH on Base",
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.6),
                      fontSize: 14.sp,
                      fontFamily: 'Satoshi',
                    ),
                    textAlign: TextAlign.center,
                  ),

                  SizedBox(height: 30.h),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        child: buildButton(
                          text: "Go Back",
                          isPrimary: false,
                          onTap: onClose,
                        ),
                      ),
                      SizedBox(width: 16.w),
                      Expanded(
                        child: buildButton(
                          text: "Mint Certificate",
                          isPrimary: true,
                          onTap: onMint,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
