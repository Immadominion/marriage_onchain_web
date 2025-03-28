import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 40.h),
      color: theme.brightness == Brightness.dark 
          ? const Color(0xFF121212) 
          : const Color(0xFF1A1A1A),
      child: Column(
        children: [
          SizedBox(height: 20.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '© 2025 Marriage.onchain',
                style: TextStyle(
                  fontFamily: 'Satoshi',
                  fontSize: 14.sp,
                  color: Colors.grey,
                ),
              ),
              Row(
                children: [
                  _buildSocialIcon(Icons.language),
                  SizedBox(width: 20.w),
                  _buildSocialIcon(Icons.discord),
                  SizedBox(width: 20.w),
                  _buildSocialIcon(Icons.telegram),
                ],
              ),
            ],
          ),
          SizedBox(height: 20.h),
          Text(
            'Built on Base with 💙',
            style: TextStyle(
              fontFamily: 'Satoshi',
              fontSize: 14.sp,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSocialIcon(IconData icon) {
    return Icon(icon, color: Colors.white, size: 24.sp);
  }
}