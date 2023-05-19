import 'package:flavor/flavor.dart';
import 'package:flutter/material.dart';

import 'base/app/app.dart';
import 'data/const/strings.dart';

void main() {
  Flavor.create(
    Environment.dev,
    color: Colors.green,
    name: 'Development',
    properties: {
      Keys.apiUrl: BASE_URL,
    },
  );
  setupApp();
}
