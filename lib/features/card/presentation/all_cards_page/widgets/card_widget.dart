import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:markab/features/card/data/models/credit_card.dart';

class CreditCardWidget extends StatelessWidget {
  final CreditCard card;
  final Color color;
  const CreditCardWidget({super.key, required this.card, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120.h,
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(12.sp)),
        color: color,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    card.name,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14.sp,
                    ),
                  ),
                  RichText(
                    text: TextSpan(
                      style: const TextStyle(
                        fontWeight: FontWeight.w700,
                      ),
                      children: [
                        TextSpan(
                          text: card.balance.toInt().toString(),
                          style: TextStyle(
                            fontSize: 20.sp,
                          ),
                        ),
                        TextSpan(
                          text:
                              ',${((card.balance - card.balance.toInt()) * 100).toInt()} so’m',
                          style: TextStyle(
                            fontSize: 10.sp,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '${card.cardNumber.substring(0, 4)} **** **** ${card.cardNumber.substring(card.cardNumber.length - 4, card.cardNumber.length)}',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 1,
                ),
              ),
              Text(
                card.expireDate,
                style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w700,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
