import 'dart:convert';

import 'package:markab/features/card/domain/entities/card_entity.dart';

class CreditCard extends CardEntity {
  CreditCard({
    required super.cardNumber,
    required super.bank,
    required super.expireDate,
    required super.name,
    required super.balance,
  });

  factory CreditCard.fromJson(Map<String, Object?> json) {
    final cardNumber = json["card_number"] as String;
    final bank = json["bank"] as String;
    final expireDate = json["expire_date"] as String;
    final name = json["name"] as String;
    final balance = json["balance"] as double;

    return CreditCard(
        cardNumber: cardNumber,
        bank: bank,
        expireDate: expireDate,
        name: name,
        balance: balance);
  }

  String toJson() {
    return jsonEncode({
      "card_number": cardNumber,
      "bank": bank,
      "expire_date": expireDate,
      'name': name,
      "balance": balance
    });
  }
}
