import 'package:flutter/material.dart';
import 'package:safee/styles/style.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton(
      {super.key,
      required this.title,
      required this.isPurple,
      required this.callback});
  final String title;
  final bool isPurple;
  final VoidCallback callback;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: callback,
        style: ElevatedButton.styleFrom(
            elevation: 0,
            side: const BorderSide(color: primaryPurple),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.0)),
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            backgroundColor: isPurple ? primaryPurple : Colors.transparent),
        child: Text(
          title,
          style: isPurple ? bodyBoldStyleWhite : bodyBoldStylePurple,
        ),
      ),
    );
  }
}

class SecondaryButton extends StatelessWidget {
  const SecondaryButton(
      {super.key, required this.title, required this.callback});
  final String title;
  final VoidCallback callback;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: callback,
        style: ElevatedButton.styleFrom(
            elevation: 0,
            side: const BorderSide(color: secondaryGray),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.0)),
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            backgroundColor: Colors.transparent),
        child: Text(
          title,
          style: bodyBoldStyleBlack,
        ),
      ),
    );
  }
}