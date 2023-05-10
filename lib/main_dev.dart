import 'package:flavor/flavor.dart';
import 'package:flutter/material.dart';

import 'base/app/app.dart';

void main() {
  Flavor.create(
    Environment.dev,
    color: Colors.green,
    name: 'Development',
    properties: {
      Keys.apiUrl: 'https://22308611-6bca-40dc-8237-fc90ef7b356d.mock.pstmn.io',
    },
  );
  setupApp();
}
