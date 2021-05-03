import 'package:BeTheHero/core/core.dart';
import 'package:BeTheHero/home/widgets/details_button/details_button_widget.dart';
import 'package:BeTheHero/shared/models/case_model.dart';
import 'package:flutter/material.dart';

class CaseWidget extends StatelessWidget {
  final VoidCallback onPressed;
  final CaseModel caso;

  const CaseWidget({Key? key, required this.onPressed, required this.caso})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 25),
      margin: EdgeInsets.all(0),
      decoration: BoxDecoration(
        color: AppColors.inputBg,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 2,
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "CASO",
                          style: AppTextStyles.secondaryTitle(
                            14,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          caso.title,
                          style: AppTextStyles.texts(
                            15,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "ONG: ",
                          style: AppTextStyles.secondaryTitle(
                            14,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          caso.name,
                          style: AppTextStyles.texts(
                            15,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 24),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "VALOR: ",
                style: AppTextStyles.secondaryTitle(
                  14,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "R\$ ${caso.value} reais",
                style: AppTextStyles.texts(
                  15,
                ),
              ),
            ),
          ),
          SizedBox(height: 32),
          Container(
            height: 1,
            color: AppColors.inputLine,
          ),
          DetailsButton(onPressed: onPressed),
        ],
      ),
    );
  }
}
