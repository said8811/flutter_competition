import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_competition/bloc/countries_bloc/countries_event.dart';
import 'package:flutter_competition/bloc/countries_bloc/countries_state.dart';
import 'package:flutter_competition/data/models/country_model.dart/country_model.dart';
import 'package:flutter_competition/data/models/my_response.dart';
import 'package:flutter_competition/data/repository/countries_repository.dart';

class CountriesBloc extends Bloc<CountriesEvent, CountriesState> {
  CountriesBloc(this.countriesRepository) : super((CountriesInitial())) {
    on<GetCountries>(_fetchCountries);
  }

  final CountriesRepository countriesRepository;

  _fetchCountries(GetCountries event, Emitter<CountriesState> emit) async {
    emit(CountriesLoadInProgress());

    MyResponse myResponse = await countriesRepository.getCountries();

    if (myResponse.error.isEmpty) {
      List<CountryModel> countries = myResponse.data as List<CountryModel>;
      emit(CountriesLoadSuccess(countries: countries));
      await _updateCachedCountries(countries);
    } else {
     
      print("ERROR USERS: ${myResponse.error}");
      List<CountryModel> countries =
          await countriesRepository.getAllCachedCountries();
          print(countries);
      if (countries.isNotEmpty) {
        emit(CountriesFromCache(countries: countries));
      } else {
        emit(CountriesLoadFailure(error: myResponse.error));
      }
    }
  }

  _updateCachedCountries(List<CountryModel> countries) async {
    int deletedCount = await countriesRepository.deleteCachedCountries();
    print("O'CHIRILGANLAR SONI:$deletedCount");
    for (var country in countries) {
      await countriesRepository.insertCountryToDb(country);
    }
  }
}
