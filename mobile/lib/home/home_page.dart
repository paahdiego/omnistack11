import 'package:BeTheHero/case/case_page.dart';
import 'package:BeTheHero/core/core.dart';
import 'package:BeTheHero/home/controllers/home_page_controller.dart';
import 'package:BeTheHero/home/widgets/appbar/app_bar_widget.dart';
import 'package:BeTheHero/home/widgets/case/case_widget.dart';
import 'package:BeTheHero/shared/models/case_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = HomeController();
  @override
  void initState() {
    super.initState();
    controller.getCases();
    controller.stateNotifier.addListener(() {
      setState(() {});
    });
  }

  void navigateToCasePage(context, dss, CaseModel caso) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CasePage(
          dss: dss,
          caso: caso,
        ),
      ),
    );
  }

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
          if (controller.state == HomeState.success) {
            return Scaffold(
              appBar: AppBarWidget(
                  dss.paddingTop, controller.cases!.length.toString()),
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
                          return CaseWidget(
                            caso: controller.cases![index],
                            onPressed: () => navigateToCasePage(
                                context, dss, controller.cases![index]),
                          );
                        },
                        separatorBuilder: (builder, _) {
                          return SizedBox(height: 16);
                        },
                        itemCount: controller.cases!.length,
                      ),
                    ),
                  ],
                ),
              ),
            );
          } else {
            return Scaffold(
              body: Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(AppColors.redHero),
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
