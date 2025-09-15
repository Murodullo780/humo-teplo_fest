import 'package:flutter/material.dart';
import 'package:teplo_fest_humo/core/services/numeric_services.dart';
import 'package:teplo_fest_humo/core/util.dart';
import 'package:teplo_fest_humo/presentation/pages/cart_page/widgets/cart_item.dart';
import 'package:teplo_fest_humo/presentation/widget/coint_widget.dart';

class BuyItem extends StatelessWidget {
  final String name;
  final int price;
  final String image;
  final Function(int price) onTap;
  final Widget? onTrailing;
  final int count;
  final Function(bool isPlus) onChangePrice;

  const BuyItem({
    super.key,
    required this.name,
    required this.price,
    required this.image,
    required this.onTap,
    this.onTrailing,
    required this.count,
    required this.onChangePrice,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(borderRadius)),
      child: InkWell(
        onTap: () => onTap(price),
        borderRadius: BorderRadius.circular(16),
        child:Row(
          spacing: 24,
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(borderRadius),
                child: Image.asset(image, width: size * 0.1)),
            SizedBox(
                width: (MediaQuery.of(context).size.width - 32) * 0.35,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 4,
                  children: [
                    Text(name,
                        style: Theme.of(context)
                            .textTheme
                            .titleLarge
                            ?.copyWith(fontWeight: FontWeight.bold, fontSize: textSize)),
                    if (onTrailing != null)
                      Row(
                        children: [
                          Text(NumericServices.formatNumber(price),
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium
                                  ?.copyWith(fontWeight: FontWeight.bold, fontSize: textSize)),
                          CointWidget(
                              count: ((price / 20000)).toInt(), size: size * 0.03, space: size * 0.03),
                        ],
                      )
                  ],
                )),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                spacing: 4,
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Text(NumericServices.formatNumber(price),
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium
                                ?.copyWith(fontWeight: FontWeight.bold, fontSize: textSize)),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: CointWidget(
                            count: 1, size: size * 0.03, space: size * 0.03),
                      ),
                    ],
                  ),
                  // count > 0
                  //     ?
                  CartItem(price: price, onChangePrice: onChangePrice, count: count)
                  // :
                  // Padding(
                  //   padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  //   child: CointWidget(count: ((price / 20000)).toInt(), size: size * 0.03, space: size * 0.03),
                  // ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
