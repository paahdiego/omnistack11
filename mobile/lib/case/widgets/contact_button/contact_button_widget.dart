import 'package:BeTheHero/core/core.dart';
import 'package:flutter/material.dart';

class ContactButtonWidget extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const ContactButtonWidget(
      {Key? key, required this.text, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(AppColors.redHero),
      ),
      onPressed: onPressed,
      child: Text(
        text,
        style: AppTextStyles.whiteText(15, fontWeight: FontWeight.w500),
      ),
    );
  }
}
