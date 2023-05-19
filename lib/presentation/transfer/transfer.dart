import 'package:flutter/material.dart';
import 'package:safee/base/data/data.dart';
import 'package:safee/extension/widget_extension.dart';
import 'package:safee/presentation/reusable_widgets/widget.dart';
import 'package:safee/presentation/top_up/top_up_screen.dart';
import 'package:safee/styles/asset.dart';
import 'package:safee/styles/style.dart';

class TransferScreen extends StatefulWidget {
  const TransferScreen({super.key});

  @override
  State<TransferScreen> createState() => _TransferScreenState();
}

class _TransferScreenState extends State<TransferScreen> {
  //Controller
  final TextEditingController bankNumberController = TextEditingController();
  final TextEditingController amountController = TextEditingController();
  //Variables
  ValueNotifier<int> selectedAmount = ValueNotifier(0);
  ValueNotifier<List<bool>> selectedStatus =
      ValueNotifier([false, false, false]);
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
                  'Bank Account',
                  style: bodyBoldStyleBlack,
                ),
                20.0.height,
                TopUpContainer(
                    leadingWidget: Image.asset(
                      MANDIRI_IMAGE,
                      height: 55,
                      width: 55,
                    ),
                    title: 'Mandiri'),
                27.0.height,
                ValidationTextFormField(
                    controller: bankNumberController,
                    hintText: 'Bank Number',
                    alignment: TextAlign.left),
                34.0.height,
                Text(
                  'Set amount',
                  style: bodyBoldStyleBlack,
                ),
                13.0.height,
                AmountRow(
                    selectedStatus: selectedStatus,
                    amountController: amountController),
                21.0.height,
                ValidationTextFormField(
                    controller: amountController,
                    hintText: 'Min \$ 10',
                    alignment: TextAlign.center),
                30.0.height,
                Flexible(
                  child: PrimaryButton(
                      title: 'Transfer', isPurple: true, callback: () {}),
                )
              ],
            ),
          ),
        ),
      );
    }));
  }
}
