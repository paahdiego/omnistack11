import 'package:BeTheHero/core/core.dart';
import 'package:flutter/material.dart';

class AppBarWidget extends PreferredSize {
  AppBarWidget(double paddingTop, context)
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
                IconButton(
                  icon: Icon(
                    Icons.arrow_back,
                    color: AppColors.redHero,
                    size: 24,
                  ),
                  onPressed: () {
                    if (Navigator.canPop(context)) {
                      Navigator.pop(context);
                    }
                  },
                ),
              ],
            ),
          ),
        );
}
