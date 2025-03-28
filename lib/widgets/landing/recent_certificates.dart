import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marriage_onchain_web/constants/model_certificates.dart';
import 'package:marriage_onchain_web/widgets/landing/certificate_card.dart';

class RecentCertificates extends StatelessWidget {
  const RecentCertificates({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 60.h),
      height: MediaQuery.of(context).size.height * 1.1,
      color: theme.scaffoldBackgroundColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Recent Certificates',
                style: TextStyle(
                  fontFamily: 'Satoshi',
                  fontSize: 28.sp,
                  fontWeight: FontWeight.bold,
                  color: theme.colorScheme.onSurface,
                ),
              ),
              TextButton(
                onPressed: () {
                  // Navigate to all certificates page
                },
                child: Text(
                  'View All',
                  style: TextStyle(
                    fontFamily: 'Satoshi',
                    fontSize: 20.sp,
                    color: theme.colorScheme.primary,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 30.h),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: MediaQuery.of(context).size.width > 600 ? 3 : 2,
              crossAxisSpacing: 10.w,
              mainAxisSpacing: 10.h,
              childAspectRatio: 1.1,
            ),
            itemCount: certificates.length,
            itemBuilder: (context, index) {
              return CertificateCard(certificate: certificates[index]);
            },
          ),
        ],
      ),
    );
  }
}
