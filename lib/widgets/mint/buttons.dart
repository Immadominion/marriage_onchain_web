import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget buildButton({
    required String text,
    required bool isPrimary,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: 16.h),
        decoration: BoxDecoration(
          color: isPrimary ? Colors.blue : Colors.transparent,
          borderRadius: BorderRadius.circular(40.r),
          border: Border.all(
            color: isPrimary ? Colors.blue : Colors.white.withOpacity(0.4),
            width: 1.5,
          ),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: Colors.white,
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
              fontFamily: 'Satoshi',
            ),
          ),
        ),
      ),
    );
  }
