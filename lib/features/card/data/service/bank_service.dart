import 'package:markab/features/card/domain/entities/card_entity.dart';
import 'package:markab/features/card/domain/repositories/bank_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/credit_card.dart';

class BankService extends BankRepository {
  late final SharedPreferences ins;

  @override
  Future<CardEntity> getCreditData(
      String cardNumber, String expireDate, String name) async {
    return CreditCard(
        cardNumber: cardNumber,
        bank: "Aloqa bank",
        expireDate: expireDate,
        name: name,
        balance: 29000);
  }

  @override
  Future<List<String>> getCardsLocal() async {
    final String cards = ins.getString("cards") ?? "";
    return cards.split(";").toList();
  }

  @override
  Future<void> init() async {
    ins = await SharedPreferences.getInstance();
  }

  @override
  Future<bool> saveCard(
      String cardNumber, String expireDate, String name) async {
    final String cards = ins.getString("cards") ?? "";
    final newCards = cards.split(";");
    newCards.add("$cardNumber, $expireDate, $name");
    return await ins.setString("cards", newCards.join(";"));
  }
}
