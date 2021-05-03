import 'package:flutter/material.dart';

class DeviceScreenSize extends ChangeNotifier {
  double _displayWidth = 0;
  double _displayHeight = 0;
  double _paddingTop = 0;

  MediaQueryData mediaQuery;

  DeviceScreenSize({
    required this.mediaQuery,
  }) {
    this._displayWidth = this.mediaQuery.size.width;
    this._displayHeight = this.mediaQuery.size.height;
    this._paddingTop = this.mediaQuery.padding.top;
    if (this._displayWidth >= 768) {
      //iPad Pro 9.7 pol
    } else if (this._displayWidth >= 375) {
      //iPhone 11 Pro - x pol 375
      //iPhone 12 - 6.1 pol 390
    } else {
      //iPhone SE 1st Gen.
    }
  }

  double get paddingTop => this._paddingTop;
  double get displayWidth => this._displayWidth;
  double get displayHeight => this._displayHeight;
}
