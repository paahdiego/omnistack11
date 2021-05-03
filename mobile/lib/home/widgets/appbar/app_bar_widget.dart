import 'package:BeTheHero/core/core.dart';
import 'package:flutter/material.dart';

class AppBarWidget extends PreferredSize {
  AppBarWidget(double paddingTop)
      : super(
          preferredSize: Size.fromHeight(100),
          child: Container(
            width: double.maxFinite,
            padding: EdgeInsets.fromLTRB(24, paddingTop, 24, 0),
            decoration: BoxDecoration(
              color: AppColors.backgroundColor,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(AppImages.alt_logo, height: 40),
                Text.rich(
                  TextSpan(
                    text: "Total de ",
                    style: AppTextStyles.texts(15),
                    children: [
                      TextSpan(
                        text: "43 casos",
                        style: AppTextStyles.texts(
                          15,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
}
