import 'package:flutter/material.dart';
import 'package:safee/presentation/home/home_screen.dart';
import 'package:safee/presentation/profile/profile.dart';
import 'package:safee/presentation/scan/scan.dart';
import 'package:safee/presentation/top_up/top_up_screen.dart';
import 'package:safee/presentation/transfer/transfer.dart';
import 'package:safee/presentation/reusable_widgets/navbar/custom_navigation_bar.dart';
import 'package:safee/styles/style.dart';

class Tabbar extends StatefulWidget {
  const Tabbar({super.key});
  static const String routeName = '/tab-bar';

  @override
  State<Tabbar> createState() => _TabbarState();
}

class _TabbarState extends State<Tabbar> {
  final PageController pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: PageView(
          physics: const NeverScrollableScrollPhysics(),
          controller: pageController,
          children: const [
            HomeScreen(),
            TopUpScreen(),
            ScanScreen(),
            TransferScreen(),
            ProfileScreen()
          ],
        ),
        bottomNavigationBar: Container(
            decoration: BoxDecoration(
              color: white,
              boxShadow: <BoxShadow>[
                BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    blurRadius: 3.0,
                    offset: const Offset(0, -3.0))
              ],
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(49),
                topRight: Radius.circular(49),
              ),
            ),
            child: CustomNavigationBar(
              pageController: pageController,
            )));
  }
}
