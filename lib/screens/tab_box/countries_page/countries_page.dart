import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_competition/bloc/countries_bloc/countries_bloc.dart';
import 'package:flutter_competition/bloc/countries_bloc/countries_event.dart';
import 'package:flutter_competition/bloc/countries_bloc/countries_state.dart';
import 'package:flutter_competition/data/repository/countries_repository.dart';
import 'package:flutter_competition/screens/tab_box/countries_page/detail_country_page.dart/country_info_page.dart';
import 'package:flutter_competition/service/country_api_service/countries_api_service.dart';

class CountriesPage extends StatelessWidget {
  const CountriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CountriesBloc(
        CountriesRepository(apiService: CountriesApiSerice()),
      )..add(GetCountries()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Countries"),
        ),
        body: BlocConsumer<CountriesBloc, CountriesState>(
          builder: (context, state) {
            if (state is CountriesLoadInProgress) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is CountriesLoadFailure) {
              return Center(
                child: Text(state.error),
              );
            } else if (state is CountriesLoadSuccess) {
              return ListView(
                children: List.generate(state.countries.length, (index) {
                  var item = state.countries[index];
                  return ListTile(
                    subtitle: Text(item.capital),
                    trailing: Text(item.emoji),
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CountryInfoPage(country: item),
                        )),
                    title: Text(
                      item.name,
                    ),
                  );
                }),
              );
            } else if (state is CountriesFromCache) {
              return ListView(
                children: List.generate(state.countries.length, (index) {
                  var item = state.countries[index];
                  return ListTile(
                    subtitle: Text(item.capital),
                    trailing: Text(item.emoji),
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CountryInfoPage(country: item),
                        )),
                    title: Text(
                      item.name,
                    ),
                  );
                }),
              );
            }
            return const SizedBox();
          },
          listener: (context, state) {},
        ),
      ),
    );
  }
}
