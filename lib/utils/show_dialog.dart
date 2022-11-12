import 'package:get/get.dart';

void showMaterialDialog(String title, String message) {
  Get.defaultDialog(
    title: title,
    middleText: message,
    textConfirm: "OK",
    onConfirm: () {
      Get.back(closeOverlays: true);
    },
  );
}
