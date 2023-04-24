import 'package:banana_challenge_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:resize/resize.dart';

class BananaButton extends StatelessWidget {
  const BananaButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.width,
  });

  final VoidCallback onPressed;
  final String text;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width != null ? 330.sp : width?.sp,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(
            BananaConstants.bananaMainColor,
          ),
        ),
        child: Text(
          text,
          style: TextStyle(
            fontSize: 15.sp,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}
