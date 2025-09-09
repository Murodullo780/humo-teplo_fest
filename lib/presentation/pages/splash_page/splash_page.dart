import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter, colors: [
          Color(0xff1C3574),
          Color(0xff1D3F86),
        ])),
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                AspectRatio(
                  aspectRatio: 1.3,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      SvgPicture.asset('assets/svg/Frame 3.svg', color: Colors.white12,),
                    ],
                  ),
                ),
              ],
            ),
            Column(
              children: [
                AspectRatio(
                  aspectRatio: 1.3,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      RotatedBox(
                          quarterTurns: 2,
                          child: SvgPicture.asset('assets/svg/Frame 3.svg', color: Colors.white12,)),
                    ],
                  ),
                ),
              ],
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        SizedBox(
                          width: MediaQuery.sizeOf(context).width * 0.26,
                          child: AspectRatio(
                            aspectRatio: 1,
                            child: Stack(
                              children: [
                                SvgPicture.asset(
                                  'assets/svg/Frame 2.svg',
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: MediaQuery.sizeOf(context).width * 0.66,
                      child: AspectRatio(
                        aspectRatio: 1,
                        child: Stack(
                          children: [
                            SvgPicture.asset(
                              'assets/svg/g16.svg',
                              color: Color(0xffE3C269),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: MediaQuery.sizeOf(context).width * 0.26,
                          child: AspectRatio(
                            aspectRatio: 1,
                            child: Stack(
                              children: [
                                RotatedBox(
                                  quarterTurns: 2,
                                  child: SvgPicture.asset(
                                    'assets/svg/Frame 2.svg',
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
