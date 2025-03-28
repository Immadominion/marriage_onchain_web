import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marriage_onchain_web/widgets/header/social_icons.dart';

Widget buildSocialLinks() {
    // Use specific icons to match the ENS app
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          buildSocialIcon(Icons.short_text), // X/Twitter
          buildSocialIcon(Icons.code), // GitHub
          buildSocialIcon(Icons.chat_bubble_outline), // Discord
          buildSocialIcon(Icons.question_answer_outlined), // Farcaster
          buildSocialIcon(Icons.message_outlined), // Element
          buildSocialIcon(Icons.play_arrow_outlined), // YouTube
        ],
      ),
    );
  }
