import 'package:flutter/material.dart';
import 'package:safee/base/data/data.dart';
import 'package:safee/extension/widget_extension.dart';
import 'package:safee/presentation/reusable_widgets/widget.dart';
import 'package:safee/styles/asset.dart';
import 'package:safee/styles/style.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static const String routeName = '/home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
      child: LayoutBuilder(builder: (context, constraints) {
        return SingleChildScrollView(
          child: SizedBox(
            width: double.maxFinite,
            height: MediaQuery.of(context).size.height,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                60.0.height,
                const HomeBalanceWidget(),
                15.0.height,
                Text(
                  'Payment List',
                  style: bodyBoldStyleBlack,
                ),
                Flexible(
                  child: GridView.builder(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
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
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Today\'s Offer',
                      style: bodyBoldStyleBlack,
                    ),
                    Text(
                      'View More',
                      style: captionRegularStyleGray,
                    )
                  ],
                ),
                20.0.height,
                PurpleContainer(
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
                ))
              ],
            ),
          ),
        );
      }),
    ));
  }
}

class HomeBalanceWidget extends StatelessWidget {
  const HomeBalanceWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // TODO(feat/home): change data dynamically
    return PurpleContainer(
        widget: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Hi, Novi',
                  style: heading3StyleWhite,
                ),
                4.0.height,
                Text(
                  'Premium User',
                  style: captionRegularStyleWhite,
                )
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Your balance',
                  style: captionRegularStyleWhite,
                ),
                4.0.height,
                Text(
                  '\$ 00.00',
                  style: heading4StyleGreen,
                )
              ],
            )
          ],
        ),
        28.0.height,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.asset(
                  SEND_IMAGE,
                  height: 25,
                  width: 25,
                ),
                5.0.width,
                Text(
                  'Send Money',
                  style: bodyRegularStyleWhite,
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.asset(
                  HISTORY_IMAGE,
                  height: 25,
                  width: 25,
                ),
                5.0.width,
                Text(
                  'History',
                  style: bodyRegularStyleWhite,
                )
              ],
            ),
          ],
        )
      ],
    ));
  }
}
