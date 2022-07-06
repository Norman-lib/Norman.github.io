import 'package:flutter/material.dart';
import 'package:gwala/constants/assets.dart';
import 'package:gwala/constants/colors.dart';
import 'package:gwala/constants/text.dart';
import 'package:gwala/globals.dart' as globals;
import 'package:lottie/lottie.dart';

class ThirdView extends StatelessWidget {
  const ThirdView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth >= 900) {
          return const DesktopThird();
        } else {
          return const MobileThird();
        }
      },
    );
  }
}

class MobileThird extends StatelessWidget {
  const MobileThird({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: globals.toolBarHeight),
      color: AppColors.colorPalette['background'],
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            "Why Gwala",
            style: AppTextStyle.titleStyle2,
          ),
          WhyGwalaCardHorizontal(
            lottie: AppAssets.wallet1,
            text: globals.whyGwala1,
          ),
          WhyGwalaCardHorizontal(
            lottie: AppAssets.money1,
            text: globals.whyGwala2,
          ),
          WhyGwalaCardHorizontal(
            lottie: AppAssets.interest,
            text: globals.whyGwala3,
          )
        ],
      ),
    );
  }
}

class DesktopThird extends StatefulWidget {
  const DesktopThird({Key? key}) : super(key: key);

  @override
  State<DesktopThird> createState() => _DesktopThirdState();
}

class _DesktopThirdState extends State<DesktopThird>
    with SingleTickerProviderStateMixin {
  late AnimationController lottieController;
  double coeff = 0.7;
  TextStyle style = AppTextStyle.mainStyle;

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    double workHeight = 0.6 * screenHeight;
    double workWidth = 0.8 * screenWidth;

    return Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Text(
        "Why Gwala",
        style: AppTextStyle.titleStyle,
      ),
      SizedBox(
        height: workHeight * 0.01,
      ),
      Container(
        clipBehavior: Clip.hardEdge,
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Color.fromARGB(255, 232, 232, 232),
                offset: Offset(6, 6),
                blurRadius: 15,
                spreadRadius: 1,
              ),
            ]),
        width: workWidth,
        height: workHeight,
        child: Row(
          children: [
            WhyGwalaCard(
              lottie: AppAssets.wallet1,
              text: globals.whyGwala1,
            ),
            Container(
              decoration: const BoxDecoration(boxShadow: [
                BoxShadow(
                  color: Color.fromARGB(255, 223, 223, 223),
                  offset: Offset(0, 0),
                  blurRadius: 15,
                  spreadRadius: 1,
                )
              ]),
              child: WhyGwalaCard(
                lottie: AppAssets.money1,
                text: globals.whyGwala2,
              ),
            ),
            Container(
              decoration: const BoxDecoration(boxShadow: [
                BoxShadow(
                  color: Color.fromARGB(255, 223, 223, 223),
                  offset: Offset(0, 0),
                  blurRadius: 15,
                  spreadRadius: 1,
                )
              ]),
              child: WhyGwalaCard(
                lottie: AppAssets.interest,
                text: globals.whyGwala3,
              ),
            )
          ],
        ),
      ),
    ]));
  }
}

class WhyGwalaCardHorizontal extends StatefulWidget {
  final String text;
  final String lottie;
  const WhyGwalaCardHorizontal({
    Key? key,
    required this.lottie,
    required this.text,
  }) : super(key: key);

  @override
  State<WhyGwalaCardHorizontal> createState() => _WhyGwalaCardHorizontalState();
}

class _WhyGwalaCardHorizontalState extends State<WhyGwalaCardHorizontal>
    with SingleTickerProviderStateMixin {
  late AnimationController lottieController;
  TextStyle style = AppTextStyle.mainStyle;
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return MouseRegion(
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            height: screenHeight * 0.2,
            width: screenHeight * 0.2,
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey[500]!,
                    offset: const Offset(4, 4),
                    blurRadius: 15,
                    spreadRadius: 1,
                  ),
                  const BoxShadow(
                    color: Colors.white,
                    offset: Offset(-4, -4),
                    blurRadius: 15,
                    spreadRadius: 1,
                  ),
                ]),
            child: Center(
              child: Lottie.asset(widget.lottie,
                  animate: false,),
            )),
        AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          height: screenHeight * 0.2,
          width: screenWidth * 0.5,
          alignment: Alignment.center,
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey[500]!,
                  offset: const Offset(4, 4),
                  blurRadius: 15,
                  spreadRadius: 1,
                ),
                const BoxShadow(
                  color: Colors.white,
                  offset: Offset(-4, -4),
                  blurRadius: 15,
                  spreadRadius: 1,
                ),
              ]),
          child: Text(
            widget.text,
            style: style,
            textAlign: TextAlign.center,
          ),
        )
      ]),
    );
  }
}

class WhyGwalaCard extends StatefulWidget {
  final String text;
  final String lottie;
  const WhyGwalaCard({
    Key? key,
    required this.lottie,
    required this.text,
  }) : super(key: key);

  @override
  State<WhyGwalaCard> createState() => _WhyGwalaCardState();
}

class _WhyGwalaCardState extends State<WhyGwalaCard>
    with SingleTickerProviderStateMixin {
  late AnimationController lottieController;
  double coeff = 0.7;
  TextStyle style = AppTextStyle.mainStyle;
  @override
  void initState() {
    super.initState();

    lottieController = AnimationController(
      vsync: this,
    );
    lottieController.addStatusListener((status) async {
      if (status == AnimationStatus.completed) {
        lottieController.reset();
      }
    });
  }

  @override
  void dispose() {
    lottieController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    double workHeight = 0.6 * screenHeight;
    double workWidth = 0.8 * screenWidth;
    return MouseRegion(
      onEnter: (event) {
        setState(() {
          coeff = 0.65;
          style = AppTextStyle.mainStyleBold;
          lottieController.forward();
        });
      },
      onExit: (event) {
        setState(() {
          style = AppTextStyle.mainStyle;
          coeff = 0.7;
          lottieController.reset();
        });
      },
      child: Column(children: [
        AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            width: workWidth / 3,
            height: workHeight * coeff,
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 240, 250, 255),
            ),
            child: Center(
              child: Lottie.asset(widget.lottie,
                  controller: lottieController,
                  repeat: false, onLoaded: (composition) {
                lottieController.duration = composition.duration;
                lottieController.forward();
              }),
            )),
        AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            height: workHeight * (1 - coeff),
            width: workWidth / 3,
            padding: const EdgeInsets.all(10),
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
            child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                width: (workWidth / 3) * 0.8,
                height: workHeight * (1 - coeff),
                child: Center(
                  child: Text(
                    widget.text,
                    style: style,
                    textAlign: TextAlign.center,
                  ),
                )))
      ]),
    );
  }
}
