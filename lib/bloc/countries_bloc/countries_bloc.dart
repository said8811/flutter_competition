import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_competition/bloc/countries_bloc/countries_event.dart';
import 'package:flutter_competition/bloc/countries_bloc/countries_state.dart';
import 'package:flutter_competition/data/models/country_model.dart/countries_model.dart';
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
      // await _updateCachedUsers(users);
    } else {
      emit(CountriesLoadFailure(error: myResponse.error));
      print("ERROR USERS: ${myResponse.error}");
      // List<CountryModel> users = await countriesRepository.getAllCachedUsers();
      // if (users.isNotEmpty) {
      //   emit(UsersFromCache(users: users));
      // } else {
      //   emit(UsersLoadInFailure(errorText: myResponse.error));
    }
  }
}
