import 'package:BeTheHero/shared/models/case_model.dart';
import 'package:BeTheHero/shared/services/case_service.dart';
import 'package:flutter/foundation.dart';

enum HomeState {
  success,
  loading,
  error,
  empty,
}

class HomeController {
  final stateNotifier = ValueNotifier<HomeState>(HomeState.empty);

  set state(HomeState state) => stateNotifier.value = state;
  HomeState get state => stateNotifier.value;

  List<CaseModel>? cases;

  Future<void> getCases() async {
    state = HomeState.loading;

    await Future.delayed(Duration(seconds: 1));

    try {
      cases = await CaseService.getCases("1");
      print(cases!.length);
    } catch (e) {}

    state = HomeState.success;
  }
}
