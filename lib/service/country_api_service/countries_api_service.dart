import 'package:dio/dio.dart';
import 'package:flutter_competition/data/models/country_model.dart/country_model.dart';
import 'package:flutter_competition/data/models/my_response.dart';
import 'package:flutter_competition/service/country_api_service/api_client.dart';

class CountriesApiSerice extends ApiClient {
  Future<MyResponse> getCountriesList() async {
    MyResponse myResponse = MyResponse(error: "");
    try {
      Response response = await dio.get("${dio.options.baseUrl}/countries");

      if (response.statusCode == 200) {
        myResponse.data = (response.data["data"]["countries"] as List)
            .map((e) => CountryModel.fromJson((e as Map<String, dynamic>)))
            .toList();
      }
    } catch (error) {
      myResponse.error = error.toString();
    }
    return myResponse;
  }
}
