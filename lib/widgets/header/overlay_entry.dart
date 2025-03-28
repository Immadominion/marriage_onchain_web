import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marriage_onchain_web/widgets/header/menu_item.dart';
import 'package:marriage_onchain_web/widgets/header/menu_link.dart';
import 'package:marriage_onchain_web/widgets/header/menu_section.dart';
import 'package:marriage_onchain_web/widgets/header/menu_theme_item.dart';
import 'package:marriage_onchain_web/widgets/header/network_info.dart';
import 'package:marriage_onchain_web/widgets/header/socials.dart';

OverlayEntry createOverlayEntry({
  required BuildContext context,
  required LayerLink layerLink,
}) {
  final RenderBox renderBox = context.findRenderObject() as RenderBox;
  final size = renderBox.size;

  return OverlayEntry(
    builder:
        (context) => Positioned(
          width: 320.w,
          child: CompositedTransformFollower(
            link: layerLink,
            showWhenUnlinked: false,
            offset: Offset(0, size.height - 10.h),
            child: Align(
              alignment: Alignment.topRight,
              child: Material(
                elevation: 8,
                borderRadius: BorderRadius.circular(12.r),
                color: const Color(0xFF1A1A1A), // Dark background from image
                child: Container(
                  padding: EdgeInsets.all(16.r),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.r),
                    border: Border.all(color: Colors.grey.shade800, width: 1),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      buildMenuSection([
                        buildMenuItem(
                          Icons.language,
                          "Language",
                          "English (EN)",
                        ),
                        buildMenuItem(
                          Icons.attach_money,
                          "Currency",
                          "ETH USD",
                        ),
                        buildMenuThemeItem(),
                      ]),
                      Divider(color: Colors.grey.shade800, height: 24.h),
                      buildMenuSection(
                        [
                          buildMenuLink("Support"),
                          buildMenuLink("Governance"),
                          buildMenuLink("Developers"),
                          buildMenuLink("Terms of Use"),
                          buildMenuLink("Old ENS App"),
                        ],
                        [
                          buildMenuLink("Feedback"),
                          buildMenuLink("Community"),
                          buildMenuLink("Bug Bounty"),
                          buildMenuLink("Privacy Policy"),
                          buildMenuLink("IPFS ENS App"),
                        ],
                      ),
                      Divider(color: Colors.grey.shade800, height: 24.h),
                      buildSocialLinks(),
                      Divider(color: Colors.grey.shade800, height: 24.h),
                      buildNetworkInfo(),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
  );
}
