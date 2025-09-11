import 'package:flutter/material.dart';
import 'package:teplo_fest_humo/core/const/color_constants.dart';
import 'package:teplo_fest_humo/core/services/numeric_services.dart';
import 'package:teplo_fest_humo/core/util.dart';
import 'package:teplo_fest_humo/data/models/priz_model.dart';
import 'package:teplo_fest_humo/presentation/pages/buy_page/widgets/buy_item.dart';
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
      sum += item.price * item.count;
    }
  }

  void updateCart() {
    setState(() {
      itemsInCarts = items.where((element) => element.count > 0).toList();
      calculateSum();
    });
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
            count: itemsInCarts[index].count,
            onTap: (price) {},
            onChangePrice: (isPlus) {
              // Find the corresponding item in the global `items` list
              final globalIndex = items.indexWhere((item) => item == itemsInCarts[index]);
              if (globalIndex != -1) {
                if (isPlus) {
                  items[globalIndex] = items[globalIndex].copyWith(count: items[globalIndex].count + 1);
                } else if (items[globalIndex].count > 0) {
                  items[globalIndex] = items[globalIndex].copyWith(count: items[globalIndex].count - 1);
                }
                updateCart(); // Update itemsInCarts and recalculate sum
              }
            },
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