import 'package:flutter/material.dart';
import 'package:safee/base/data/data.dart';
import 'package:safee/presentation/reusable_widgets/widget.dart';

class AmountRow extends StatelessWidget {
  const AmountRow({
    super.key,
    required this.selectedStatus,
    required this.amountController,
  });

  final ValueNotifier<List<bool>> selectedStatus;
  final TextEditingController amountController;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: ValueListenableBuilder(
          valueListenable: selectedStatus,
          builder: (context, value, child) {
            return ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: amounts.length,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.only(right: 10),
                child: AmountContainer(
                  amount: amounts[index].toString(),
                  callback: () {
                    amountController.text = amounts[index].toString();
                    // *Set all value to false
                    selectedStatus.value = [false, false, false];
                    // *Set intended index value to be true
                    selectedStatus.value[index] = !value[index];
                  },
                  isSelected: value[index],
                ),
              ),
            );
          }),
    );
  }
}
