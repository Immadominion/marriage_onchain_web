 import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget buildMenuSection(List<Widget> items, [List<Widget>? rightItems]) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for (int i = 0; i < items.length; i++)
          Padding(
            padding: EdgeInsets.only(bottom: 16.h),
            child:
                rightItems != null
                    ? Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        items[i],
                        if (i < rightItems.length) rightItems[i],
                      ],
                    )
                    : items[i],
          ),
      ],
    );
  }
