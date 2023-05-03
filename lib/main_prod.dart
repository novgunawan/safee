import 'package:flavor/flavor.dart';
import 'base/app/app.dart';

void main() {
  Flavor.create(
    Environment.production,
    name: 'Production',
    properties: {
      Keys.apiUrl: 'https://api.dev.company.com',
    },
  );
  setupApp();
}
