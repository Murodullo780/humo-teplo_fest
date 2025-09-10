import 'package:flutter/material.dart';
import 'package:teplo_fest_humo/core/const/color_constants.dart';
import 'package:teplo_fest_humo/core/services/numeric_services.dart';
import 'package:teplo_fest_humo/core/util.dart';
import 'package:teplo_fest_humo/data/models/priz_model.dart';
import 'package:teplo_fest_humo/presentation/pages/buy_page/widgets/buy_item.dart';
import 'package:teplo_fest_humo/presentation/pages/cart_page/widgets/cart_item.dart';
import 'package:teplo_fest_humo/presentation/pages/receipt_page/receipt_page.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  List<PrizModel> itemsInCarts = items.where((element) => element.count > 0).toList();

  int sum = 0;

  void calculateSum() {
    sum = 0;
    for (var item in itemsInCarts) {
      sum += item.price * item.count; // Narxni count bilan ko‘paytiramiz
    }
  }

  @override
  void initState() {
    calculateSum();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        toolbarHeight: size.height * 0.1,
        title: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            'Корзина',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
              fontSize: textSize * 1.5,
              color: ColorConstants.primaryColor,
            ),
          ),
        ),
        automaticallyImplyLeading: false,
      ),
      body: itemsInCarts.isNotEmpty
          ? ListView.separated(
        padding: EdgeInsets.symmetric(horizontal: size.width * 0.02),
        itemCount: itemsInCarts.length,
        separatorBuilder: (context, index) {
          return SizedBox(height: size.height * 0.02);
        },
        itemBuilder: (context, index) {
          return BuyItem(
            name: itemsInCarts[index].name,
            price: itemsInCarts[index].price,
            image: itemsInCarts[index].image,
            onTap: (price) {},
            onTrailing: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: CartItem(
                price: itemsInCarts[index].price,
                count: itemsInCarts[index].count,
                onChangePrice: (isPlus) {
                  setState(() {
                    if (isPlus) {
                      items[index] = items[index].copyWith(count: items[index].count + 1);
                    } else {

                    }
                    // itemsInCarts ni qayta generatsiya qilish
                    itemsInCarts = calculatedItems();
                    calculateSum();
                  });
                },
              ),
            ),
          );
        },
      )
          : Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Корзина пуста',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: textSize,
                color: ColorConstants.primaryColor,
              ),
            ),
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 24.0),
                child: Text(
                  'Вернуться в каталог',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: textSize,
                    color: ColorConstants.primaryColor,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: itemsInCarts.isNotEmpty
          ? InkWell(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => const ReceiptPage()));
        },
        child: Container(
          height: size.height * 0.1,
          color: ColorConstants.primaryColor.withAlpha(100),
          padding: EdgeInsets.symmetric(horizontal: size.width * 0.02),
          child: Row(
            children: [
              Text(
                'Итого:',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: textSize,
                ),
              ),
              const Spacer(),
              Text(
                NumericServices.formatNumber(sum),
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: textSize,
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
