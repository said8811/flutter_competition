import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_competition/cubit/card_cubit/card_cubit.dart';
import 'package:flutter_competition/cubit/card_cubit/card_states.dart';
import 'package:flutter_competition/data/models/card_model.dart';
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
            List<CardModel> item = state.cards;
            return ListView.builder(
              shrinkWrap: true,
              itemCount: state.cards.length,
              itemBuilder: (context, index) {
                return Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  height: 200,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      gradient: LinearGradient(colors: [
                        Color(int.parse(state.cards[index].gradient[0])),
                        Color(int.parse(state.cards[index].gradient[1]))
                      ])),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Shaxsiy",
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        item[index].cardNumber,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        item[index].expireDate,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        item[index].cardName,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 10),
                      Text(item[index].owner,
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold))
                    ],
                  ),
                );
              },
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}
