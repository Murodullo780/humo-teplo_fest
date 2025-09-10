import 'package:flutter/material.dart';
import 'package:teplo_fest_humo/core/util.dart';

class CartItem extends StatelessWidget {
  final int price;
  final int count;
  final Function(bool isPlus) onChangePrice;

  const CartItem({super.key, required this.price, required this.onChangePrice, required this.count});

  @override
  Widget build(BuildContext context) {
    return Row(spacing: 16, children: [
      IconButton(
        onPressed: () => onChangePrice(false),
        icon: Icon(
          Icons.remove,
          color: Colors.red,
          size: size * 0.03,
        ),
      ),
      Text(
        count.toString(),
        style: Theme.of(context).textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
              fontSize: textSize / 1.5,
            ),
      ),
      IconButton(
        onPressed: () => onChangePrice(true),
        icon: Icon(
          Icons.add,
          color: Colors.green,
          size: size * 0.03,
        ),
      ),
    ]);
  }
}
