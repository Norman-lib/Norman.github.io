import 'package:flutter/material.dart';
import 'package:gwala/constants/assets.dart';
import 'package:gwala/constants/text.dart';
import 'package:gwala/helpers/scroll_to_item.dart';
import 'package:gwala/widgets/buttons.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    bool isMobile = screenWidth < 650;
    bool isTablet = screenWidth > 650 && screenWidth < 1050;
    return Container(
      height: screenHeight * 0.8,
      alignment: Alignment.center,
      child: SizedBox(
        height: screenHeight * 0.85,
        width: screenWidth * 0.95,
        child: Wrap(
          alignment: WrapAlignment.spaceEvenly,
          runAlignment: WrapAlignment.center,
          //crossAxisAlignment: WrapCrossAlignment.center,
          runSpacing: 50,
          spacing: 50,
          children: <Widget>[
            //left side
            SizedBox(
              width:
                  isMobile || isTablet ? screenWidth * 0.9 : screenWidth * 0.4,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 100,
                  ),
                  //title
                  Text(
                    'Your key to \nfinancial resilience.',
                    style: AppTextStyle.titleStyle,
                    textAlign: TextAlign.left,
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  //Description
                  Text(
                    'Gwala is a financial benefits platform enabling \nfaster access to wages for employees \nand sustainable cashflow support  for businesses.',
                    style: AppTextStyle.descriptionStyleBold,
                    textAlign: TextAlign.left,
                  ),
                  const SizedBox(
                    height: 35,
                  ),
                  Wrap(
                    //mainAxisAlignment: MainAxisAlignment.center,
                    alignment: WrapAlignment.center,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    spacing: 20,
                    runSpacing: 20,
                    children: [
                      //DISCOVER GWALA BUTTON
                      AppPrimaryButton(
                        width: isMobile ? 150 : 180,
                        height: 50,
                        borderRadius: 50,
                        content: Text(
                          'Discover Gwala',
                          textAlign: TextAlign.center,
                          style: AppTextStyle.buttonStyle,
                        ),
                        onClick: () {
                          scrollToItem(secondKey);
                        },
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        'or',
                        style: AppTextStyle.buttonStyle,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      //GET STARTED BUTTON
                      AppPrimaryButton(
                        width: isMobile ? 150 : 180,
                        height: 50,
                        borderRadius: 50,
                        content: Wrap(
                          //mainAxisAlignment: MainAxisAlignment.center,
                          alignment: WrapAlignment.center,
                          children: [
                            Image.asset(
                              AppAssets.startup,
                              width: 20,
                              height: 20,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              'Get Started',
                              textAlign: TextAlign.center,
                              style: AppTextStyle.buttonStyle,
                            ),
                          ],
                        ),
                        onClick: () {},
                      ),
                    ],
                  ),
                ],
              ),
            ),
            //Right side
            Container(
              width: isMobile
                  ? screenWidth * 0.6
                  : isTablet
                      ? 300
                      : screenWidth * 0.4,
              height: isMobile
                  ? screenWidth * 0.6
                  : isTablet
                      ? 300
                      : screenWidth * 0.4,
              //screenWidth > 1600 ? screenHeight - 25 : ,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                shape: BoxShape.circle,
              ),
              child: RotationTransition(
                turns: const AlwaysStoppedAnimation(15 / 360),
                child: Image.asset(
                  AppAssets.gwalaApp,
                  //alignment: Alignment.centerLeft,
                  //fit: BoxFit.fitHeight,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
