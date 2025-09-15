import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:teplo_fest_humo/core/const/color_constants.dart';
import 'package:teplo_fest_humo/core/enums.dart';
import 'package:teplo_fest_humo/core/lng.dart';
import 'package:teplo_fest_humo/core/util.dart';
import 'package:teplo_fest_humo/presentation/pages/buy_page/buy_page.dart';
import 'package:teplo_fest_humo/presentation/widget/resizable_widget/resizable_widget.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    // full screen
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 10),
      vsync: this,
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget _buildSvgAsset(String assetPath, {Color? color, int? quarterTurns}) {
    return RotatedBox(
      quarterTurns: quarterTurns ?? 0,
      child: SvgPicture.asset(
        assetPath,
        color: color,
      ),
    );
  }

  Widget _buildSvgContainer(double widthFactor, String assetPath, {Color? color, int? quarterTurns}) {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width * widthFactor,
      child: AspectRatio(
        aspectRatio: 1,
        child: Stack(
          children: [
            _buildSvgAsset(assetPath, color: color, quarterTurns: quarterTurns),
          ],
        ),
      ),
    );
  }

  Widget _buildCenterSvg() {
    Widget svg(String svg, {double? width}) {
      return SvgPicture.asset(svg, color: ColorConstants.primaryColor, width: width ?? size * 0.3);
    }

    return Column(
      spacing: size * 0.013,
      children: [
        svg('assets/svg/teplofest.svg', width: size * 0.4),
        Text(
          '×',
          style: TextStyle(
            fontSize: size * 0.1,
            color: ColorConstants.primaryColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        svg('assets/svg/humo.svg'),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size.height;
    textSize = size * 0.025;
    borderRadius = size * 0.015;
    return Scaffold(
      body: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: const [
                  Color(0xff182c60),
                  Color(0xff18429a),
                ],
                transform: GradientRotation(_controller.value * 2 * 3.14159),
              ),
            ),
            child: child,
          );
        },
        child: Stack(
          children: [
            // Bottom SVG
            Align(
              alignment: Alignment.bottomCenter,
              child: AspectRatio(
                aspectRatio: 1.3,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    _buildSvgAsset('assets/svg/Frame 3.svg', color: Colors.white12),
                  ],
                ),
              ),
            ),
            // Top SVG
            Align(
              alignment: Alignment.topCenter,
              child: AspectRatio(
                aspectRatio: 1.3,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    _buildSvgAsset('assets/svg/Frame 3.svg', quarterTurns: 2, color: Colors.white12),
                  ],
                ),
              ),
            ),
            // Center content
            Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        _buildSvgContainer(0.26, 'assets/svg/Frame 2.svg'),
                      ],
                    ),
                    _buildCenterSvg(),
                    Row(
                      children: [
                        _buildSvgContainer(0.26, 'assets/svg/Frame 2.svg', quarterTurns: 2),
                      ],
                    ),
                    SizedBox(height: size * 0.09),
                  ],
                ),
              ),
            ),
            // bottom button
            Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                height: MediaQuery.sizeOf(context).height * 0.27,
                child: Center(
                  child: ResizableWidget(
                    presentIn2letter: '93',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BuyPage(lng: locale),
                        ),
                      );
                    },
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: ColorConstants.primaryColor,
                        disabledBackgroundColor: ColorConstants.primaryColor,
                      ),
                      onPressed: null,
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: size * 0.014, horizontal: MediaQuery.sizeOf(context).width * 0.13),
                        child: Text(
                          TranslationKeys.continuee.tr(),
                          style: TextStyle(
                              fontSize: size * 0.04, color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            // language buttons
            Align(
              alignment: Alignment.topCenter,
              child: SizedBox(
                height: MediaQuery.sizeOf(context).height * 0.27,
                child: Center(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(1000),
                      color: Colors.white38,
                    ),
                    padding: EdgeInsets.all(10),
                    child: Row(
                      spacing: 10,
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(Lng.values.length, (index) {
                        final bool selected = locale == Lng.values[index];
                        return InkWell(
                          onTap: () => setState(() => locale = Lng.values[index]),
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 100),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(1000),
                              color: selected ? ColorConstants.primaryColor : Colors.transparent,
                            ),
                            padding: EdgeInsets.only(
                              left: selected ? 25 : 20,
                              right: selected ? 30 : 25,
                              top: 10,
                              bottom: 10,
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              spacing: 10,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(1000),
                                  child: SvgPicture.asset(
                                    'assets/svg/${Lng.values[index].shortName}.svg',
                                    width: size * 0.025,
                                  ),
                                ),
                                AnimatedDefaultTextStyle(
                                  duration: const Duration(milliseconds: 300),
                                  style: TextStyle(
                                    color: selected ? Colors.white : Colors.black,
                                    fontWeight: selected ? FontWeight.bold : FontWeight.normal,
                                    fontSize: size * 0.023,
                                  ),
                                  child: Text(Lng.values[index].fullName),
                                ),
                              ],
                            ),
                          ),
                        );
                      }),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
