import 'package:flutter/material.dart';
import 'package:hawy_altawsil/componant/colorsApp.dart';

class ItemWallet extends StatelessWidget {
  const ItemWallet({
    super.key,
    required this.date,
    required this.price,
    required this.type,
    required this.currency,
  });
  final String date;
  final String price;
  final String type;
  final String currency;
  @override
  Widget build(BuildContext context) {
    ColorsApp colorsApp = new ColorsApp();
    return Container(
      decoration: BoxDecoration(
        color: Color(0xffF9F9F9),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "نوع العملية : ",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                  ),
                ),
                Text(
                  type == "deposit"
                      ? "اضافة رصيد"
                      : type == "paidOrder"
                          ? "تم سداد طلب"
                          : "ارجاع رصيد",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: type == "deposit"
                        ? colorsApp.colorgreen2
                        : type == "paidOrder"
                            ? Colors.blue
                            : Colors.amber,
                    fontSize: 14,
                  ),
                ),
                Expanded(child: SizedBox()),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    color: Color(0xffFFDBC8),
                    borderRadius: BorderRadius.circular(32),
                  ),
                  child: Row(
                    children: [
                      Text(
                        date,
                        style: TextStyle(fontSize: 10),
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Icon(
                        Icons.calendar_month,
                        size: 14,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 44,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "المبلغ:",
                  style: TextStyle(
                    color: ColorsApp().colorgreen2,
                    fontSize: 14,
                  ),
                ),
                Text(
                  " $currency $price",
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
