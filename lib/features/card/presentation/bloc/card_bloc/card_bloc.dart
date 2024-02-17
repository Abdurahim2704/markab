import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:markab/features/card/data/models/credit_card.dart';
import 'package:markab/features/card/domain/repositories/bank_repository.dart';
import 'package:markab/locator.dart';

part 'card_event.dart';
part 'card_state.dart';

class CardBloc extends Bloc<CardEvent, CardState> {
  CardBloc() : super(const CardInitial(cards: [])) {
    on<GetCardEvent>(_getCardEvent);
    on<GetLocalCardEvent>(_getLocalCardEvent);
    on<SaveCardEvent>(_saveCardEvent);
  }

  void _getCardEvent(GetCardEvent event, Emitter<CardState> emit) async {
    try {
      final result = await getIt<BankRepository>().getCreditData(
        event.cardNumber,
        event.expireDate,
        event.name,
      );
      debugPrint(result.toString());
      emit(CardSuccess(cards: [...state.cards, result as CreditCard]));
    } catch (e) {
      debugPrint(e.toString());
      emit(CardError(cards: state.cards, message: e.toString()));
    }
  }

  void _getLocalCardEvent(
      GetLocalCardEvent event, Emitter<CardState> emit) async {
    final service = getIt<BankRepository>();

    final cardsString = await service.getCardsLocal();
    print(cardsString);
    final List<CreditCard> cards = [];

    for (var item in cardsString) {
      final param = item.split(",");
      final card = await service.getCreditData(param[0], param[1], param[2]);
      cards.add(card as CreditCard);
    }

    emit(CardSuccess(cards: cards));
  }

  void _saveCardEvent(SaveCardEvent event, Emitter<CardState> emit) async {
    final service = getIt<BankRepository>();

    final result =
        await service.saveCard(event.cardNumber, event.expireDate, event.name);
    print(result);
    emit(CardSaveSuccess(cards: state.cards));
  }
}
