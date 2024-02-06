part of 'card_bloc.dart';

@immutable
abstract class CardState {
  final List<CreditCard> cards;

  const CardState({required this.cards});
}

class CardInitial extends CardState {
  const CardInitial({required super.cards});
}

class CardError extends CardState {
  final String message;

  const CardError({required super.cards, required this.message});
}

class CardSuccess extends CardState {
  const CardSuccess({required super.cards});
}
