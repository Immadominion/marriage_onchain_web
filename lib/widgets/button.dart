import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final bool isLoading;
  final bool isSmall;

  const CustomButton({
    required this.text,
    required this.onPressed,
    this.isLoading = false,
    this.isSmall = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: isLoading ? null : onPressed,
        borderRadius: BorderRadius.circular(30.r),
        child: Ink(
          decoration: BoxDecoration(
            color: const Color(0xFF4285F4),
            borderRadius: BorderRadius.circular(50.r),
          ),
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: isSmall ? 20.w : 65.w,
              vertical: isSmall ? 10.h : 13.h,
            ),
            child:
                isLoading
                    ? SizedBox(
                      height: 20.h,
                      width: 20.w,
                      child: const CircularProgressIndicator(
                        color: Colors.white,
                        strokeWidth: 2,
                      ),
                    )
                    : Text(
                      text,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: isSmall ? 14.sp : 22.sp,
                      ),
                    ),
          ),
        ),
      ),
    );
  }
}
