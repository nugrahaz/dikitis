import 'package:dikitis/app/services/local/storage_service.dart';
import 'package:dikitis/app/services/remote/user_service.dart';
import 'package:dikitis/app/utils/utils.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChangePasswordController extends GetxController {
  static final ChangePasswordController to = Get.find<ChangePasswordController>();

  late TextEditingController oldPasswordTextEditingController;
  late TextEditingController newPasswordTextEditingController;
  late TextEditingController confirmNewPasswordTextEditingController;

  late FocusNode oldPasswordFocus;
  late FocusNode newPasswordFocus;
  late FocusNode confirmNewPasswordFocus;

  RxBool isLoading = false.obs;
  RxBool passwordVisibility = true.obs;

  @override
  void onInit() {
    oldPasswordTextEditingController = TextEditingController();
    newPasswordTextEditingController = TextEditingController();
    confirmNewPasswordTextEditingController = TextEditingController();
    oldPasswordFocus = FocusNode();
    newPasswordFocus = FocusNode();
    confirmNewPasswordFocus = FocusNode();
    super.onInit();
  }

  @override
  void onClose() {
    unFocusTextField();
    super.onClose();
  }

  void updatePassword() async {
    if (oldPasswordTextEditingController.text.trim().isEmpty) {
      SharedMethod.showSnackBar(title: "Password lama masih kosong", description: "Silahkan mengisi field tersebut");
    } else if (newPasswordTextEditingController.text.trim().isEmpty) {
      SharedMethod.showSnackBar(title: "Password baru masih kosong", description: "Silahkan mengisi field tersebut");
    } else if (confirmNewPasswordTextEditingController.text.trim().isEmpty) {
      SharedMethod.showSnackBar(title: "Konfirmasi password masih kosong", description: "Silahkan mengisi field tersebut");
    } else if (newPasswordTextEditingController.text.trim() != confirmNewPasswordTextEditingController.text.trim()) {
      SharedMethod.showSnackBar(title: "Password baru tidak sama", description: "Silahkan periksa kembali field tersebut");
    } else if (oldPasswordTextEditingController.text.trim() == newPasswordTextEditingController.text.trim()) {
      SharedMethod.showSnackBar(title: "Password lama dan baru serupa", description: "Silahkan merubah kembali password Anda");
    } else {
      isLoading(true);

      Future.delayed(const Duration(milliseconds: 1000), () async {
        try {
          UserServices userService = UserServices();

          var result = await userService.changePasswordS(
            id: StorageServices().getId(),
            oldPassword: oldPasswordTextEditingController.text.trim(),
            newPassword: newPasswordTextEditingController.text.trim(),
          );

          if (result.isSuccess == true) {
            oldPasswordTextEditingController.clear();
            newPasswordTextEditingController.clear();
            confirmNewPasswordTextEditingController.clear();
          }

          SharedMethod.showSnackBar(title: result.message, description: "Informasi dari server");
        } catch (error) {
          if (kDebugMode) {
            print(error);
          }
        } finally {
          isLoading(false);
        }
      });
    }

    update();
  }

  void unFocusTextField() {
    oldPasswordFocus.unfocus();
    newPasswordFocus.unfocus();
    confirmNewPasswordFocus.unfocus();
  }

  void checkPasswordVisibility() {
    passwordVisibility.value = !passwordVisibility.value;
  }
}
