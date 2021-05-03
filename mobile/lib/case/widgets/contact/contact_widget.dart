import 'package:BeTheHero/case/widgets/contact_button/contact_button_widget.dart';
import 'package:BeTheHero/core/core.dart';
import 'package:flutter/material.dart';

class ContactWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 24),
      margin: EdgeInsets.all(0),
      decoration: BoxDecoration(
        color: AppColors.inputBg,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Salve o dia!",
                style:
                    AppTextStyles.primatyTitle(20, fontWeight: FontWeight.w500),
              ),
            ),
          ),
          SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Seja o herói desse caso.",
                style:
                    AppTextStyles.primatyTitle(20, fontWeight: FontWeight.w500),
              ),
            ),
          ),
          SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Entre em contato:",
                style: AppTextStyles.texts(15),
              ),
            ),
          ),
          SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: ContactButtonWidget(
                    text: "WhatsApp",
                    onPressed: () {},
                  ),
                ),
                SizedBox(
                  width: 17,
                ),
                Expanded(
                  child: ContactButtonWidget(
                    text: "E-mail",
                    onPressed: () {},
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 24),
        ],
      ),
    );
  }
}
