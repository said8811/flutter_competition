import 'package:flutter/material.dart';
import 'package:flutter_competition/data/models/country_model.dart/country_model.dart';

class CountryInfoPage extends StatelessWidget {
  CountryModel country;
  CountryInfoPage({super.key, required this.country});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(country.name),

      ),
      body: Column(
        children: [
          Text(country.name),
          Text(country.capital),
          Text(country.code),
          Text(country.currency),
          Text(country.emoji),
          Text(country.name),
          Text(country.phone),
        ],
      ),
    );
  }
}
