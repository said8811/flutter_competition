import 'package:flutter_competition/data/models/my_response.dart';
import 'package:flutter_competition/service/country_api_service/countries_api_service.dart';

class CountriesRepository {
  CountriesRepository({required this.apiService});

  final CountriesApiSerice apiService;

  Future<MyResponse> getCountries() => apiService.getCountriesList();

  // Future<UserModel> insertUserToDb(UserModel userModel) =>
  //     LocalDatabase.insertUser(userModel: userModel);

//  Future<List<UserModel>> getAllCachedUsers() => LocalDatabase.getCachedUsers();

//   Future<int> deleteCachedUsers() => LocalDatabase.deleteAll();
}
