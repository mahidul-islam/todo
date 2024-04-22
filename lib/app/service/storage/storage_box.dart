import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

enum StorageKeys {
  token,
  cacheId,
}

class StorageBox extends GetxService {
  static StorageBox get to => Get.find();
  final GetStorage _box = GetStorage()..initStorage;
  // Token
  String get token => _box.read<String?>(StorageKeys.token.name) ?? '';
  void get clearToken => _box.remove(StorageKeys.token.name);
  void setToken({required final String token}) {
    _box.write(StorageKeys.token.name, token);
  }

  // Cache ID
  int? get cacheId => _box.read<int?>(StorageKeys.cacheId.name);
  void clearCacheId() => _box.remove(StorageKeys.cacheId.name);
  void setCacheId({required final int cacheId}) {
    _box
        .write(StorageKeys.cacheId.name, cacheId)
        .then((final _) => _box.save());
  }
}
