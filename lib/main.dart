import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:todo/app/service/storage/storage_box.dart';
import 'package:todo/app/service/modal/modal_util.dart';

import 'app/routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  runApp(
    GetMaterialApp(
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      debugShowCheckedModeBanner: false,
      initialBinding: InitialBinding(),
    ),
  );
}

class InitialBinding extends Bindings {
  @override
  Future<void> dependencies() async {
    Get.put(StorageBox());
    Get.lazyPut(() => ModalUtil());
  }
}
