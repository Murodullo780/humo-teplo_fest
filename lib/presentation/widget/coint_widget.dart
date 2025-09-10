import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:teplo_fest_humo/core/services/numeric_services.dart';

class CointWidget extends StatelessWidget {
  final int count;
  final double size;
  final double space;

  const CointWidget({
    super.key,
    required this.count,
    required this.size,
    required this.space,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: List.generate(NumericServices.maxAmount(count, max: 5), (index) {
        return Padding(
          padding: EdgeInsets.only(left: index * space),
          child: SvgPicture.asset(
            index % 2 == 0 ? 'assets/svg/Humo coin.svg' : 'assets/svg/Humo coin back.svg',
            width: size,
            height: size,
          ),
        );
      }),
    );
  }
}
