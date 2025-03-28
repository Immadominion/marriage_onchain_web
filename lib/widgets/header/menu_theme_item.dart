import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget buildMenuThemeItem() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Icon(Icons.brightness_6, color: Colors.white, size: 20.sp),
            SizedBox(width: 12.w),
            Text(
              "Theme",
              style: TextStyle(color: Colors.white, fontSize: 16.sp),
            ),
          ],
        ),
        // Theme toggle matching the ENS design
        Container(
          height: 26.h,
          width: 60.w,
          decoration: BoxDecoration(
            color: Colors.grey.shade800,
            borderRadius: BorderRadius.circular(20.r),
          ),
          child: Row(
            children: [
              Container(
                width: 30.w,
                height: 26.h,
                decoration: BoxDecoration(
                  color: const Color(0xFF4285F4),
                  borderRadius: BorderRadius.circular(20.r),
                ),
                child: Center(
                  child: Icon(
                    Icons.nightlight_round,
                    color: Colors.white,
                    size: 16.sp,
                  ),
                ),
              ),
              Container(
                width: 30.w,
                height: 26.h,
                child: Center(
                  child: Icon(Icons.wb_sunny, color: Colors.white, size: 16.sp),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
