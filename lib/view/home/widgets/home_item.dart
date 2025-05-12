import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hawy_altawsil/componant/colorsApp.dart';
import 'package:hawy_altawsil/componant/generated/assets.dart';

class ItemHome extends StatelessWidget {
  const ItemHome({
    super.key,
    required this.data,
  });
  final Map data;

  @override
  Widget build(BuildContext context) {
    ColorsApp colorsApp = new ColorsApp();
    return Container(
      width: double.infinity,
      height: 165,
      margin: EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
        color: ColorsApp().colorbody,
        border: Border.all(
          width: 1,
          color: Colors.grey.shade200,
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                SizedBox(width: 8),
                Text(
                  data["status"] == "create"
                      ? "انشاء الطلب"
                      : data["status"] == "bookOrder"
                          ? "تم الحجز"
                          : data["status"] == "receiveOrder"
                              ? "تم الاستلام"
                              : data["status"] == "back"
                                  ? "رجوع"
                                  : data["status"] == "finishedBack"
                                      ? "تم الارجاع"
                                      : data["status"] == "cancelled"
                                          ? "تم الالغاء"
                                          : "تم توصيلها",
                  style: TextStyle(
                      fontSize: 12,
                      color: data["status"] == "create"
                          ? const Color.fromARGB(255, 187, 173, 45)
                          : data["status"] == "bookOrder"
                              ? Colors.blue
                              : data["status"] == "receiveOrder"
                                  ? Colors.blue
                                  : data["status"] == "back"
                                      ? const Color.fromARGB(255, 173, 51, 43)
                                      : data["status"] == "finishedBack"
                                          ? const Color.fromARGB(
                                              255, 143, 108, 4)
                                          : data["status"] == "cancelled"
                                              ? Colors.red
                                              : colorsApp.colorgreen1,
                      fontWeight: FontWeight.bold),
                ),
                Spacer(),
                Text(
                  "ID: ${data['orderNumber']}",
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
                SizedBox(
                  width: 12,
                ),
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: ColorsApp().colorgreen1,
                  ),
                  child: Center(
                    child: SvgPicture.asset(
                      Assets.imagesBox2,
                      width: 20,
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: Divider(),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("${data['city_receiver']}",
                    style: TextStyle(fontWeight: FontWeight.bold)),
                Icon(Icons.arrow_back),
                Text("${data['city_sender']}",
                    style: TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
