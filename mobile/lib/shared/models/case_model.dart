import 'dart:convert';

class CaseModel {
  final int id;
  final String title;
  final String description;
  final int value;
  final String ong_id;
  final String name;
  final String whatsapp;
  final String city;
  final String uf;
  CaseModel({
    required this.id,
    required this.title,
    required this.description,
    required this.value,
    required this.ong_id,
    required this.name,
    required this.whatsapp,
    required this.city,
    required this.uf,
  });

  factory CaseModel.fromMap(Map<String, dynamic> map) {
    return CaseModel(
      id: map['id'],
      title: map['title'],
      description: map['description'],
      value: map['value'],
      ong_id: map['ong_id'],
      name: map['name'],
      whatsapp: map['whatsapp'],
      city: map['city'],
      uf: map['uf'],
    );
  }

  factory CaseModel.fromJson(String source) =>
      CaseModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'CaseModel(id: $id, title: $title, description: $description, value: $value, ong_id: $ong_id, name: $name, whatsapp: $whatsapp, city: $city, uf: $uf)';
  }
}
