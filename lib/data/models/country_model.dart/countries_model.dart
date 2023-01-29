import 'package:flutter_competition/data/models/country_model.dart/continent.dart';

class CountryModel {
  String code;
  String name;
  String phone;
  Continent continent;
  String capital;
  String currency;
  String emoji;

  CountryModel(
      {required this.code,
      required this.name,
      required this.phone,
      required this.continent,
      required this.capital,
      required this.currency,
      required this.emoji});

  factory CountryModel.fromJson(Map<String, dynamic> json) {
    return CountryModel(
      code: json['code'] ?? "",
      name: json['name'] ?? "",
      phone: json['phone'] ?? "",
      continent: Continent.fromJson(json['continent']),
      capital: json['capital'] ?? "",
      currency: json['currency'] ?? "",
      emoji: json['emoji'] ?? "",
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    data['name'] = name;
    data['phone'] = phone;
    data['continent'] = continent.toJson();
    data['capital'] = capital;
    data['currency'] = currency;
    data['emoji'] = emoji;
    return data;
  }
}
