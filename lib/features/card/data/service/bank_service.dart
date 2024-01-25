import 'package:markab/features/card/domain/entities/card_entity.dart';
import 'package:markab/features/card/domain/repositories/bank_repository.dart';

import '../models/credit_card.dart';

class BankService extends BankRepository {
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
}
