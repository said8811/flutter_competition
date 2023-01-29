import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_competition/cubit/card_cubit/card_states.dart';
import 'package:flutter_competition/data/models/card_model.dart';
import 'package:flutter_competition/data/repository/card_repository.dart';

class CardsCubit extends Cubit<CardStates> {
  final CardRepository cardRepository;

  CardsCubit(this.cardRepository) : super(LoadCardinProgress()) {
    _fetchCardsInfo();
  }

  _fetchCardsInfo() async {
    emit(LoadCardinProgress());
    cardRepository.getCards().listen((cards) {
      emit(LoadCardInSucces(cards: cards));
    });
  }

  addCard(CardModel cardModel) async {
    cardRepository.addCard(cardModel: cardModel);
  }
}
