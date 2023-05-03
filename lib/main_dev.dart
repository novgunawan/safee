import 'package:flavor/flavor.dart';
import 'package:flutter/material.dart';

import 'base/app/app.dart';

void main() {
  Flavor.create(
    Environment.dev,
    color: Colors.green,
    name: 'Development',
    properties: {
      Keys.apiUrl: 'https://api.dev.company.com',
    },
  );
  setupApp();
}
