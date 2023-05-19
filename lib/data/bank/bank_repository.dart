import 'package:safee/data/bank/model/bank_response.dart';

abstract class BankRepository {
  Future<BankResponse> getBankList();
}
