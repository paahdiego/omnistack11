import 'dart:convert';

import 'package:BeTheHero/shared/config/connection.dart';
import 'package:BeTheHero/shared/models/case_model.dart';
import "package:http/http.dart" as http;

class CaseService {
  static Future<List<CaseModel>> getCases(String page) async {
    Map<String, dynamic> query = {
      "page": page,
    };

    var uri = getUriWithQuery("case", query);

    try {
      final response = await http.get(
        uri,
      );
      print(uri);
      print("status get Cases -> ${response.statusCode.toString()}");
      switch (response.statusCode) {
        case 200:
          final res = json.decode(response.body) as List;
          final List<CaseModel> cases =
              res.map((e) => CaseModel.fromMap(e)).toList();
          return cases;
        case 403:
          throw ("Email e/ou senha inválidos");
        case 500:
          throw ("Erro no servidor. Tente novamente mais tarde");
        default:
          throw ("Aconteceu um erro inesperado, tente novamente mais tarde");
      }
    } catch (e) {
      throw e;
    }
  }
}
