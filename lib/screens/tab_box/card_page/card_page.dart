import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_competition/cubit/card_cubit/card_cubit.dart';
import 'package:flutter_competition/cubit/card_cubit/card_states.dart';
import 'package:flutter_competition/screens/add_card/add_card_page.dart';

class CardsPage extends StatelessWidget {
  const CardsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cards Info"),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AddCardScreen(),
                    ));
              },
              icon: Icon(Icons.add))
        ],
      ),
      body: BlocBuilder<CardsCubit, CardStates>(
        builder: (context, state) {
          if (state is LoadCardinProgress) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is LoadCardInSucces) {
            return ListView.builder(
              shrinkWrap: true,
              itemCount: state.cards.length,
              itemBuilder: (context, index) {
                return Container(
                  child: Text(state.cards[index].cardName),
                );
              },
            );
          }
          return SizedBox();
        },
      ),
    );
  }
}
