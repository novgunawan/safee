import 'package:flutter/material.dart';
import 'package:safee/base/data/data.dart';
import 'package:safee/presentation/reusable_widgets/widget.dart';

class PaymentGrid extends StatelessWidget {
  const PaymentGrid({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: GridView.builder(
        padding: const EdgeInsets.symmetric(vertical: 10),
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 14,
            mainAxisSpacing: 14,
            childAspectRatio: (1 / .4)),
        itemCount: paymentData.length,
        itemBuilder: (context, index) {
          var data = paymentData[index];
          return PaymentContainer(
            image: data["image"] ?? '',
            type: data["type"] ?? '',
          );
        },
      ),
    );
  }
}
