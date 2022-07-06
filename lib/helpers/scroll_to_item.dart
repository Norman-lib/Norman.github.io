import 'package:flutter/material.dart';

/// Scrolling keys
final mainKey = GlobalKey();
final secondKey = GlobalKey();
final thirdKey = GlobalKey();
final employeeKey = GlobalKey();
final employerKey = GlobalKey();
final howWorkKey = GlobalKey();
final contactKey = GlobalKey();
final footerKey = GlobalKey();

Map scrollKeys = <int, GlobalKey>{
  0: mainKey,
  1: secondKey,
  2: thirdKey,
  3: employeeKey,
  4: employerKey,
  5: howWorkKey,
  6: contactKey,
  7: footerKey
};

Future scrollToItem(GlobalKey itemKey) async {
  final context = itemKey.currentContext!;
  await Scrollable.ensureVisible(context, duration: const Duration(seconds: 1));
}
