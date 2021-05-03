import 'package:BeTheHero/core/core.dart';
import 'package:BeTheHero/home/widgets/appbar/app_bar_widget.dart';
import 'package:BeTheHero/home/widgets/case/case_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<DeviceScreenSize>.value(
          value: DeviceScreenSize(mediaQuery: MediaQuery.of(context)),
        ),
      ],
      child: Consumer<DeviceScreenSize>(
        builder: (context, dss, child) {
          return Scaffold(
            appBar: AppBarWidget(dss.paddingTop),
            body: Container(
              decoration: BoxDecoration(color: AppColors.backgroundColor),
              padding: const EdgeInsets.symmetric(
                horizontal: 24,
                vertical: 52,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Bem-vindo!",
                    textAlign: TextAlign.start,
                    style: AppTextStyles.primatyTitle(
                      30,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    "Escolha um dos casos abaixo e salve o dia.",
                    textAlign: TextAlign.start,
                    style: AppTextStyles.texts(
                      20,
                    ),
                  ),
                  SizedBox(height: 32),
                  Expanded(
                    child: ListView.separated(
                      itemBuilder: (context, index) {
                        return CaseWidget();
                      },
                      separatorBuilder: (builder, _) {
                        return SizedBox(height: 16);
                      },
                      itemCount: 4,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
