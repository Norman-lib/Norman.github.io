import 'package:flutter/material.dart';
import 'package:gwala/constants/assets.dart';
import 'package:gwala/constants/colors.dart';
import 'package:gwala/constants/text.dart';
import 'package:gwala/globals.dart' as globals;
import 'package:lottie/lottie.dart';

class Steps extends StatelessWidget {
  const Steps({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth >= 1100) {
          return const DesktopSteps();
        } else {
          return const MobileSteps();
        }
      },
    );
  }
}

class DesktopSteps extends StatefulWidget {
  const DesktopSteps({Key? key}) : super(key: key);

  @override
  State<DesktopSteps> createState() => _DesktopStepsState();
}

class _DesktopStepsState extends State<DesktopSteps> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Stack(
      alignment: Alignment.center,
      children: [
        Positioned(
            top: 0,
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              color: AppColors.colorPalette['secondary'],
            )),
        Positioned(
            top: 0,
            bottom: 0,
            right: -300,
            child: Container(
              width: 700,
              decoration: const BoxDecoration(
                  shape: BoxShape.circle, color: Colors.white),
            )),
        Positioned(
            top: 0,
            bottom: 0,
            left: -300,
            child: Container(
              width: 700,
              decoration: const BoxDecoration(
                  shape: BoxShape.circle, color: Colors.white),
            )),
        SizedBox(
          height: height,
          width: width,
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Lottie.asset(AppAssets.gears, height: 0.2 * height),
                  Text(
                    'How it Works',
                    style: AppTextStyle.titleStyle,
                  ),
                ]),
                Text(
                  'Find Out How You Can Benefit From Our Service',
                  textAlign: TextAlign.center,
                  style: AppTextStyle.titleStyle2,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    StepsCard(
                        title: 'Step 1',
                        content: globals.step1,
                        height: 0.3 * height,
                        width: 0.18 * width),
                    Lottie.asset(AppAssets.line, width: 0.05 * width),
                    StepsCard(
                        title: 'Step 2',
                        content: globals.step2,
                        height: 0.3 * height,
                        width: 0.18 * width),
                    Lottie.asset(AppAssets.line, width: 0.05 * width),
                    StepsCard(
                        title: 'Step 3',
                        content: globals.step3,
                        height: 0.3 * height,
                        width: 0.18 * width),
                    Lottie.asset(AppAssets.line, width: 0.05 * width),
                    StepsCard(
                        title: 'Step 4',
                        content: globals.step4,
                        height: 0.3 * height,
                        width: 0.18 * width),
                  ],
                )
              ]),
        ),
      ],
    );
  }
}

class StepsCard extends StatelessWidget {
  final String title;
  final String content;
  final double width;
  final double height;
  const StepsCard(
      {Key? key,
      required this.title,
      required this.content,
      required this.height,
      required this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
        Container(
          height: 50,
          width: width * 0.4,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: AppColors.colorPalette['secondary'],
              boxShadow: [
                BoxShadow(
                  color: Colors.grey[500]!,
                  offset: const Offset(4, 4),
                  blurRadius: 15,
                  spreadRadius: 1,
                ),
                const BoxShadow(
                  color: Color.fromARGB(255, 236, 236, 236),
                  offset: Offset(-4, -4),
                  blurRadius: 15,
                  spreadRadius: 1,
                ),
              ]),
          child: Text(
            title,
            style: AppTextStyle.mainStyleBold,
            textAlign: TextAlign.center,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Expanded(
            child: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: AppColors.colorPalette['secondary'],
              boxShadow: [
                BoxShadow(
                  color: Colors.grey[500]!,
                  offset: const Offset(4, 4),
                  blurRadius: 15,
                  spreadRadius: 1,
                ),
                const BoxShadow(
                  color: Color.fromARGB(255, 236, 236, 236),
                  offset: Offset(-4, -4),
                  blurRadius: 15,
                  spreadRadius: 1,
                ),
              ]),
          child: Text(
            content,
            style: AppTextStyle.descriptionStyle,
            textAlign: TextAlign.center,
          ),
        ))
      ]),
    );
  }
}

class MobileSteps extends StatelessWidget {
  const MobileSteps({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          height: height,
          width: width,
          color: AppColors.colorPalette['secondary'],
        ),
        Positioned(
            bottom: -300,
            child: Container(
              height: 650,
              width: 650,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.colorPalette['background']),
            )),
        Positioned(
            top: -300,
            child: Container(
              height: 600,
              width: 600,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.colorPalette['background']),
            )),
        Positioned(
          height: 0.9 * height,
          bottom: 0,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                'How it Works',
                style: AppTextStyle.titleStyle2,
              ),
              MobileStepsCard(number: '1', content: globals.step1),
              MobileStepsCard(number: '2', content: globals.step2),
              MobileStepsCard(number: '3', content: globals.step3),
              MobileStepsCard(number: '4', content: globals.step4),
            ],
          ),
        ),
      ],
    );
  }
}

class MobileStepsCard extends StatelessWidget {
  final String number;
  final String content;
  const MobileStepsCard({Key? key, required this.content, required this.number})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    return SizedBox(
      width: 0.85 * width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(10),
            height: 0.12 * height,
            width: 0.7 * width,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey[500]!,
                    offset: const Offset(4, 4),
                    blurRadius: 15,
                    spreadRadius: 1,
                  ),
                  const BoxShadow(
                    color: Color.fromARGB(255, 236, 236, 236),
                    offset: Offset(-4, -4),
                    blurRadius: 15,
                    spreadRadius: 1,
                  ),
                ],
                color: AppColors.colorPalette['secondary']),
            child: Text(
              content,
              style: AppTextStyle.mainStyle,
              textAlign: TextAlign.center,
            ),
          ),
          Container(
            alignment: Alignment.center,
            height: 0.12 * height,
            width: 0.11 * width,
            decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey[500]!,
                    offset: const Offset(4, 4),
                    blurRadius: 15,
                    spreadRadius: 1,
                  ),
                  const BoxShadow(
                    color: Color.fromARGB(255, 236, 236, 236),
                    offset: Offset(-4, -4),
                    blurRadius: 15,
                    spreadRadius: 1,
                  ),
                ],
                borderRadius: BorderRadius.circular(10),
                color: AppColors.colorPalette['light']),
            child: Text(
              number,
              style: AppTextStyle.titleStyle2,
            ),
          ),
        ],
      ),
    );
  }
}
