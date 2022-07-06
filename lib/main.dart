import 'package:flutter/material.dart';
import 'package:gwala/widgets/nav_bar.dart';
import './globals.dart' as globals;
import 'package:gwala/constants/colors.dart';
import 'package:gwala/widgets/page_scroll_template.dart';

import 'screens/app_bar.dart';

void main() {
  runApp(const GwalaApp());
}

class GwalaApp extends StatefulWidget {
  const GwalaApp({Key? key}) : super(key: key);

  @override
  State<GwalaApp> createState() => _GwalaAppState();
}

class _GwalaAppState extends State<GwalaApp> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(debugShowCheckedModeBanner: false, home: Home());
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      drawerScrimColor: AppColors.colorPalette['primaryTrans'],
      endDrawer:
          (MediaQuery.of(context).size.width < 650) ? const NavBar() : null,
      appBar: AppBar(
        toolbarHeight: globals.toolBarHeight,
        flexibleSpace: const GwalaAppBar(),
        backgroundColor: Colors.transparent,
        foregroundColor: AppColors.colorPalette['dark'],
        elevation: 0,
      ),
      body: const PagesScrollView(),
    );
  }
}
