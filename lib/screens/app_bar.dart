import 'package:flutter/material.dart';
import 'package:gwala/constants/assets.dart';
import 'package:gwala/globals.dart' as globals;
import 'package:gwala/helpers/scroll_to_item.dart';
import 'package:gwala/widgets/buttons.dart';
import 'package:gwala/widgets/responsive.dart';
import 'package:gwala/constants/text.dart';

class GwalaAppBar extends StatelessWidget {
  const GwalaAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Responsive(
        tablet: TabletAppBar(),
        mobile: MobileAppBar(),
        desktop: DesktopAppBar());
  }
}

class DesktopAppBar extends StatefulWidget {
  const DesktopAppBar({Key? key}) : super(key: key);

  @override
  State<DesktopAppBar> createState() => _DesktopAppBarState();
}

class _DesktopAppBarState extends State<DesktopAppBar> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: globals.toolBarHeight,
        width: double.maxFinite,
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          InkWell(
            borderRadius: BorderRadius.circular(20),
            onTap: () {
              scrollToItem(mainKey);
            },
            child: Container(
              width: 200,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
              ),
              child: const Image(
                image: AssetImage(AppAssets.logo),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            AppBarButton(
              label: 'Employees',
              icon: const Image(
                image: AssetImage(AppAssets.employeeIcon),
                width: 22,
                height: 22,
              ),
              width: 150,
              viewKey: employeeKey,
            ),
            const SizedBox(
              width: 15,
            ),
            AppBarButton(
              label: 'Employers',
              icon: const Image(
                image: AssetImage(AppAssets.employerIcon),
                width: 22,
                height: 30,
              ),
              width: 150,
              viewKey: employerKey,
            ),
            const SizedBox(
              width: 15,
            ),
            AppBarButton(
              label: 'How it Works',
              icon: const Image(
                image: AssetImage(AppAssets.howItWorks),
                width: 22,
                height: 30,
              ),
              width: 170,
              viewKey: howWorkKey,
            ),
            const SizedBox(
              width: 15,
            ),
            AppBarButton(
              label: 'About',
              icon: const Image(
                image: AssetImage(AppAssets.info),
                width: 22,
                height: 30,
              ),
              width: 120,
              viewKey: footerKey,
            ),
          ]),
          AppPrimaryButton(
            onClick: () => scrollToItem(contactKey),
            width: 160,
            height: 50,
            borderRadius: 10,
            content: Row(
              children: [
                const SizedBox(
                  height: 30,
                  width: 30,
                  child: Image(
                    image: AssetImage(AppAssets.startup),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Text(
                    'Get Started',
                    textAlign: TextAlign.center,
                    style: AppTextStyle.appBarStyleBold,
                  ),
                ),
              ],
            ),
          )
        ]));
  }
}

class TabletAppBar extends StatefulWidget {
  const TabletAppBar({Key? key}) : super(key: key);

  @override
  State<TabletAppBar> createState() => _TabletAppBarState();
}

class _TabletAppBarState extends State<TabletAppBar> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: globals.toolBarHeight,
      width: double.maxFinite,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          InkWell(
            borderRadius: BorderRadius.circular(20),
            onTap: () {
              scrollToItem(mainKey);
            },
            child: Container(
              width: 200,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
              ),
              child: const Image(
                image: AssetImage(AppAssets.logo),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            AppBarIconButton(
              icon: const AssetImage(AppAssets.employeeIcon),
              viewKey: employeeKey,
            ),
            const SizedBox(
              width: 15,
            ),
            AppBarIconButton(
              icon: const AssetImage(AppAssets.employerIcon),
              viewKey: employerKey,
            ),
            const SizedBox(
              width: 15,
            ),
            AppBarIconButton(
              icon: const AssetImage(AppAssets.howItWorks),
              viewKey: howWorkKey,
            ),
            const SizedBox(
              width: 15,
            ),
            AppBarIconButton(
              icon: const AssetImage(AppAssets.info),
              viewKey: footerKey,
            ),
          ]),
          AppPrimaryButton(
            onClick: (() => scrollToItem(contactKey)),
            width: 160,
            height: 50,
            borderRadius: 10,
            content: Row(
              children: const [
                SizedBox(
                  height: 30,
                  width: 30,
                  child: Image(
                    image: AssetImage(AppAssets.startup),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Text(
                    'Get Started',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class MobileAppBar extends StatefulWidget {
  const MobileAppBar({Key? key}) : super(key: key);

  @override
  State<MobileAppBar> createState() => _MobileAppBarState();
}

class _MobileAppBarState extends State<MobileAppBar> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: globals.toolBarHeightMobile,
        width: 200,
        child: InkWell(
          borderRadius: BorderRadius.circular(15),
          onTap: () {
            scrollToItem(mainKey);
          },
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Image.asset(
              AppAssets.logo,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
