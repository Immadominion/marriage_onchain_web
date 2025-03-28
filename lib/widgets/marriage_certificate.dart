// lib/widgets/marriage_certificate.dart
import 'package:flutter/material.dart';
import 'package:marriage_onchain_web/utils/styles_util.dart';
import 'package:marriage_onchain_web/widgets/card.dart';

class MarriageCertificate extends StatelessWidget {
  final String partner1;
  final String partner2;
  final DateTime date;
  final String location;
  final String maidOfHonor;
  final String bestMan;
  final String officiant;

  const MarriageCertificate({
    required this.partner1,
    required this.partner2,
    required this.date,
    required this.location,
    required this.maidOfHonor,
    required this.bestMan,
    required this.officiant,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final formattedDate =
        "${date.day} OF ${_getMonthName(date.month)}, ${date.year}";
    final formattedLocation = location.toUpperCase();

    return CustomCard(
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          Text(
            'CERTIFICATE',
            style: StylesUtil.textStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'OF MARRIAGE',
            style: StylesUtil.textStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 24),
          Text(
            'ON THIS DAY, $formattedDate, IN $formattedLocation',
            style: StylesUtil.textStyle(fontSize: 18),
          ),
          const SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(partner1, style: StylesUtil.textStyle(fontSize: 24)),
              const SizedBox(width: 8),
              Text('&', style: StylesUtil.textStyle(fontSize: 24)),
              const SizedBox(width: 8),
              Text(partner2, style: StylesUtil.textStyle(fontSize: 24)),
            ],
          ),
          const SizedBox(height: 24),
          Text(
            'WERE UNITED IN MARRIAGE',
            style: StylesUtil.textStyle(fontSize: 20),
          ),
          const SizedBox(height: 24),
          Text(
            'IN CONFIRMATION AND CELEBRATION OF THIS COMMITMENT THEY SET THEIR HANDS BELOW',
            style: StylesUtil.textStyle(fontSize: 16),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24),
          // Signature Lines
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  Text('BRIDE', style: StylesUtil.textStyle(fontSize: 14)),
                  const SizedBox(height: 8),
                  Text(maidOfHonor, style: StylesUtil.textStyle(fontSize: 14)),
                ],
              ),
              Column(
                children: [
                  Text('GROOM', style: StylesUtil.textStyle(fontSize: 14)),
                  const SizedBox(height: 8),
                  Text(bestMan, style: StylesUtil.textStyle(fontSize: 14)),
                ],
              ),
            ],
          ),
          const SizedBox(height: 24),
          Text(
            'OFFICIANT: $officiant',
            style: StylesUtil.textStyle(fontSize: 14),
          ),
        ],
      ),
    );
  }

  String _getMonthName(int month) {
    switch (month) {
      case 1:
        return 'JANUARY';
      case 2:
        return 'FEBRUARY';
      case 3:
        return 'MARCH';
      case 4:
        return 'APRIL';
      case 5:
        return 'MAY';
      case 6:
        return 'JUNE';
      case 7:
        return 'JULY';
      case 8:
        return 'AUGUST';
      case 9:
        return 'SEPTEMBER';
      case 10:
        return 'OCTOBER';
      case 11:
        return 'NOVEMBER';
      case 12:
        return 'DECEMBER';
      default:
        return '';
    }
  }
}
