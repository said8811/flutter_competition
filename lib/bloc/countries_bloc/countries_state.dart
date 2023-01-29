import 'package:flutter_competition/data/models/country_model.dart/countries_model.dart';

abstract class CountriesState {}

class CountriesStateLoadInProgress extends CountriesState {}

class CountriesStateLoadSuccess extends CountriesState {
  CountriesStateLoadSuccess(this.countries);

  final List<CountryModel> countries;
}

class CountriesStateLoadFailure extends CountriesState {}
