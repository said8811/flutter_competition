import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_competition/bloc/countries_bloc/countries_bloc.dart';
import 'package:flutter_competition/bloc/countries_bloc/countries_event.dart';
import 'package:flutter_competition/bloc/countries_bloc/countries_state.dart';
import 'package:flutter_competition/data/repository/countries_repository.dart';
import 'package:flutter_competition/service/country_api_service/countries_api_service.dart';

class CountriesPage extends StatelessWidget {
  const CountriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CountriesBloc(
        CountriesRepository(
          apiService: CountriesApiSerice()
        ),
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
                    title: Text(
                      item.name,
                    ),
                    // trailing: CachedNetworkImage(
                    //   imageUrl: item.avatarUrl,
                    //   placeholder: (context, url) =>
                    //       const CircularProgressIndicator(),
                    // ),
                  );
                }),
              );
            }
            // else if (state is UsersFromCache) {
            //   return ListView(
            //     children: List.generate(state.users.length, (index) {
            //       var item = state.users[index];
            //       return ListTile(
            //         title: Text(
            //           item.username,
            //         ),
            //         trailing: CachedNetworkImage(
            //           imageUrl: item.avatarUrl,
            //           placeholder: (context, url) =>
            //           const CircularProgressIndicator(),
            //         ),
            //       );
            //     }),
            //   );
            // }
            return const SizedBox();
          },
          listener: (context, state) {},
        ),
      ),
    );
  }
}
