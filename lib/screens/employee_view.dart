import 'package:flutter/material.dart';
import 'package:gwala/constants/assets.dart';
import 'package:gwala/constants/colors.dart';
import 'package:gwala/constants/text.dart';
import 'package:gwala/globals.dart' as globals;
import 'package:lottie/lottie.dart';

class Employees extends StatelessWidget {
  const Employees({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth >= 1500) {
          return const DesktopEmployee();
        } else if (constraints.maxWidth >= 950) {
          return const TabletEmployee();
        } else {
          return const MobileEmployee();
        }
      },
    );
  }
}

class MobileEmployee extends StatelessWidget {
  const MobileEmployee({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return Stack(
      alignment: Alignment.center,
      children: [
        Positioned(
            child: Container(
          color: AppColors.colorPalette['background'],
        )),
        Positioned(
          bottom: 0,
          height: 0.9 * screenHeight,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                  height: 0.2 * screenHeight,
                  child: Lottie.asset(AppAssets.employees)),
              Text(
                'What do Employees Get ?',
                style: AppTextStyle.titleStyle2,
              ),
              EmployeeCard(
                picture: AppAssets.employee_1,
                text: globals.employees1,
              ),
              EmployeeCard(
                picture: AppAssets.employee_2,
                text: globals.employees2,
              ),
              EmployeeCard(
                picture: AppAssets.employee_3,
                text: globals.employees3,
              ),
              EmployeeCard(
                picture: AppAssets.employee_4,
                text: globals.employees4,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class EmployeeCard extends StatefulWidget {
  final String text;
  final String picture;
  const EmployeeCard({Key? key, required this.picture, required this.text})
      : super(key: key);

  @override
  State<EmployeeCard> createState() => _EmployeeCardState();
}

class _EmployeeCardState extends State<EmployeeCard>
    with SingleTickerProviderStateMixin {
  late AnimationController lottiController;

  @override
  void initState() {
    super.initState();
    lottiController =
        AnimationController(vsync: this, duration: const Duration(seconds: 4));

    lottiController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        lottiController.reset();
      }
    });
  }

  @override
  void dispose() {
    lottiController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: () {
        lottiController.forward();
      },
      child: SizedBox(
        width: 0.9 * screenWidth,
        height: 0.13 * screenHeight,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              width: 0.2 * screenWidth,
              height: double.maxFinite,
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20),
                      bottomLeft: Radius.circular(20)),
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
              child: Lottie.asset(widget.picture,
                  repeat: false,
                  controller: lottiController, onLoaded: (composition) {
                lottiController.forward();
              }),
            ),
            Container(
              alignment: Alignment.center,
              width: 0.6 * screenWidth,
              height: double.maxFinite,
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(20),
                      bottomRight: Radius.circular(20)),
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
                style: AppTextStyle.mainStyle,
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TabletEmployee extends StatelessWidget {
  const TabletEmployee({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Stack(
      alignment: Alignment.center,
      children: [
        Positioned(
          bottom: screenHeight * 0.4,
          left: screenWidth * 0.6,
          child: Container(
            height: screenHeight,
            width: screenHeight,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.colorPalette['secondary']),
          ),
        ),
        Positioned(
          top: screenHeight * 0.7,
          right: screenWidth * 0.5,
          child: Container(
            height: screenHeight,
            width: screenHeight,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.colorPalette['secondary']),
          ),
        ),
        Container(
          height: 0.95 * screenHeight,
          width: double.maxFinite,
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                  height: 0.3 * screenHeight,
                  child: Lottie.asset(AppAssets.employees)),
              SizedBox(
                height: 0.005 * screenHeight,
              ),
              Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Text('What do Employees Get ?',
                    textAlign: TextAlign.center,
                    style: AppTextStyle.titleStyle3),
              ),
              SizedBox(
                height: 0.005 * screenHeight,
              ),
              SizedBox(
                width: 0.9 * screenWidth,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    EmployeeColumnTop(
                      text: globals.employees1,
                      picture: AppAssets.employee_1,
                    ),
                    EmployeeColumnBottom(
                      text: globals.employees2,
                      picture: AppAssets.employee_2,
                    ),
                    EmployeeColumnTop(
                        text: globals.employees3,
                        picture: AppAssets.employee_3),
                    EmployeeColumnBottom(
                        text: globals.employees4, picture: AppAssets.employee_4)
                  ],
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}

class DesktopEmployee extends StatelessWidget {
  const DesktopEmployee({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Stack(
      alignment: Alignment.center,
      children: [
        Positioned(
            top: 0,
            left: 0,
            bottom: 0,
            right: 0,
            child: Container(
              color: AppColors.colorPalette['background'],
            )),
        Positioned(
          bottom: screenHeight * 0.4,
          left: screenWidth * 0.6,
          child: Container(
            height: screenHeight,
            width: screenHeight,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.colorPalette['secondary']),
          ),
        ),
        Positioned(
          top: screenHeight * 0.7,
          right: screenWidth * 0.5,
          child: Container(
            height: screenHeight,
            width: screenHeight,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.colorPalette['secondary']),
          ),
        ),
        Container(
          height: 0.9 * screenHeight,
          width: 0.9 * screenWidth,
          alignment: Alignment.center,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // left side
              SizedBox(
                height: 0.65 * screenHeight,
                width: 0.25 * screenWidth,
                child: Column(children: [
                  Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Text('What do Employees Get ?',
                        textAlign: TextAlign.left,
                        style: AppTextStyle.titleStyle3),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Container(
                      alignment: Alignment.centerLeft,
                      child: Lottie.asset(AppAssets.employees)),
                ]),
              ),
              // right side
              Container(
                alignment: Alignment.center,
                child: Row(
                  children: [
                    EmployeeColumnTop(
                      text: globals.employees1,
                      picture: AppAssets.employee_1,
                    ),
                    const SizedBox(
                      width: 40,
                    ),
                    EmployeeColumnBottom(
                      text: globals.employees2,
                      picture: AppAssets.employee_2,
                    ),
                    const SizedBox(
                      width: 40,
                    ),
                    EmployeeColumnTop(
                        text: globals.employees3,
                        picture: AppAssets.employee_3),
                    const SizedBox(
                      width: 40,
                    ),
                    EmployeeColumnBottom(
                        text: globals.employees4, picture: AppAssets.employee_4)
                  ],
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}

class EmployeeColumnTop extends StatefulWidget {
  final String text;
  final String picture;
  const EmployeeColumnTop({Key? key, required this.text, required this.picture})
      : super(key: key);

  @override
  State<EmployeeColumnTop> createState() => _EmployeeColumnTopState();
}

class _EmployeeColumnTopState extends State<EmployeeColumnTop>
    with SingleTickerProviderStateMixin {
  final double width = 190;
  final double height = 450;
  double textHeight = 255;
  double imgHeight = 175;

  late AnimationController lottiController;

  @override
  void initState() {
    super.initState();

    lottiController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 4000));

    lottiController.addStatusListener((status) async {
      if (status == AnimationStatus.completed) {
        lottiController.reset();
      }
    });
  }

  @override
  void dispose() {
    lottiController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
        onEnter: (event) {
          setState(() {
            textHeight = 175;
            imgHeight = 255;
            lottiController.forward();
          });
        },
        onExit: (event) {
          setState(() {
            textHeight = 255;
            imgHeight = 175;
          });
        },
        child: SizedBox(
          width: width,
          height: height,
          child: Column(children: [
            // text container
            AnimatedContainer(
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeInOutSine,
              height: textHeight,
              padding: const EdgeInsets.all(15),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30)),
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
                textAlign: TextAlign.center,
                style: AppTextStyle.mainStyleBold,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            // image container
            AnimatedContainer(
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeInOutSine,
              height: imgHeight,
              padding: const EdgeInsets.all(15),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.only(
                      bottomRight: Radius.circular(30),
                      bottomLeft: Radius.circular(30)),
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
              child: Lottie.asset(widget.picture,
                  repeat: false,
                  controller: lottiController, onLoaded: (composition) {
                lottiController.forward();
              }),
            ),
          ]),
        ));
  }
}

class EmployeeColumnBottom extends StatefulWidget {
  final String text;
  final String picture;
  const EmployeeColumnBottom(
      {Key? key, required this.text, required this.picture})
      : super(key: key);

  @override
  State<EmployeeColumnBottom> createState() => _EmployeeColumnBottomState();
}

class _EmployeeColumnBottomState extends State<EmployeeColumnBottom>
    with SingleTickerProviderStateMixin {
  final double width = 190;
  final double height = 450;
  double textHeight = 255;
  double imgHeight = 175;

  late AnimationController lottiController;

  @override
  void initState() {
    super.initState();

    lottiController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 4000));

    lottiController.addStatusListener((status) async {
      if (status == AnimationStatus.completed) {
        lottiController.reset();
      }
    });
  }

  @override
  void dispose() {
    lottiController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
        onEnter: (event) {
          setState(() {
            textHeight = 175;
            imgHeight = 255;
            lottiController.forward();
          });
        },
        onExit: (event) {
          setState(() {
            textHeight = 255;
            imgHeight = 175;
          });
        },
        child: SizedBox(
          width: width,
          height: height,
          child: Column(children: [
            // image container
            AnimatedContainer(
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeInOutSine,
                height: imgHeight,
                padding: const EdgeInsets.all(15),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30)),
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
                child: Lottie.asset(widget.picture,
                    repeat: false,
                    controller: lottiController, onLoaded: (composition) {
                  lottiController.forward();
                })),
            const SizedBox(
              height: 20,
            ),
            // text container
            AnimatedContainer(
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeInOutSine,
              height: textHeight,
              padding: const EdgeInsets.all(15),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30)),
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
                textAlign: TextAlign.center,
                style: AppTextStyle.mainStyleBold,
              ),
            ),
          ]),
        ));
  }
}
