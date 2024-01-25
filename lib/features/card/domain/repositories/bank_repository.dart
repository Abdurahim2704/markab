import '../entities/card_entity.dart';

abstract class BankRepository {
  Future<CardEntity> getCreditData(
      String cardNumber, String expireDate, String name);
}
