import 'package:flutter/material.dart';
import 'package:safee/extension/widget_extension.dart';
import 'package:safee/presentation/widgets/button/button.dart';
import 'package:safee/styles/asset.dart';

import 'package:safee/styles/style.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          115.0.height,
          Text('Welcome to', style: heading1StylePurple),
          Text(
            'Safee Home Screen',
            style: heading1StyleBlack,
          ),
        ],
      ),
    ));
  }
}
