import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:teplo_fest_humo/core/const/color_constants.dart';
import 'package:teplo_fest_humo/core/lng.dart';
import 'package:teplo_fest_humo/core/services/numeric_services.dart';
import 'package:teplo_fest_humo/core/util.dart';
import 'package:teplo_fest_humo/data/models/priz_model.dart';

class ReceiptPage extends StatefulWidget {
  final bool? once;

  const ReceiptPage({super.key, this.once});

  @override
  State<ReceiptPage> createState() => _ReceiptPageState();
}

class _ReceiptPageState extends State<ReceiptPage> {
  List<PrizModel> itemsClone = [
    PrizModel(name: "Soft Yostiq", price: 25000, image: "assets/images/yostiq.jpg", count: 0),
    PrizModel(name: "Lux Yostiq", price: 35000, image: "assets/images/yostiq.jpg", count: 0),
    PrizModel(name: "Comfort Yostiq", price: 20000, image: "assets/images/yostiq.jpg", count: 0),
    PrizModel(name: "Eco Yostiq", price: 30000, image: "assets/images/yostiq.jpg", count: 0),
    PrizModel(name: "Premium Yostiq", price: 40000, image: "assets/images/yostiq.jpg", count: 0),
    PrizModel(name: "Silk Yostiq", price: 45000, image: "assets/images/yostiq.jpg", count: 0),
    PrizModel(name: "Cotton Yostiq", price: 28000, image: "assets/images/yostiq.jpg", count: 0),
    PrizModel(name: "Memory Foam Yostiq", price: 50000, image: "assets/images/yostiq.jpg", count: 0),
    PrizModel(name: "Classic Yostiq", price: 22000, image: "assets/images/yostiq.jpg", count: 0),
    PrizModel(name: "Ortho Yostiq", price: 42000, image: "assets/images/yostiq.jpg", count: 0),
    PrizModel(name: "Travel Yostiq", price: 15000, image: "assets/images/yostiq.jpg", count: 0),
    PrizModel(name: "Cool Gel Yostiq", price: 48000, image: "assets/images/yostiq.jpg", count: 0),
    PrizModel(name: "Bamboo Yostiq", price: 32000, image: "assets/images/yostiq.jpg", count: 0),
    PrizModel(name: "Anti-Allergy Yostiq", price: 38000, image: "assets/images/yostiq.jpg", count: 0),
    PrizModel(name: "Kids Yostiq", price: 18000, image: "assets/images/yostiq.jpg", count: 0),
    PrizModel(name: "Firm Yostiq", price: 34000, image: "assets/images/yostiq.jpg", count: 0),
    PrizModel(name: "Soft Touch Yostiq", price: 26000, image: "assets/images/yostiq.jpg", count: 0),
    PrizModel(name: "Luxury Yostiq", price: 55000, image: "assets/images/yostiq.jpg", count: 0),
    PrizModel(name: "Organic Yostiq", price: 36000, image: "assets/images/yostiq.jpg", count: 0),
    PrizModel(name: "Ergo Yostiq", price: 39000, image: "assets/images/yostiq.jpg", count: 0),
    PrizModel(name: "Plush Yostiq", price: 27000, image: "assets/images/yostiq.jpg", count: 0),
    PrizModel(name: "Hypoallergenic Yostiq", price: 41000, image: "assets/images/yostiq.jpg", count: 0),
    PrizModel(name: "Neck Support Yostiq", price: 43000, image: "assets/images/yostiq.jpg", count: 0),
    PrizModel(name: "Cooling Yostiq", price: 46000, image: "assets/images/yostiq.jpg", count: 0),
    PrizModel(name: "Standard Yostiq", price: 21000, image: "assets/images/yostiq.jpg", count: 0),
    PrizModel(name: "Deluxe Yostiq", price: 47000, image: "assets/images/yostiq.jpg", count: 0),
    PrizModel(name: "Microfiber Yostiq", price: 29000, image: "assets/images/yostiq.jpg", count: 0),
    PrizModel(name: "Latex Yostiq", price: 52000, image: "assets/images/yostiq.jpg", count: 0),
    PrizModel(name: "Feather Yostiq", price: 31000, image: "assets/images/yostiq.jpg", count: 0),
    PrizModel(name: "Down Yostiq", price: 49000, image: "assets/images/yostiq.jpg", count: 0),
    PrizModel(name: "Firm Support Yostiq", price: 33000, image: "assets/images/yostiq.jpg", count: 0),
    PrizModel(name: "Soft Comfort Yostiq", price: 24000, image: "assets/images/yostiq.jpg", count: 0),
    PrizModel(name: "Cool Breeze Yostiq", price: 44000, image: "assets/images/yostiq.jpg", count: 0),
    PrizModel(name: "Natural Yostiq", price: 37000, image: "assets/images/yostiq.jpg", count: 0),
    PrizModel(name: "Orthopedic Yostiq", price: 45000, image: "assets/images/yostiq.jpg", count: 0),
    PrizModel(name: "Mini Yostiq", price: 17000, image: "assets/images/yostiq.jpg", count: 0),
    PrizModel(name: "Lux Comfort Yostiq", price: 51000, image: "assets/images/yostiq.jpg", count: 0),
    PrizModel(name: "Eco-Friendly Yostiq", price: 35000, image: "assets/images/yostiq.jpg", count: 0),
    PrizModel(name: "Soft Plush Yostiq", price: 23000, image: "assets/images/yostiq.jpg", count: 0),
    PrizModel(name: "Travel Comfort Yostiq", price: 19000, image: "assets/images/yostiq.jpg", count: 0),
    PrizModel(name: "Premium Comfort Yostiq", price: 53000, image: "assets/images/yostiq.jpg", count: 0),
    PrizModel(name: "Silk Touch Yostiq", price: 40000, image: "assets/images/yostiq.jpg", count: 0),
    PrizModel(name: "Anti-Slip Yostiq", price: 32000, image: "assets/images/yostiq.jpg", count: 0),
    PrizModel(name: "Cool Touch Yostiq", price: 47000, image: "assets/images/yostiq.jpg", count: 0),
    PrizModel(name: "Bamboo Comfort Yostiq", price: 34000, image: "assets/images/yostiq.jpg", count: 0),
    PrizModel(name: "Firm Comfort Yostiq", price: 36000, image: "assets/images/yostiq.jpg", count: 0),
    PrizModel(name: "Lux Plush Yostiq", price: 48000, image: "assets/images/yostiq.jpg", count: 0),
    PrizModel(name: "Organic Comfort Yostiq", price: 39000, image: "assets/images/yostiq.jpg", count: 0),
    PrizModel(name: "Memory Support Yostiq", price: 50000, image: "assets/images/yostiq.jpg", count: 0),
    PrizModel(name: "Soft Silk Yostiq", price: 28000, image: "assets/images/yostiq.jpg", count: 0),
    PrizModel(name: "Cool Comfort Yostiq", price: 46000, image: "assets/images/yostiq.jpg", count: 0),
    PrizModel(name: "Standard Comfort Yostiq", price: 22000, image: "assets/images/yostiq.jpg", count: 0),
    PrizModel(name: "Deluxe Comfort Yostiq", price: 49000, image: "assets/images/yostiq.jpg", count: 0),
    PrizModel(name: "Microfiber Comfort Yostiq", price: 30000, image: "assets/images/yostiq.jpg", count: 0),
    PrizModel(name: "Latex Comfort Yostiq", price: 51000, image: "assets/images/yostiq.jpg", count: 0),
    PrizModel(name: "Feather Comfort Yostiq", price: 33000, image: "assets/images/yostiq.jpg", count: 0),
    PrizModel(name: "Down Comfort Yostiq", price: 47000, image: "assets/images/yostiq.jpg", count: 0),
    PrizModel(name: "Firm Support Comfort Yostiq", price: 35000, image: "assets/images/yostiq.jpg", count: 0),
    PrizModel(name: "Soft Comfort Touch Yostiq", price: 26000, image: "assets/images/yostiq.jpg", count: 0),
    PrizModel(name: "Cool Breeze Comfort Yostiq", price: 45000, image: "assets/images/yostiq.jpg", count: 0),
    PrizModel(name: "Natural Comfort Yostiq", price: 38000, image: "assets/images/yostiq.jpg", count: 0),
    PrizModel(name: "Orthopedic Comfort Yostiq", price: 46000, image: "assets/images/yostiq.jpg", count: 0),
    PrizModel(name: "Mini Comfort Yostiq", price: 18000, image: "assets/images/yostiq.jpg", count: 0),
    PrizModel(name: "Lux Comfort Touch Yostiq", price: 52000, image: "assets/images/yostiq.jpg", count: 0),
    PrizModel(name: "Eco-Friendly Comfort Yostiq", price: 36000, image: "assets/images/yostiq.jpg", count: 0),
    PrizModel(name: "Soft Plush Comfort Yostiq", price: 24000, image: "assets/images/yostiq.jpg", count: 0),
    PrizModel(name: "Travel Comfort Touch Yostiq", price: 20000, image: "assets/images/yostiq.jpg", count: 0),
    PrizModel(
        name: "Premium Comfort Touch Yostiq", price: 54000, image: "assets/images/yostiq.jpg", count: 0),
    PrizModel(name: "Silk Touch Comfort Yostiq", price: 41000, image: "assets/images/yostiq.jpg", count: 0),
    PrizModel(name: "Anti-Slip Comfort Yostiq", price: 33000, image: "assets/images/yostiq.jpg", count: 0),
    PrizModel(name: "Cool Touch Comfort Yostiq", price: 48000, image: "assets/images/yostiq.jpg", count: 0),
    PrizModel(name: "Bamboo Comfort Touch Yostiq", price: 35000, image: "assets/images/yostiq.jpg", count: 0),
    PrizModel(name: "Firm Comfort Touch Yostiq", price: 37000, image: "assets/images/yostiq.jpg", count: 0),
    PrizModel(name: "Lux Plush Comfort Yostiq", price: 49000, image: "assets/images/yostiq.jpg", count: 0),
    PrizModel(
        name: "Organic Comfort Touch Yostiq", price: 40000, image: "assets/images/yostiq.jpg", count: 0),
    PrizModel(
        name: "Memory Support Comfort Yostiq", price: 51000, image: "assets/images/yostiq.jpg", count: 0),
    PrizModel(name: "Soft Silk Comfort Yostiq", price: 29000, image: "assets/images/yostiq.jpg", count: 0),
    PrizModel(name: "Cool Comfort Touch Yostiq", price: 47000, image: "assets/images/yostiq.jpg", count: 0),
    PrizModel(
        name: "Standard Comfort Touch Yostiq", price: 23000, image: "assets/images/yostiq.jpg", count: 0),
    PrizModel(name: "Deluxe Comfort Touch Yostiq", price: 50000, image: "assets/images/yostiq.jpg", count: 0),
    PrizModel(
        name: "Microfiber Comfort Touch Yostiq", price: 31000, image: "assets/images/yostiq.jpg", count: 0),
    PrizModel(name: "Latex Comfort Touch Yostiq", price: 52000, image: "assets/images/yostiq.jpg", count: 0),
    PrizModel(
        name: "Feather Comfort Touch Yostiq", price: 34000, image: "assets/images/yostiq.jpg", count: 0),
    PrizModel(name: "Down Comfort Touch Yostiq", price: 48000, image: "assets/images/yostiq.jpg", count: 0),
    PrizModel(
        name: "Firm Support Comfort Touch Yostiq", price: 36000, image: "assets/images/yostiq.jpg", count: 0),
    PrizModel(name: "Soft Comfort Touch Yostiq", price: 27000, image: "assets/images/yostiq.jpg", count: 0),
    PrizModel(
        name: "Cool Breeze Comfort Touch Yostiq", price: 46000, image: "assets/images/yostiq.jpg", count: 0),
    PrizModel(
        name: "Natural Comfort Touch Yostiq", price: 39000, image: "assets/images/yostiq.jpg", count: 0),
    PrizModel(
        name: "Orthopedic Comfort Touch Yostiq", price: 47000, image: "assets/images/yostiq.jpg", count: 0),
    PrizModel(name: "Mini Comfort Touch Yostiq", price: 19000, image: "assets/images/yostiq.jpg", count: 0),
    PrizModel(name: "Lux Comfort Touch Yostiq", price: 53000, image: "assets/images/yostiq.jpg", count: 0),
    PrizModel(
        name: "Eco-Friendly Comfort Touch Yostiq", price: 37000, image: "assets/images/yostiq.jpg", count: 0),
    PrizModel(
        name: "Soft Plush Comfort Touch Yostiq", price: 25000, image: "assets/images/yostiq.jpg", count: 0),
    PrizModel(name: "Travel Comfort Touch Yostiq", price: 21000, image: "assets/images/yostiq.jpg", count: 0),
    PrizModel(
        name: "Premium Comfort Touch Yostiq", price: 55000, image: "assets/images/yostiq.jpg", count: 0),
    PrizModel(name: "Silk Touch Comfort Yostiq", price: 42000, image: "assets/images/yostiq.jpg", count: 0),
    PrizModel(
        name: "Anti-Slip Comfort Touch Yostiq", price: 34000, image: "assets/images/yostiq.jpg", count: 0),
    PrizModel(name: "Cool Touch Comfort Yostiq", price: 49000, image: "assets/images/yostiq.jpg", count: 0),
    PrizModel(name: "Bamboo Comfort Touch Yostiq", price: 36000, image: "assets/images/yostiq.jpg", count: 0),
  ];
  ValueNotifier<int> backNotifier = ValueNotifier(10);
  List<PrizModel> prizList = items.where((element) => element.count > 0).toList();
  double total = 0;
  Timer? _timer;

  void _pop() {
    items.clear();
    items = itemsClone;
    setState(() {});
    Navigator.pop(context);
    Navigator.pop(context);
    if (widget.once != true) Navigator.pop(context);
  }

  void _back() {
    backNotifier.value--;
    if (backNotifier.value == 0) {
      _pop();
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  void initState() {
    if (true) {
      _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
        _back();
      });
      total = prizList.fold(0, (previousValue, element) => previousValue + element.price * element.count);
    }
    super.initState();
  }

  Widget _item(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: textSize / 1.5,
              fontWeight: FontWeight.bold,
            ),
          ),
          Expanded(
            child: Text(
              value,
              textAlign: TextAlign.right,
              style: TextStyle(
                fontSize: textSize / 1.5,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorConstants.primaryColor.withAlpha(50),
        centerTitle: true,
        toolbarHeight: size.height * 0.1,
        title: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            // Translated,
            TranslationKeys.receipt.tr(),
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
              fontSize: textSize * 1.5,
              color: ColorConstants.primaryColor,
            ),
          ),
        ),
        automaticallyImplyLeading: false,
      ),
      body: Container(
        color: ColorConstants.primaryColor.withAlpha(50),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ClipPath(
                  clipper: TicketClipper(),
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: size.width * 0.05),
                    padding: EdgeInsets.all(24),
                    color: Colors.white,
                    child: Column(
                      children: [
                        _item(TranslationKeys.registrationDate.tr(), DateServices.formatDateTime(DateTime.now())),
                        _item(TranslationKeys.receiptNumber.tr(), '123456789'),
                        _item(TranslationKeys.cashier.tr(), 'Киоск 1'),
                        Divider(
                          thickness: 2,
                        ),
                        _item(TranslationKeys.products.tr(), '${prizList.length}'),
                        ...List.generate(
                            prizList.length,
                                (index) => Container(
                              decoration: BoxDecoration(
                                border: Border(
                                  top: index == 0
                                      ? BorderSide.none
                                      : BorderSide(
                                    color: Colors.black54,
                                    width: 1.5,
                                  ),
                                ),
                              ),
                              margin: const EdgeInsets.symmetric(horizontal: 18.0),
                              child: _item(prizList[index].name,
                                  '${prizList[index].count} x ${NumericServices.formatNumber(prizList[index].price)}'),
                            )),
                        Divider(
                          thickness: 2,
                        ),
                        _item(TranslationKeys.total.tr(), NumericServices.formatNumber(total.toInt())),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: size.width * 0.05, right: size.width * 0.05, top: size.height * 0.008),
                  child: Text(TranslationKeys.takePhotoAndPresent.tr(),
                      textAlign: TextAlign.center,
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium
                          ?.copyWith(fontWeight: FontWeight.bold, fontSize: textSize / 1.3)),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: InkWell(
        onTap: () => _pop(),
        child: Container(
          height: size.height * 0.1,
          color: ColorConstants.primaryColor,
          padding: EdgeInsets.symmetric(horizontal: size.width * 0.02),
          child: Center(
            child: ValueListenableBuilder(
                valueListenable: backNotifier,
                builder: (context, value, child) {
                  return Text(
                      '${TranslationKeys.returnToMain.tr()} ($value)',
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium
                          ?.copyWith(fontWeight: FontWeight.bold, fontSize: textSize, color: Colors.white));
                }),
          ),
        ),
      ),
    );
  }
}

class TicketClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    int segments = 120;
    double segmentWidth = size.width / segments;
    double amplitude = 5.0;
    var path = Path();

    path.moveTo(0, 0);

    for (int i = 0; i < segments; i++) {
      double startX = segmentWidth * i;
      double midX = startX + segmentWidth / 2;
      double nextX = startX + segmentWidth;
      if (i % 2 == 0) {
        path.lineTo(midX, amplitude);
      } else {
        path.lineTo(midX, 0);
      }
      path.lineTo(nextX, 0);
    }

    path.lineTo(size.width, size.height);

    for (int i = 0; i < segments; i++) {
      double startX = size.width - segmentWidth * i;
      double midX = startX - segmentWidth / 2;
      double nextX = startX - segmentWidth;
      if (i % 2 == 0) {
        path.lineTo(midX, size.height - amplitude);
      } else {
        path.lineTo(midX, size.height);
      }
      path.lineTo(nextX, size.height);
    }

    path.lineTo(0, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}