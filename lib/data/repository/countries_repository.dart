import 'package:flutter_competition/data/local_database/local_database.dart';
import 'package:flutter_competition/data/models/country_model.dart/country_model.dart';
import 'package:flutter_competition/data/models/my_response.dart';
import 'package:flutter_competition/service/country_api_service/countries_api_service.dart';

class CountriesRepository {
  CountriesRepository({required this.apiService});

  final CountriesApiSerice apiService;

  Future<MyResponse> getCountries() => apiService.getCountriesList();

  Future<CountryModel> insertCountryToDb(CountryModel countryModel) =>
      LocalDatabase.insertCountry(countryModel: countryModel);

  Future<List<CountryModel>> getAllCachedCountries() =>
      LocalDatabase.getCachedCountries();

  Future<int> deleteCachedCountries() => LocalDatabase.deleteAll();
}
