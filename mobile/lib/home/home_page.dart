import 'package:BeTheHero/core/core.dart';
import 'package:BeTheHero/home/widgets/appbar/app_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider<DeviceScreenSize>.value(
            value: DeviceScreenSize(size: MediaQuery.of(context).size),
          ),
        ],
        child: Consumer<DeviceScreenSize>(builder: (context, dss, child) {
          return Scaffold(
            appBar: AppBarWidget(),
          );
        }));
  }
}
