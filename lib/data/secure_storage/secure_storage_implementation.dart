import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:safee/service/secure_storage_service.dart';

class SecureStorageImplement implements SecureStorageService {
  final _secureStorageManager = FlutterSecureStorage();
  AndroidOptions _getAndroidOptions() => const AndroidOptions(
        encryptedSharedPreferences: true,
      );
  @override
  Future clear() async {
    await _secureStorageManager.deleteAll(aOptions: _getAndroidOptions());
  }

  @override
  Future<bool?> getBool({required String key}) async {
    String? result = await _secureStorageManager.read(
        key: key, aOptions: _getAndroidOptions());
    return result == '1' ? true : false;
  }

  @override
  Future<int?> getInt({required String key}) async {
    String? result = await _secureStorageManager.read(
        key: key, aOptions: _getAndroidOptions());

    return int.tryParse(result ?? '0');
  }

  @override
  Future<String?> getString({required String key}) async {
    String? result = await _secureStorageManager.read(
        key: key, aOptions: _getAndroidOptions());

    return result;
  }

  @override
  Future removeValue({required String key}) async {
    await _secureStorageManager.delete(key: key);
  }

  @override
  Future saveBool({required String key, required bool value}) async {
    await _secureStorageManager.write(
        key: key, value: value ? '1' : '0', aOptions: _getAndroidOptions());
  }

  @override
  Future saveInt({required String key, required int value}) async {
    await _secureStorageManager.write(
        key: key, value: value.toString(), aOptions: _getAndroidOptions());
  }

  @override
  Future saveString({required String key, required String value}) async {
    await _secureStorageManager.write(
        key: key, value: value, aOptions: _getAndroidOptions());
  }
}
