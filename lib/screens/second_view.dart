import 'package:flutter/material.dart';
import 'package:gwala/constants/assets.dart';
import 'package:gwala/constants/text.dart';
import 'package:lottie/lottie.dart';

class WhatGwala extends StatelessWidget {
  const WhatGwala({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth >= 1500) {
          return const DesktopWhatGwala();
        } else if (constraints.maxWidth >= 800) {
          return const PhoneWhatGwala();
        } else {
          return const PhoneWhatGwala();
        }
      },
    );
  }
}

class PhoneWhatGwala extends StatefulWidget {
  const PhoneWhatGwala({Key? key}) : super(key: key);

  @override
  State<PhoneWhatGwala> createState() => _PhoneWhatGwalaState();
}

class _PhoneWhatGwalaState extends State<PhoneWhatGwala> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    double workHeight = 0.6 * screenHeight;
    double workWidth = 0.5 * screenWidth;
    return Center(
      child: Container(
          clipBehavior: Clip.hardEdge,
          decoration: const BoxDecoration(
              //color: Color.fromARGB(255, 242, 248, 253),
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(20)),
              boxShadow: [
                BoxShadow(
                  color: Color.fromARGB(255, 232, 232, 232),
                  offset: Offset(6, -6),
                  blurRadius: 15,
                  spreadRadius: 1,
                ),
              ]),
          height: workHeight * 1.3,
          width: 1.9 * workWidth,
          child: Center(
              child: Column(children: [
            Container(
                decoration: const BoxDecoration(
                    //color: Color.fromARGB(255, 230, 244, 255),
                    color: Color.fromARGB(255, 242, 248, 253),
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromARGB(255, 226, 226, 226),
                        offset: Offset(3, 0),
                        blurRadius: 5,
                      )
                    ]),
                height: workHeight * 0.4,
                width: 1.9 * workWidth,
                child: Center(
                    child: Wrap(children: [
                  SizedBox(
                    width: 0.056 * workWidth,
                  ),
                  Wrap(children: [
                    SizedBox(
                      width: 1.9 * workWidth,
                      child: Text(
                        "What is Gwala",
                        style: AppTextStyle.titleStyle,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    SizedBox(
                      width: 1.9 * workWidth,
                      child: Text(
                        "Gwala is a suite of financial tools that enable financial wellness for employees across Africa and Latin America.",
                        style: AppTextStyle.descriptionStyleBold,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ])
                ]))),
            SizedBox(
              width: 0.05 * workWidth,
            ),
            Column(children: [
              SizedBox(
                height: 0.03 * workHeight,
              ),
              Row(
                children: [
                  ////////////////////
                  //first row widgets
                  ////////////////////
                  WhatCardPhone(
                    lottie: AppAssets.salary,
                    title: "Early salary access",
                    subtitle:
                        "allows employees to access their earned wages instantly, before the regular payday",
                    width: workWidth * 0.9,
                  ),
                  SizedBox(
                    width: 0.1 * workWidth,
                  ),
                  ////////////////////
                  // second row widgets
                  ////////////////////
                  WhatCardPhone(
                      lottie: AppAssets.buy,
                      title: "Buy Now, Pay Later",
                      subtitle:
                          "allows employees to split payments into four monthly installments",
                      width: workWidth * 0.9)
                ],
              ),
              SizedBox(
                height: workHeight * 0.03,
              ),
              Text(
                "Our service is free for businesses, and we front all the money",
                style: AppTextStyle.descriptionStyleBoldPhone,
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: workHeight * 0.01,
              ),
              SizedBox(
                width: workWidth * 1.8,
                child: Text(
                  "With Gwala, you are guaranteed better cashflow support and happier, more productive employees",
                  style: AppTextStyle.descriptionStyleBoldPhone,
                  textAlign: TextAlign.center,
                ),
              ),
            ])
          ]))),
    );
  }
}

class DesktopWhatGwala extends StatefulWidget {
  const DesktopWhatGwala({Key? key}) : super(key: key);

  @override
  State<DesktopWhatGwala> createState() => _DesktopWhatGwalaState();
}

class _DesktopWhatGwalaState extends State<DesktopWhatGwala> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    double workHeight = 0.5 * screenHeight;
    double workWidth = 0.4 * screenWidth;

    return Center(
        child: Container(
      decoration: const BoxDecoration(
          //color: Color.fromARGB(255, 242, 248, 253),
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(20)),
          boxShadow: [
            BoxShadow(
              color: Color.fromARGB(255, 232, 232, 232),
              offset: Offset(6, 6),
              blurRadius: 15,
              spreadRadius: 1,
            ),
          ]),
      height: workHeight * 1.4,
      width: 1.9 * workWidth,
      child: Center(
          child: Row(children: [
        Container(
            decoration: const BoxDecoration(
                //color: Color.fromARGB(255, 230, 244, 255),
                color: Color.fromARGB(255, 242, 248, 253),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    bottomLeft: Radius.circular(20)),
                boxShadow: [
                  BoxShadow(
                    color: Color.fromARGB(255, 241, 241, 241),
                    offset: Offset(3, 0),
                    blurRadius: 5,
                  )
                ]),
            height: workHeight * 1.4,
            width: workWidth * 0.8,
            child: Center(
                child: Wrap(children: [
              SizedBox(
                width: 0.056 * workWidth,
              ),
              Wrap(children: [
                Text(
                  "What is Gwala",
                  style: AppTextStyle.titleStyle,
                  textAlign: TextAlign.left,
                ),
                const SizedBox(
                  height: 6,
                ),
                SizedBox(
                  width: workWidth * 0.7,
                  child: Text(
                    "Gwala is a suite of financial tools that enable financial wellness for employees across Africa and Latin America.",
                    style: AppTextStyle.descriptionStyleBold,
                    textAlign: TextAlign.left,
                  ),
                ),
              ])
            ]))),
        SizedBox(
          width: 0.05 * workWidth,
        ),
        Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Wrap(
            alignment: WrapAlignment.spaceEvenly,
            children: const [
              ////////////////////
              //first row widgets
              ////////////////////
              WhatCard(
                  lottie: AppAssets.salary,
                  title: "Early salary access",
                  subtitle:
                      "allows employees to access their earned wages instantly, before the regular payday"),

              ////////////////////
              // second row widgets
              ////////////////////
              WhatCard(
                  lottie: AppAssets.buy,
                  title: "Buy Now, Pay Later",
                  subtitle:
                      "allows employees to split payments into four monthly installments")
            ],
          ),
          SizedBox(
            width: 0.05 * workWidth,
          ),
          Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            SizedBox(
              height: workHeight * 0.1,
            ),
            Text(
              "Our service is free for businesses, and we front all the money",
              style: AppTextStyle.descriptionStyleBold,
            ),
            SizedBox(
              height: workHeight * 0.03,
            ),
            SizedBox(
              width: workWidth * 1,
              child: Text(
                "With Gwala, you are guaranteed better cashflow support and happier, more productive employees",
                style: AppTextStyle.descriptionStyleBold,
                textAlign: TextAlign.center,
              ),
            ),
          ])
        ])
      ])),
    ));
  }
}

class WhatCard extends StatefulWidget {
  final String title;
  final String subtitle;
  final String lottie;

  const WhatCard({
    Key? key,
    required this.lottie,
    required this.title,
    required this.subtitle,
  }) : super(key: key);

  @override
  State<WhatCard> createState() => _WhatCardState();
}

class _WhatCardState extends State<WhatCard>
    with SingleTickerProviderStateMixin {
  late AnimationController lottieController1;
  TextStyle style1 = SecondViewStyles.icontitle;
  TextStyle style2 = SecondViewStyles.iconsubtitle;
  double coeff1 = 0.35;
  @override
  void initState() {
    super.initState();

    lottieController1 = AnimationController(
      vsync: this,
    );

    lottieController1.addStatusListener((status) async {
      if (status == AnimationStatus.completed) {
        lottieController1.reset();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    double workHeight = 0.5 * screenHeight;
    double workWidth = 0.4 * screenWidth;
    const Color iconColor = Color.fromARGB(255, 241, 241, 241);
    return Column(children: [
      MouseRegion(
          onEnter: (event) {
            setState(() {
              lottieController1.forward();
              style1 = SecondViewStyles.icontitlebig;
              style2 = SecondViewStyles.iconsubtitlebig;
              coeff1 = 0.5;
            });
          },
          onExit: (event) {
            setState(() {
              lottieController1.reset();
              style1 = SecondViewStyles.icontitle;
              style2 = SecondViewStyles.iconsubtitle;
              coeff1 = 0.45;
            });
          },
          child: Container(
              color: Colors.transparent,
              width: workWidth * 0.5,
              child: Column(children: [
                AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    width: workWidth * coeff1,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: iconColor,
                    ),
                    padding: const EdgeInsets.all(10),
                    height: coeff1 * workHeight,
                    child: Lottie.asset(widget.lottie,
                        repeat: false,
                        controller: lottieController1, onLoaded: (composition) {
                      lottieController1.duration = composition.duration;
                      lottieController1.forward();
                    })),
                SizedBox(
                  height: workHeight * 0.05,
                ),
                Text(
                  widget.title,
                  style: style1,
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: workHeight * 0.03,
                ),
                SizedBox(
                    width: workWidth * 0.4,
                    child: Text(
                      widget.subtitle,
                      style: style2,
                      textAlign: TextAlign.center,
                    ))
              ])))
    ]);
  }
}

class WhatCardPhone extends StatefulWidget {
  final String title;
  final String subtitle;
  final String lottie;
  final double width;

  const WhatCardPhone(
      {Key? key,
      required this.lottie,
      required this.title,
      required this.subtitle,
      required this.width})
      : super(key: key);

  @override
  State<WhatCardPhone> createState() => _WhatCardPhoneState();
}

class _WhatCardPhoneState extends State<WhatCardPhone> {
  TextStyle style1 = SecondViewStyles.icontitle;
  TextStyle style2 = SecondViewStyles.iconsubtitle;
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double workHeight = 0.5 * screenHeight;
    const Color iconColor = Color.fromARGB(255, 241, 241, 241);
    return Container(
        color: Colors.transparent,
        width: widget.width,
        child: Column(children: [
          Container(
              width: widget.width * 0.6,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: iconColor,
              ),
              padding: const EdgeInsets.all(10),
              height: widget.width * 0.6,
              child: Lottie.asset(
                widget.lottie,
                animate: false
              )),
          SizedBox(
            height: workHeight * 0.05,
          ),
          Text(
            widget.title,
            style: style1,
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: workHeight * 0.01,
          ),
          SizedBox(
              width: widget.width * 0.9,
              child: Text(
                widget.subtitle,
                style: style2,
                textAlign: TextAlign.center,
              ))
        ]));
  }
}
