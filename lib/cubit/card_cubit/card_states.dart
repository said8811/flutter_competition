import 'package:flutter_competition/data/models/card_model.dart';

abstract class CardStates {}

class LoadCardinProgress extends CardStates {}

class LoadCardInSucces extends CardStates {
  LoadCardInSucces({required this.cards});
  List<CardModel> cards;
}
