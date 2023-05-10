import 'package:flutter/material.dart';
import 'package:safee/extension/widget_extension.dart';
import 'package:safee/presentation/reusable_widgets/decoration/decoration.dart';
import 'package:safee/styles/style.dart';

class PurpleContainer extends StatelessWidget {
  const PurpleContainer({super.key, required this.widget});
  final Widget widget;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxBorderDecoration(backgroundColor: primaryPurple),
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
      decoration: BoxBorderDecoration(backgroundColor: white),
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
                style: copyRegularStyleSecondaryGray,
                maxLines: 2,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class AmountContainer extends StatelessWidget {
  const AmountContainer({super.key, required this.amount});
  final String amount;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        decoration: BoxBorderDecoration(
            backgroundColor: white, borderColor: primaryGray),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Text(
              '\$ $amount',
              style: bodyRegularStyleBlack,
            ),
          ),
        ),
      ),
    );
  }
}

class TopUpContainer extends StatelessWidget {
  const TopUpContainer(
      {super.key, required this.leadingWidget, required this.title});
  final Widget leadingWidget;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 18.0),
      child: Container(
        decoration: BoxBorderDecoration(backgroundColor: white),
        child: ListTile(
          leading: leadingWidget,
          title: Text(
            title,
            style: copyRegularStyleBlack,
          ),
          trailing: const Icon(
            Icons.chevron_right_rounded,
            size: 25.0,
          ),
        ),
      ),
    );
  }
}
