import 'package:flutter/material.dart';
import 'package:safee/styles/style.dart';

class ProfileDivider extends StatelessWidget {
  const ProfileDivider(this.sectionName, {super.key});
  final String sectionName;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 26.0),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          color: secondaryWhite,
          border: Border.all(color: secondaryWhite),
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: Text(
          sectionName,
          style: copyBoldStyleBlack,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
