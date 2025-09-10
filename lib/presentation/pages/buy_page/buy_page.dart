import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:teplo_fest_humo/core/const/color_constants.dart';
import 'package:teplo_fest_humo/core/services/numeric_services.dart';
import 'package:teplo_fest_humo/core/util.dart';
import 'package:teplo_fest_humo/data/models/priz_model.dart';
import 'package:teplo_fest_humo/presentation/pages/buy_page/widgets/buy_item.dart';
import 'package:teplo_fest_humo/presentation/pages/cart_page/cart_page.dart';
import 'package:teplo_fest_humo/presentation/widget/coint_widget.dart';

class BuyPage extends StatefulWidget {
  const BuyPage({super.key});

  @override
  State<BuyPage> createState() => _BuyPageState();
}

class _BuyPageState extends State<BuyPage> {
  void addSum(PrizModel price) {
    itemsInCart.add(price);
    sum = 0;
    calcSum();
  }

  int sum = 0;

  void calcSum() {
    for (int i = 0; i < itemsInCart.length; i++) {
      print(itemsInCart[i].price);
      sum += itemsInCart[i].price;
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
              addSum(items[index]);
            },
          );
        },
      ),
      bottomNavigationBar: itemsInCart.isNotEmpty
          ? InkWell(
              onTap: () async {
                await Navigator.push(context, MaterialPageRoute(builder: (context) => const CartPage()));
                setState(() {});
              },
              child: Container(
                height: size.height * 0.1,
                color: ColorConstants.primaryColor.withAlpha(100),
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.02),
                child: Row(
                  spacing: 8,
                  children: [
                    Text('Товары в корзине:',
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium
                            ?.copyWith(fontWeight: FontWeight.bold, fontSize: textSize / 2)),
                    const Spacer(),
                    CointWidget(
                      count: ((sum / 20000)).toInt(),
                      size: size.height * 0.03,
                      space: size.height * 0.03,
                    ),
                    Text(
                      'Сумма: ${NumericServices.formatNumber(sum)}',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                            fontSize: textSize / 2,
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
