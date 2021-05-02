import 'dart:convert';

import 'package:flutter/material.dart';

class DeviceScreenSize extends ChangeNotifier {
  double displayWidth;
  double displayHeight;
  Size size;

  DeviceScreenSize({
    this.displayWidth = 0,
    this.displayHeight = 0,
    required this.size,
  }) {
    this.displayWidth = this.size.width;
    this.displayHeight = this.size.height;
    if (this.displayWidth >= 768) {
      //iPad Pro 9.7 pol

    } else if (this.displayWidth >= 375) {
      //iPhone 11 Pro - x pol 375
      //iPhone 12 - 6.1 pol 390

    } else {
      //iPhone SE 1st Gen.
    }
  }

  @override
  String toString() =>
      'DeviceScreenSize(size: $size, displayWidth: $displayWidth, displayHeight: $displayHeight)';
}
