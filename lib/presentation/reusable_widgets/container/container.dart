import 'package:flutter/material.dart';
import 'package:safee/extension/widget_extension.dart';
import 'package:safee/styles/style.dart';

class PurpleContainer extends StatelessWidget {
  const PurpleContainer({super.key, required this.widget});
  final Widget widget;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.0), color: primaryPurple),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
        child: widget,
      ),
    );
  }
}

class PaymentContainer extends StatelessWidget {
  const PaymentContainer({super.key, required this.image, required this.type});
  final String image;
  final String type;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.0), color: white),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 15),
        child: Row(
          children: [
            Image.asset(
              image,
              height: 20,
              width: 20,
            ),
            20.0.width,
            Flexible(
              child: Text(
                type,
                style: copyRegularStyleGray,
                maxLines: 2,
              ),
            )
          ],
        ),
      ),
    );
  }
}
