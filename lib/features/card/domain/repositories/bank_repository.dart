import '../entities/card_entity.dart';

abstract class BankRepository {
  Future<void> init();
  Future<CardEntity> getCreditData(
      String cardNumber, String expireDate, String name);

  Future<List<String>> getCardsLocal();

  Future<bool> saveCard(String cardNumber, String expireDate, String name);
}
