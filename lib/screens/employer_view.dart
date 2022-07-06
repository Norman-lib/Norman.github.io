import 'package:flutter/material.dart';
import 'package:gwala/constants/assets.dart';
import 'package:gwala/constants/colors.dart';
import 'package:gwala/constants/text.dart';
import 'package:gwala/globals.dart' as globals;
import 'package:lottie/lottie.dart';

class Employers extends StatelessWidget {
  const Employers({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth >= 950) {
          return const DesktopEmployer();
        } else {
          return const MobileEmployer();
        }
      },
    );
  }
}

class MobileEmployer extends StatelessWidget {
  const MobileEmployer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
    return Stack(
      alignment: Alignment.center,
      children: [
        Positioned(
            height: screenHeight,
            width: screenWidth,
            child: Container(
              color: AppColors.colorPalette['background'],
            )),
        Positioned(
            child: Container(
          height: 650,
          width: 650,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.colorPalette['secondary']),
        )),
        Positioned(
          height: 0.9 * screenHeight,
          width: 0.9 * screenWidth,
          bottom: 0,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                height: 0.24 * screenHeight,
                child: Lottie.asset(AppAssets.employer),
              ),
              Text(
                'How do you, the employer, benefit?',
                style: AppTextStyle.titleStyle2,
                textAlign: TextAlign.center,
              ),
              Container(
                width: 0.9 * screenWidth,
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: AppColors.colorPalette['background'],
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
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    MobileEmployerCard(
                        percentage: '70%', text: globals.employer1),
                    Container(
                        height: 1,
                        width: 0.8 * screenWidth,
                        color: AppColors.colorPalette['dark']),
                    MobileEmployerCard(
                        percentage: '20%', text: globals.employer2),
                    Container(
                        height: 1,
                        width: 0.8 * screenWidth,
                        color: AppColors.colorPalette['dark']),
                    MobileEmployerCard(
                        percentage: '79%', text: globals.employer3),
                    Container(
                        height: 1,
                        width: 0.8 * screenWidth,
                        color: AppColors.colorPalette['dark']),
                    MobileEmployerCard(
                        percentage: '0%', text: globals.employer4),
                  ],
                ),
              ),
              const SizedBox(
                height: 15,
              )
            ],
          ),
        ),
      ],
    );
  }
}

class MobileEmployerCard extends StatelessWidget {
  final String percentage;
  final String text;
  const MobileEmployerCard(
      {Key? key, required this.percentage, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          percentage,
          style: AppTextStyle.titleStyle2,
        ),
        Container(
          width: screenWidth * 0.7,
          alignment: Alignment.center,
          padding: const EdgeInsets.all(15),
          child: Text(
            text,
            style: AppTextStyle.mainStyle,
            textAlign: TextAlign.justify,
          ),
        ),
      ],
    );
  }
}

class DesktopEmployer extends StatelessWidget {
  const DesktopEmployer({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Stack(
      alignment: Alignment.center,
      children: [
        Positioned(
            height: screenHeight,
            width: screenWidth,
            child: Container(color: AppColors.colorPalette['background'])),
        Positioned(
          bottom: screenHeight * 0.5,
          right: screenWidth * 0.52,
          child: Container(
            height: screenHeight,
            width: screenHeight,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.colorPalette['secondary']),
          ),
        ),
        Positioned(
          height: 0.9 * screenHeight,
          width: 0.9 * screenWidth,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 0.3 * screenHeight,
                child: Lottie.asset(AppAssets.employer),
              ),
              Text(
                'How do you, the employer, benefit ?',
                style: AppTextStyle.titleStyle,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  EmployerCard(
                      text: globals.employer1,
                      percentage: '70%',
                      isRight: false,
                      isLeft: true),
                  EmployerCard(
                      text: globals.employer2,
                      percentage: '20%',
                      isRight: false,
                      isLeft: false),
                  EmployerCard(
                      text: globals.employer3,
                      percentage: '79%',
                      isRight: false,
                      isLeft: false),
                  EmployerCard(
                      text: globals.employer4,
                      percentage: '0%',
                      isRight: true,
                      isLeft: false),
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}

class EmployerCard extends StatelessWidget {
  final String percentage;
  final String text;
  final bool isRight;
  final bool isLeft;
  const EmployerCard(
      {Key? key,
      required this.text,
      required this.percentage,
      required this.isRight,
      required this.isLeft})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Stack(
      clipBehavior: Clip.none,
      // fit: StackFit.expand,
      alignment: Alignment.center,
      children: [
        SizedBox(
          height: 0.25 * screenHeight,
          width: 0.2 * screenWidth,
        ),
        Positioned(
            child: Container(
          alignment: Alignment.center,
          height: 0.22 * screenHeight,
          width: 0.2 * screenWidth,
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
              borderRadius: isRight
                  ? const BorderRadius.only(
                      topRight: Radius.circular(20),
                      bottomRight: Radius.circular(20))
                  : isLeft
                      ? const BorderRadius.only(
                          topLeft: Radius.circular(20),
                          bottomLeft: Radius.circular(20))
                      : null,
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
          child: Text(
            text,
            style: AppTextStyle.mainStyleBig,
            textAlign: TextAlign.center,
          ),
        )),
        Positioned(
            top: -30,
            child: Container(
              height: 70,
              width: 120,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.colorPalette['secondary']),
              child: Text(
                percentage,
                style: AppTextStyle.titleStyle,
              ),
            )),
      ],
    );
  }
}
