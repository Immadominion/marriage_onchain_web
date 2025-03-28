import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget buildEnsVerification(String ensName) {
    return Padding(
      padding: EdgeInsets.only(top: 8.h, left: 4.w),
      child: Row(
        children: [
          Icon(Icons.check_circle_outline, color: Colors.green, size: 16.sp),
          SizedBox(width: 8.w),
          Text(
            "ENS verified: $ensName",
            style: TextStyle(
              color: Colors.green,
              fontSize: 14.sp,
              fontFamily: 'Satoshi',
            ),
          ),
        ],
      ),
    );
  }
