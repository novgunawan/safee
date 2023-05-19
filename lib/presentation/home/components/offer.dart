import 'package:flutter/material.dart';
import 'package:safee/presentation/reusable_widgets/widget.dart';
import 'package:safee/styles/asset.dart';
import 'package:safee/styles/style.dart';

class OfferSection extends StatelessWidget {
  const OfferSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return PurpleContainer(
        widget: Row(
      children: [
        Image.asset(
          TICKET_IMAGE,
          height: 30,
          width: 50,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Cashback offer',
              style: heading4StyleWhite,
            ),
            Text(
              'Get up to 10% cashback',
              style: bodyRegularStyleWhite,
            )
          ],
        )
      ],
    ));
  }
}
