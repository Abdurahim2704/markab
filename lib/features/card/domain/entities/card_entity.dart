import 'package:equatable/equatable.dart';

class CardEntity extends Equatable {
  final String cardNumber;
  final String bank;
  double _balance;
  final String expireDate;
  String name;

  CardEntity({
    required this.cardNumber,
    required this.bank,
    required this.expireDate,
    required this.name,
    required double balance,
  }) : _balance = balance;

  set balance(double value) {
    if (value > 0) {
      _balance = value;
    }
  }

  double get balance => _balance;

  @override
  List<Object?> get props => [cardNumber, expireDate];
}
