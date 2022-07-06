import 'package:flutter/material.dart';
import 'package:gwala/constants/assets.dart';
import 'package:gwala/constants/colors.dart';
import 'package:gwala/constants/text.dart';
import 'package:gwala/helpers/scroll_to_item.dart';

class NavBar extends StatelessWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColors.colorPalette['dark'],
      child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
        const Image(image: AssetImage(AppAssets.logo)),
        const SizedBox(
          height: 25,
        ),
        TextButton(
            onPressed: () {
              scrollToItem(secondKey);
            },
            child: Text(
              'Discover Gwala',
              style: AppTextStyle.navBarTextStyle,
            )),
        const InBetweenDevider(),
        TextButton(
            onPressed: () {
              scrollToItem(employeeKey);
            },
            child: Text(
              'Employees',
              style: AppTextStyle.navBarTextStyle,
            )),
        const InBetweenDevider(),
        TextButton(
            onPressed: () {
              scrollToItem(employerKey);
            },
            child: Text('Employers', style: AppTextStyle.navBarTextStyle)),
        const InBetweenDevider(),
        TextButton(
            onPressed: () {
              scrollToItem(howWorkKey);
            },
            child: Text('How It Works', style: AppTextStyle.navBarTextStyle)),
        const InBetweenDevider(),
        TextButton(
            onPressed: () {
              scrollToItem(footerKey);
            },
            child: Text('About Gwala', style: AppTextStyle.navBarTextStyle)),
        const InBetweenDevider(),
        TextButton(
            onPressed: () {
              scrollToItem(contactKey);
            },
            child: Text('Get Started', style: AppTextStyle.navBarTextStyle)),
        const Expanded(child: SizedBox()),
        Center(
          child: Container(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: const Text(
                '© 2022 by Gwala.',
                style: TextStyle(color: Colors.white),
              )),
        )
      ]),
    );
  }
}

class InBetweenDevider extends StatelessWidget {
  const InBetweenDevider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 0.05 * MediaQuery.of(context).size.height,
      width: double.maxFinite,
      child: Center(
          child: Container(
        height: 1,
        width: 50,
        color: AppColors.colorPalette['light'],
      )),
    );
  }
}
