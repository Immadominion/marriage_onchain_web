import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget buildMenuItem(IconData icon, String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Icon(icon, color: Colors.white, size: 20.sp),
            SizedBox(width: 12.w),
            Text(label, style: TextStyle(color: Colors.white, fontSize: 16.sp)),
          ],
        ),
        Row(
          children: [
            if (label == "Currency")
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                margin: EdgeInsets.only(right: 4.w),
                decoration: BoxDecoration(
                  color: const Color(0xFF4285F4),
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Text(
                  "ETH",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            Text(
              label == "Currency" ? "USD" : value,
              style: TextStyle(color: Colors.white, fontSize: 16.sp),
            ),
            if (label == "Language")
              Icon(Icons.chevron_right, color: Colors.white, size: 18.sp),
          ],
        ),
      ],
    );
  }
