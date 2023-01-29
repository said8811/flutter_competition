import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_competition/data/models/card_model.dart';

class CardRepository {
  final FirebaseFirestore _firestore;

  CardRepository({required FirebaseFirestore firebaseFirestore})
      : _firestore = firebaseFirestore;

  Stream getDoctors() => _firestore.collection("cards").snapshots().map(
        (event) =>
            event.docs.map((doc) => CardModel.fromJson(doc.data())).toList(),
      );

  Future<void> addCard({required CardModel cardModel}) async {
    try {
      DocumentReference newCard =
          await _firestore.collection("cards").add(cardModel.toJson());
      await _firestore.collection("cards").doc(newCard.id).update({
        "card_id": newCard.id,
      });
      print("Card muvaffaqiyatli qo'shildi!");
    } on FirebaseException catch (er) {
      print(er.message.toString());
    }
  }
}
