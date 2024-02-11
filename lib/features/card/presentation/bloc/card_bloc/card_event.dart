part of 'card_bloc.dart';

abstract class CardEvent {
  const CardEvent();
}

class GetCardEvent extends CardEvent {
  final String cardNumber;
  final String expireDate;
  final String name;

  const GetCardEvent(
      {required this.name, required this.expireDate, required this.cardNumber});
}

class GetLocalCardEvent extends CardEvent {
  const GetLocalCardEvent();
}