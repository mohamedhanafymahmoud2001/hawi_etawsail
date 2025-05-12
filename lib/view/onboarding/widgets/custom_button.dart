import 'package:flutter/material.dart';

class OnboardingButton extends StatelessWidget {
  const OnboardingButton({
    super.key,
    required this.onPressed,
    required this.backgroundColor,
    required this.titleColor,
  });

  final Function() onPressed;
  final Color backgroundColor;
  final Color titleColor;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      color: backgroundColor,
      minWidth: 64,
      height: 64,
      shape: const StadiumBorder(),
      child: Text(
        "التالي",
        style: TextStyle(
          color: titleColor,
          fontSize: 16,
        ),
      ),
    );
  }
}
