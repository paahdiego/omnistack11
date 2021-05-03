import 'package:BeTheHero/case/widgets/appbar/app_bar_widget.dart';
import 'package:BeTheHero/case/widgets/case_details/case_details_widget.dart';
import 'package:BeTheHero/case/widgets/contact/contact_widget.dart';
import 'package:BeTheHero/core/core.dart';
import 'package:BeTheHero/shared/models/case_model.dart';
import 'package:flutter/material.dart';

class CasePage extends StatelessWidget {
  final DeviceScreenSize dss;
  final CaseModel caso;

  CasePage({Key? key, required this.dss, required this.caso}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(dss.paddingTop, context),
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
            CaseDetailsWidget(
              caso: caso,
            ),
            SizedBox(height: 16),
            ContactWidget(),
          ],
        ),
      ),
    );
  }
}
