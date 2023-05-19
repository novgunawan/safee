import 'package:dio/dio.dart';
import 'package:safee/data/const/strings.dart';

void setupNetwork() {
  // Setup Dio
  BaseOptions options = BaseOptions(
      connectTimeout: const Duration(milliseconds: 6000),
      receiveTimeout: const Duration(milliseconds: 60000),
      followRedirects: false,
      baseUrl: BASE_URL);

  Dio dio = Dio(options);
}
