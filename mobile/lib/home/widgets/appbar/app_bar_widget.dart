import 'package:BeTheHero/core/core.dart';
import 'package:flutter/material.dart';

class AppBarWidget extends PreferredSize {
  AppBarWidget()
      : super(
          preferredSize: Size.fromHeight(100),
          child: SafeArea(
            top: true,
            child: Container(
              width: double.maxFinite,
              padding: EdgeInsets.symmetric(horizontal: 24),
              decoration: BoxDecoration(),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(AppImages.alt_logo),
                  Text.rich(
                    TextSpan(
                      text: "Total de ",
                      children: [
                        TextSpan(text: "43 casos"),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
}
