import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ModalUtil extends GetxService {
  static ModalUtil get to => Get.find<ModalUtil>();

  Future<void> showbasicModal({
    required final List<Widget> contents,
  }) async {
    final Widget alertWidget = AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      insetPadding: const EdgeInsets.all(16),
      contentPadding: const EdgeInsets.all(16),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      actionsOverflowButtonSpacing: 8,
      content: StatefulBuilder(
        builder: (
          final BuildContext builderContext,
          final void Function(void Function()) dialogState,
        ) {
          return SingleChildScrollView(
            child: SizedBox(
              width: 560,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  ...contents,
                ],
              ),
            ),
          );
        },
      ),
    );

    await Get.dialog(alertWidget);
  }
}
