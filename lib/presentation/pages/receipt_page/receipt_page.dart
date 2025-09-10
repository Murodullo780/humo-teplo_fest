import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:teplo_fest_humo/core/const/color_constants.dart';
import 'package:teplo_fest_humo/core/services/numeric_services.dart';
import 'package:teplo_fest_humo/core/util.dart';
import 'package:teplo_fest_humo/data/models/priz_model.dart';

class ReceiptPage extends StatefulWidget {
  const ReceiptPage({super.key});

  @override
  State<ReceiptPage> createState() => _ReceiptPageState();
}

class _ReceiptPageState extends State<ReceiptPage> {
  ValueNotifier<int> backNotifier = ValueNotifier(10);
  List<PrizModel> prizList = items.where((element) => element.count > 0).toList();
  double total = 0;
  Timer? _timer;

  void _pop() {
    items = itemsClone;
    setState(() {});
    Navigator.pop(context);
    Navigator.pop(context);
    Navigator.pop(context);
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
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      _back();
    });
    total = prizList.fold(0, (previousValue, element) => previousValue + element.price * element.count);
    super.initState();
  }

  Widget _item(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        spacing: 8,
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
            'Чек',
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
              spacing: 24,
              children: [
                ClipPath(
                  clipper: TicketClipper(),
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: size.width * 0.05),
                    padding: EdgeInsets.all(24),
                    color: Colors.white,
                    child: Column(
                      children: [
                        _item('Дата регистрации', DateServices.formatDateTime(DateTime.now())),
                        _item('Номер чека', '123456789'),
                        _item('Кассир', 'Киоск 1'),
                        Divider(
                          thickness: 2,
                        ),
                        _item('Товары', '${prizList.length}'),
                        ...List.generate(
                            prizList.length,
                            (index) => Container(
                                  decoration: BoxDecoration(
                                    border: Border(
                                      top: index == 0
                                          ? BorderSide.none
                                          : BorderSide(
                                              color: Colors.black,
                                              width: 2,
                                            ),
                                    ),
                                  ),
                                  padding: const EdgeInsets.symmetric(horizontal: 18.0),
                                  child: _item(prizList[index].name,
                                      '${prizList[index].count} x ${NumericServices.formatNumber(prizList[index].price)}'),
                                )),
                        Divider(
                          thickness: 2,
                        ),
                        _item('Итого', NumericServices.formatNumber(total.toInt())),
                      ],
                    ),
                  ),
                ),
                Text('Призы можете взять у прилавки',
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium
                        ?.copyWith(fontWeight: FontWeight.bold, fontSize: textSize / 1.3)),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: InkWell(
        onTap: () => _pop(),
        child: Container(
          height: size.height * 0.1,
          color: ColorConstants.primaryColor.withAlpha(100),
          padding: EdgeInsets.symmetric(horizontal: size.width * 0.02),
          child: Center(
            child: ValueListenableBuilder(
                valueListenable: backNotifier,
                builder: (context, value, child) {
                  return Text('Вернуться на главную ($value)',
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium
                          ?.copyWith(fontWeight: FontWeight.bold, fontSize: textSize));
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
    // Увеличиваем количество сегментов для более мелкого зигзага
    int segments = 120;
    double segmentWidth = size.width / segments;
    // Уменьшаем амплитуду зубцов
    double amplitude = 5.0;
    var path = Path();

    // Начинаем с верхнего левого угла
    path.moveTo(0, 0);

    // Верхняя сторона с зигзагом (слева направо)
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

    // Правая сторона: идём вниз до нижнего правого угла
    path.lineTo(size.width, size.height);

    // Нижняя сторона с зигзагом (справа налево)
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

    // Левая сторона: возвращаемся в верхний левый угол
    path.lineTo(0, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
