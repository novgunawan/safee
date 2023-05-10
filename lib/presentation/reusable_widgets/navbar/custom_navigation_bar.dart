import 'package:flutter/material.dart';
import 'package:safee/extension/widget_extension.dart';
import 'package:safee/styles/style.dart';

class CustomNavigationBar extends StatefulWidget {
  const CustomNavigationBar({super.key, required this.pageController});
  final PageController pageController;

  @override
  State<CustomNavigationBar> createState() => _CustomNavigationBarState();
}

class _CustomNavigationBarState extends State<CustomNavigationBar> {
  List<bool> selected = [true, false, false, false, false];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.0982721,
      decoration: BoxDecoration(
        color: white,
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 3.0,
            offset: const Offset(0, -3.0),
          ),
        ],
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(49),
          topRight: Radius.circular(49),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            BottomNavigationButton(
              icon: Icons.home_rounded,
              title: 'Home',
              callback: () {
                changeStateButton(0);
              },
              isSelected: selected[0],
            ),
            BottomNavigationButton(
              icon: Icons.add_circle_outline_rounded,
              title: 'Top Up',
              callback: () {
                changeStateButton(1);
              },
              isSelected: selected[1],
            ),
            BottomNavigationButton(
              icon: Icons.document_scanner_rounded,
              title: 'Scan',
              callback: () {
                changeStateButton(2);
              },
              isSelected: selected[2],
            ),
            BottomNavigationButton(
              icon: Icons.mobile_screen_share_rounded,
              title: 'Transfer',
              callback: () {
                changeStateButton(3);
              },
              isSelected: selected[3],
            ),
            BottomNavigationButton(
              icon: Icons.person,
              title: 'Profile',
              callback: () {
                changeStateButton(4);
              },
              isSelected: selected[4],
            ),
          ],
        ),
      ),
    );
  }

  void changeStateButton(int index) {
    setState(() {
      for (var i = 0; i < selected.length; i++) {
        selected[i] = false;
      }
      selected[index] = !selected[index];
      widget.pageController.jumpToPage(index);
    });
  }
}

class BottomNavigationButton extends StatelessWidget {
  const BottomNavigationButton({
    super.key,
    required this.icon,
    required this.title,
    required this.callback,
    required this.isSelected,
  });
  final IconData icon;
  final String title;
  final VoidCallback callback;
  final bool isSelected;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: callback,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: isSelected ? primaryPurple : primaryGray,
            size: 20,
          ),
          7.0.height,
          Text(
            title,
            style: isSelected
                ? caption2RegularStylePurple
                : caption2RegularStyleGray,
          )
        ],
      ),
    );
  }
}
