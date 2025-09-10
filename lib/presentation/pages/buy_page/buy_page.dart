import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:teplo_fest_humo/core/const/color_constants.dart';
import 'package:teplo_fest_humo/core/services/numeric_services.dart';
import 'package:teplo_fest_humo/core/util.dart';
import 'package:teplo_fest_humo/data/models/priz_model.dart';
import 'package:teplo_fest_humo/presentation/pages/buy_page/widgets/buy_item.dart';
import 'package:teplo_fest_humo/presentation/pages/cart_page/cart_page.dart';

class BuyPage extends StatefulWidget {
  const BuyPage({super.key});

  @override
  State<BuyPage> createState() => _BuyPageState();
}

class _BuyPageState extends State<BuyPage> {
  void addSum(int index) {
    items[index] = items[index].copyWith(count: items[index].count + 1);
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
            'assets/svg/g16 (1).svg',
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
            name: items[index].name,
            price: items[index].price,
            image: 'assets/images/yostiq.jpg',
            onTap: (price) {
              addSum(index);
            },
          );
        },
      ),
      bottomNavigationBar: items.where((element) => element.count > 0).isNotEmpty
          ? InkWell(
              onTap: () async {
                await Navigator.push(context, MaterialPageRoute(builder: (context) => const CartPage()));
                setState(() {});
              },
              child: Container(
                height: size.height * 0.1,
                color: ColorConstants.primaryColor,
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.02),
                child: Row(
                  spacing: 18,
                  children: [
                    Text('Перейти в корзину',
                        style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.bold, fontSize: textSize / 2, color: Colors.white)),
                    Icon(
                      Icons.arrow_forward,
                      size: textSize / 2,
                      color: Colors.white,
                    ),
                    const Spacer(),
                    // CointWidget(
                    //   count: ((sum / 20000)).toInt(),
                    //   size: size.height * 0.03,
                    //   space: size.height * 0.03,
                    // ),
                    Text(
                      'Итого: ${NumericServices.formatNumber(sum)}',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: textSize / 1.8,
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
