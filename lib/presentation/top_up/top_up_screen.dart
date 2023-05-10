import 'package:flutter/material.dart';
import 'package:safee/base/data/data.dart';
import 'package:safee/extension/widget_extension.dart';
import 'package:safee/presentation/reusable_widgets/button/button.dart';
import 'package:safee/presentation/reusable_widgets/container/container.dart';
import 'package:safee/styles/asset.dart';
import 'package:safee/styles/style.dart';
import 'package:safee/styles/text_style.dart';

class TopUpScreen extends StatefulWidget {
  const TopUpScreen({super.key});

  @override
  State<TopUpScreen> createState() => _TopUpScreenState();
}

class _TopUpScreenState extends State<TopUpScreen> {
  final TextEditingController amountController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: LayoutBuilder(builder: (context, constraints) {
      return SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 40),
          child: SizedBox(
            width: double.maxFinite,
            height: MediaQuery.of(context).size.height,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const BalanceWidget(),
                27.0.height,
                Text(
                  'Set amount',
                  style: bodyBoldStyleBlack,
                ),
                13.0.height,
                SizedBox(
                  height: 60,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: amounts.length,
                    itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: AmountContainer(amount: amounts[index]),
                    ),
                  ),
                ),
                24.0.height,
                Text(
                  'How much would you like to top up ?',
                  style: copyRegularStyleBlack,
                ),
                23.0.height,
                ValidationTextFormField(
                    controller: amountController,
                    alignment: TextAlign.center,
                    hintText: 'Min \$ 10'),
                25.0.height,
                Text(
                  'Choose your preferred top up method',
                  style: copyRegularStyleSecondaryGray,
                ),
                24.0.height,
                TopUpContainer(
                  leadingWidget: Image.asset(
                    MASTERCARD_IMAGE,
                    height: 25,
                    width: 25,
                  ),
                  title: 'Mastercard',
                ),
                const TopUpContainer(
                  leadingWidget: Icon(
                    Icons.store_outlined,
                    size: 25.0,
                  ),
                  title: 'ATM',
                ),
                const TopUpContainer(
                  leadingWidget: Icon(
                    Icons.phone_iphone_rounded,
                    size: 25.0,
                  ),
                  title: 'Mobile Banking',
                ),
                Flexible(
                  child: PrimaryButton(
                      title: 'Top Up Now', isPurple: true, callback: () {}),
                )
              ],
            ),
          ),
        ),
      );
    }));
  }
}

class ValidationTextFormField extends StatelessWidget {
  const ValidationTextFormField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.alignment,
  });

  final TextEditingController controller;
  final String hintText;
  final TextAlign alignment;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autocorrect: false,
      textAlign: alignment,
      controller: controller,
      decoration: InputDecoration(
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(16.0)),
        ),
        hintText: hintText,
        hintStyle: bodyRegularStyleGray,
      ),
    );
  }
}

class BalanceWidget extends StatelessWidget {
  const BalanceWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return PurpleContainer(
        widget: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Safee',
          style: heading4StyleWhite,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              'Balance',
              style: captionRegularStyleWhite,
            ),
            Text(
              '\$5000.00',
              style: heading4StyleGreen,
            )
          ],
        )
      ],
    ));
  }
}
