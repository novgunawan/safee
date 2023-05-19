import 'package:flavor/flavor.dart';
import 'base/app/app.dart';
import 'data/const/strings.dart';

void main() {
  Flavor.create(
    Environment.production,
    name: 'Production',
    properties: {
      Keys.apiUrl: BASE_URL,
    },
  );
  setupApp();
}
