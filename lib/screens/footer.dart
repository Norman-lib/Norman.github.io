import 'package:flutter/material.dart';
import 'package:gwala/constants/assets.dart';
import 'package:gwala/constants/colors.dart';
import 'package:gwala/constants/text.dart';
import 'package:gwala/globals.dart';
import 'package:gwala/helpers/scroll_to_item.dart';
import 'package:lottie/lottie.dart';

class Footer extends StatelessWidget {
  const Footer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth >= 700) {
          return const DesktopFooter();
        } else {
          return const MobileFooter();
        }
      },
    );
  }
}

class MobileFooter extends StatelessWidget {
  const MobileFooter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Container(
      color: AppColors.colorPalette['secondary'],
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            alignment: Alignment.center,
            child: Stack(children: [
              const SizedBox(
                width: 600,
                child: Image(
                  image: AssetImage(AppAssets.logo),
                ),
              ),
              Positioned(
                left: 0,
                top: 0,
                bottom: 0,
                child: Lottie.asset(AppAssets.footer),
              ),
            ]),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  Text(
                    'Resources',
                    style: AppTextStyle.footerStyleBig,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  TextButton(
                      onPressed: () {
                        scrollToItem(employerKey);
                      },
                      child:
                          Text('Employers', style: AppTextStyle.footerStyle)),
                  TextButton(
                      onPressed: () {
                        scrollToItem(employeeKey);
                      },
                      child:
                          Text('Employees', style: AppTextStyle.footerStyle)),
                  TextButton(
                      onPressed: () {
                        scrollToItem(contactKey);
                      },
                      child: Text('Contact', style: AppTextStyle.footerStyle)),
                  TextButton(
                      onPressed: () {},
                      child: Text('FAQ', style: AppTextStyle.footerStyle)),
                ],
              ),
              Column(
                children: [
                  Text(
                    'Connect',
                    style: AppTextStyle.footerStyleBig,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  TextButton(
                      onPressed: () {},
                      child: Text('Facebook', style: AppTextStyle.footerStyle)),
                  TextButton(
                      onPressed: () {},
                      child: Text('LinkedIn', style: AppTextStyle.footerStyle)),
                  TextButton(
                      onPressed: () {},
                      child:
                          Text('Instagram', style: AppTextStyle.footerStyle)),
                  TextButton(
                      onPressed: () {},
                      child: Text('Twitter', style: AppTextStyle.footerStyle)),
                ],
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  Text(
                    'Products',
                    style: AppTextStyle.footerStyleBig,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  TextButton(
                      onPressed: () {},
                      child: Text('Early Salary Access',
                          style: AppTextStyle.footerStyle)),
                  TextButton(
                      onPressed: () {},
                      child: Text('Buy Now, Pay Later',
                          style: AppTextStyle.footerStyle)),
                ],
              ),
              Column(
                children: [
                  Text(
                    'Legal',
                    style: AppTextStyle.footerStyleBig,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  TextButton(
                      onPressed: () {},
                      child: Text('Terms & Conditions',
                          style: AppTextStyle.footerStyle)),
                  TextButton(
                      onPressed: () {},
                      child: Text('Privacy Policy',
                          style: AppTextStyle.footerStyle)),
                ],
              ),
            ],
          ),
          Container(
            alignment: Alignment.center,
            height: 40,
            width: 0.7 * screenWidth,
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(20)),
                color: AppColors.colorPalette['secondary'],
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
              '© 2022 by Gwala, All Rights Reserved.',
              style: AppTextStyle.footerStyle,
            ),
          )
        ],
      ),
    );
  }
}

class DesktopFooter extends StatelessWidget {
  const DesktopFooter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          height: double.maxFinite,
          width: double.maxFinite,
          color: AppColors.colorPalette['secondary'],
        ),
        Container(
            padding: const EdgeInsets.all(toolBarHeight),
            height: double.maxFinite,
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  alignment: Alignment.center,
                  child: Stack(children: [
                    const SizedBox(
                      width: 600,
                      child: Image(
                        image: AssetImage(AppAssets.logo),
                      ),
                    ),
                    Positioned(
                      left: 0,
                      top: 0,
                      bottom: 0,
                      child: Lottie.asset(AppAssets.footer),
                    ),
                  ]),
                ),
                Container(
                  alignment: Alignment.center,
                  child: SizedBox(
                    width: 0.8 * screenWidth,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              Text(
                                'Products',
                                style: AppTextStyle.footerStyleBig,
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              TextButton(
                                  onPressed: () {},
                                  child: Text('Early Salary Access',
                                      style: AppTextStyle.footerStyle)),
                              TextButton(
                                  onPressed: () {},
                                  child: Text('Buy Now, Pay Later',
                                      style: AppTextStyle.footerStyle)),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              Text(
                                'Resources',
                                style: AppTextStyle.footerStyleBig,
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              TextButton(
                                  onPressed: () {
                                    scrollToItem(employerKey);
                                  },
                                  child: Text('Employers',
                                      style: AppTextStyle.footerStyle)),
                              TextButton(
                                  onPressed: () {
                                    scrollToItem(employeeKey);
                                  },
                                  child: Text('Employees',
                                      style: AppTextStyle.footerStyle)),
                              TextButton(
                                  onPressed: () {
                                    scrollToItem(contactKey);
                                  },
                                  child: Text('Contact',
                                      style: AppTextStyle.footerStyle)),
                              TextButton(
                                  onPressed: () {},
                                  child: Text('FAQ',
                                      style: AppTextStyle.footerStyle)),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              Text(
                                'Legal',
                                style: AppTextStyle.footerStyleBig,
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              TextButton(
                                  onPressed: () {},
                                  child: Text('Terms & Conditions',
                                      style: AppTextStyle.footerStyle)),
                              TextButton(
                                  onPressed: () {},
                                  child: Text('Privacy Policy',
                                      style: AppTextStyle.footerStyle)),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              Text(
                                'Connect',
                                style: AppTextStyle.footerStyleBig,
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              TextButton(
                                  onPressed: () {},
                                  child: Text(
                                    'Facebook',
                                    style: AppTextStyle.footerStyle,
                                  )),
                              TextButton(
                                  onPressed: () {},
                                  child: Text('LinkedIn',
                                      style: AppTextStyle.footerStyle)),
                              TextButton(
                                  onPressed: () {},
                                  child: Text('Instagram',
                                      style: AppTextStyle.footerStyle)),
                              TextButton(
                                  onPressed: () {},
                                  child: Text('Twitter',
                                      style: AppTextStyle.footerStyle)),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  alignment: Alignment.center,
                  height: 40,
                  width: 0.5 * screenWidth,
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(20)),
                      color: AppColors.colorPalette['secondary'],
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
                    '© 2022 by Gwala, All Rights Reserved.',
                    style: AppTextStyle.footerStyle,
                  ),
                )
              ],
            )),
      ],
    );
  }
}
