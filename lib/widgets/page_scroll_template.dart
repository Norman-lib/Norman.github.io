import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gwala/constants/colors.dart';
import 'package:gwala/helpers/scroll_to_item.dart';
import 'package:gwala/screens/employee_view.dart';
import 'package:gwala/screens/home_view.dart';
import 'package:gwala/screens/second_view.dart';
import 'package:gwala/screens/third_view.dart';
import 'package:gwala/screens/contact_view.dart';
import 'package:gwala/screens/employer_view.dart';
import 'package:gwala/screens/steps_view.dart';
import 'package:gwala/screens/footer.dart';

class PagesScrollView extends StatefulWidget {
  const PagesScrollView({Key? key}) : super(key: key);

  @override
  State<PagesScrollView> createState() => _PagesScrollViewState();
}

class _PagesScrollViewState extends State<PagesScrollView>
    with TickerProviderStateMixin {
  bool scrolled = true;
  int currentPage = 0;
  List<Widget> pages = [];
  late AnimationController controller;
  late Animation<double> animation1;
  late Animation<double> animation2;
  late Animation animation3;
  late Animation animation4;

  @override
  void initState() {
    super.initState();
    //Animation controller
    controller = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );
    animation1 =
        Tween(begin: 0.01 * pi, end: 0.1 * pi).animate(controller); //rotation
    animation2 = Tween(begin: 1.0, end: 3.0).animate(controller); //scale
    animation3 = ColorTween(begin: Colors.white, end: Colors.transparent)
        .animate(controller); //color1
    animation4 = ColorTween(begin: Colors.black, end: Colors.white)
        .animate(controller); //color2
    //pages
    pages = [
      HomeView(
        key: mainKey,
      ),
      WhatGwala(
        key: secondKey,
      ),
      ThirdView(
        key: thirdKey,
      ),
      Employees(
        key: employeeKey,
      ),
      Employers(
        key: employerKey,
      ),
      Steps(
        key: howWorkKey,
      ),
      Contact(
        key: contactKey,
      ),
      Footer(
        key: footerKey,
      ),
    ];
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  Widget createDots({required int index}) {
    return InkWell(
      onTap: () {
        scrollToItem(scrollKeys[index]);
      },
      child: AnimatedContainer(
        duration: const Duration(seconds: 2),
        child: Container(
          margin: const EdgeInsets.only(bottom: 7),
          height: currentPage == index ? 25 : 6,
          width: 6,
          decoration: BoxDecoration(
            color: currentPage == index
                ? AppColors.colorPalette['primary']
                : AppColors.colorPalette['dark'],
            borderRadius: BorderRadius.circular(3),
          ),
        ),
      ),
    );
  }

  void changeDots(index) {
    currentPage = index;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return KeyboardListener(
        focusNode: FocusNode(),
        autofocus: true,
        onKeyEvent: (keyEvent) {
          if (keyEvent.logicalKey == LogicalKeyboardKey.arrowDown) {
            if (currentPage < scrollKeys.length) {
              scrollToItem(scrollKeys[currentPage + 1]);
            }
          } else if (keyEvent.logicalKey == LogicalKeyboardKey.arrowUp) {
            if (currentPage > 0) {
              scrollToItem(scrollKeys[currentPage - 1]);
            }
          }
        },
        child: Stack(
          alignment: Alignment.center,
          children: [
            //Bg Animation
            Center(
              child: AnimatedBuilder(
                animation:
                    Listenable.merge([animation1, animation2, animation4]),
                builder: (BuildContext context, Widget? child) {
                  return Transform.rotate(
                    angle: animation1.value,
                    child: Transform.scale(
                      scale: animation2.value,
                      child: Container(
                        width: size.width * 0.8,
                        height: size.height * 0.8,
                        decoration: BoxDecoration(
                          color: animation4.value,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            //Content
            AnimatedBuilder(
              animation: animation3,
              builder: (BuildContext context, Widget? child) {
                return Container(
                  color: animation3.value,
                  width: size.width,
                  height: size.height,
                  child: Stack(
                    children: [
                      //Views
                      PageView.builder(
                        onPageChanged: (index) async {
                          changeDots(index);
                          await controller.forward();
                          controller.reset();
                        },
                        allowImplicitScrolling: true,
                        itemCount: pages.length,
                        scrollDirection: Axis.vertical,
                        itemBuilder: (context, index) => pages[index],
                      ),
                      //Dots
                      Positioned(
                          right: size.width * 0.05,
                          top: size.height * 0.4,
                          bottom: size.height * 0.3,
                          child: LayoutBuilder(
                            builder: (context, constraints) {
                              if (size.width >= 800) {
                                return Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: List.generate(pages.length,
                                      (index) => createDots(index: index)),
                                );
                              } else {
                                return const SizedBox();
                              }
                            },
                          )),
                    ],
                  ),
                );
              },
            ),
          ],
        ));
  }
}
