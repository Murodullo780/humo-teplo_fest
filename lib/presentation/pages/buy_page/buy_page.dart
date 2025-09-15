import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:teplo_fest_humo/core/const/color_constants.dart';
import 'package:teplo_fest_humo/core/enums.dart';
import 'package:teplo_fest_humo/core/lng.dart';
import 'package:teplo_fest_humo/core/services/numeric_services.dart';
import 'package:teplo_fest_humo/core/util.dart';
import 'package:teplo_fest_humo/presentation/pages/buy_page/widgets/buy_item.dart';
import 'package:teplo_fest_humo/presentation/pages/receipt_page/receipt_page.dart';

class BuyPage extends StatefulWidget {
  final Lng lng;

  const BuyPage({super.key, required this.lng});

  @override
  State<BuyPage> createState() => _BuyPageState();
}

class _BuyPageState extends State<BuyPage> {
  void addSum(int index) {
    items[index] = items[index].copyWith(count: items[index].count + 1);
    sum = 0;
    calcSum();
  }

  void minSum(int index) {
    if (items[index].count < 1) return;
    items[index] = items[index].copyWith(count: items[index].count - 1);
    sum = 0;
    calcSum();
  }

  int sum = 0;

  void calcSum() {
    sum = 0;
    for (int i = 0; i < items.length; i++) {
      if (items[i].count < 1) continue;
      sum += items[i].price * items[i].count;
    }
    setState(() {});
  }

  @override
  void initState() {
    // items = itemsClone;
    calcSum();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final double textSize = size.height * 0.04;
    return Scaffold(
      appBar: AppBar(
        //height: 100,
        toolbarHeight: size.height * 0.1,
        title: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SvgPicture.asset(
            'assets/svg/Frame 5.svg',
            color: ColorConstants.primaryColor,
          ),
        ),
        automaticallyImplyLeading: false,
      ),
      body: ListView.separated(
        padding: EdgeInsets.symmetric(horizontal: size.width * 0.02),
        itemCount: items.length,
        separatorBuilder: (context, index) => SizedBox(height: size.height * 0.01),
        itemBuilder: (context, index) {
          return BuyItem(
            name: items[index].name.tr(),
            price: items[index].price,
            image: 'assets/images/yostiq.jpg',
            count: items[index].count,
            onChangePrice: (isPlus) {
              if (isPlus) {
                addSum(index);
              } else {
                minSum(index);
              }
            },
            onTap: (price) {
              addSum(index);
            },
          );
        },
      ),
      bottomNavigationBar: items.where((element) => element.count > 0).isNotEmpty
          ? InkWell(
              onTap: () async {
                await Navigator.push(
                    context, MaterialPageRoute(builder: (context) => const ReceiptPage(once: true)));
                setState(() {});
              },
              child: Container(
                height: size.height * 0.1,
                color: ColorConstants.primaryColor,
                // padding: EdgeInsets.only(right: size.width * 0.02),
                child: Row(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: size.width * 0.02),
                      height: size.height * 0.1,
                      width: size.width * 0.6,
                      color: Colors.red,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        spacing: 18,
                        children: [
                          Text(TranslationKeys.receivePrizes.tr(),
                              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                  fontWeight: FontWeight.bold, fontSize: textSize / 2, color: Colors.white)),
                          Icon(
                            Icons.arrow_forward,
                            size: textSize / 2,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: size.width * 0.4,
                      child: Center(
                        child: Text(
                          '${TranslationKeys.total.tr()}: ${NumericServices.formatNumber(sum)}',
                          textAlign: TextAlign.right,
                          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: textSize / 1.8,
                              ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          : null,
    );
  }
}
