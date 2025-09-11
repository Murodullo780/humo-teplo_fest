import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:teplo_fest_humo/core/const/color_constants.dart';
import 'package:teplo_fest_humo/core/util.dart';
import 'package:teplo_fest_humo/presentation/pages/buy_page/buy_page.dart';

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
                    _buildSvgContainer(0.66, 'assets/svg/g16.svg', color: ColorConstants.primaryColor),
                    Row(
                      children: [
                        _buildSvgContainer(0.26, 'assets/svg/Frame 2.svg', quarterTurns: 2),
                      ],
                    ),
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
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: ColorConstants.primaryColor,
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const BuyPage(),
                        ),
                      );
                    },
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: size * 0.014, horizontal: MediaQuery.sizeOf(context).width * 0.13),
                      child: Text(
                        'Продолжить',
                        style: TextStyle(fontSize: size * 0.04, color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
