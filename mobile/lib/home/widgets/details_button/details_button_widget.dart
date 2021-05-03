import 'package:BeTheHero/core/core.dart';
import 'package:flutter/material.dart';

class DetailsButton extends StatefulWidget {
  final VoidCallback onPressed;

  const DetailsButton({Key? key, required this.onPressed}) : super(key: key);
  @override
  _DetailsButtonState createState() => _DetailsButtonState();
}

class _DetailsButtonState extends State<DetailsButton> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: widget.onPressed,
      style: ButtonStyle(
        elevation: MaterialStateProperty.all(0),
        overlayColor: MaterialStateProperty.all(Colors.red[200]),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(8),
              bottomRight: Radius.circular(8),
            ),
          ),
        ),
        padding: MaterialStateProperty.all(
          EdgeInsets.symmetric(vertical: 15),
        ),
      ),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 24, vertical: 0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Ver mais detalhes",
              style: AppTextStyles.redHero(
                15,
                fontWeight: FontWeight.w600,
              ),
            ),
            Icon(
              Icons.arrow_forward_rounded,
              size: 18,
              color: AppColors.redHero,
            ),
          ],
        ),
      ),
    );
  }
}
