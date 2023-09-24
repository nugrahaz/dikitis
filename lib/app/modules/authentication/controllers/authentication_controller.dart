import 'package:dikitis/app/constants/constants.dart';
import 'package:dikitis/app/models/base_object_response.dart';
import 'package:dikitis/app/models/user_model.dart';
import 'package:dikitis/app/services/local/storage_service.dart';
import 'package:dikitis/app/services/remote/user_service.dart';
import 'package:dikitis/app/utils/utils.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthenticationController extends GetxController {
  static final AuthenticationController to = Get.find<AuthenticationController>();

  late TextEditingController fullnameTextEditingController;
  late TextEditingController emailTextEditingController;
  late TextEditingController passwordTextEditingController;

  late FocusNode fullnameFocus;
  late FocusNode emailFocus;
  late FocusNode passwordFocus;

  RxBool isLoading = false.obs;
  RxBool passwordVisibility = true.obs;
  RxBool isLoginScreen = true.obs;

  @override
  void onInit() {
    fullnameTextEditingController = TextEditingController();
    emailTextEditingController = TextEditingController();
    passwordTextEditingController = TextEditingController();
    fullnameFocus = FocusNode();
    emailFocus = FocusNode();
    passwordFocus = FocusNode();
    super.onInit();
  }

  @override
  void onClose() {
    unFocusTextField();
    Get.delete<AuthenticationController>();
    super.onClose();
  }

  Future<void> loginC() async {
    if (emailTextEditingController.text.isEmpty) {
      SharedMethod.showSnackBar(title: "emailNull".tr, description: "fieldNull".tr);
    } else if (passwordTextEditingController.text.isEmpty) {
      SharedMethod.showSnackBar(title: "passwordNull".tr, description: "fieldNull".tr);
    } else {
      if (!GetUtils.isEmail(emailTextEditingController.text)) {
        SharedMethod.showSnackBar(title: "emailInvalid".tr, description: "emailInvalidDesc".tr);
      } else {
        isLoading(true);
        Future.delayed(const Duration(milliseconds: 1000), () async {
          try {
            UserServices userService = UserServices();
            BaseObjectResponse<User> result = await userService.loginS(
              user: User(
                email: emailTextEditingController.text.toLowerCase(),
                password: passwordTextEditingController.text,
              ),
            );

            if (result.isSuccess == true) {
              if (result.data?.role == "patient") {
                //check akun sudah aktif
                if (result.data?.isActive == 1) {
                  // save user ke local storage
                  StorageServices().setIsLogged(true).then(
                        (_) => setUserInformation(id: result.data!.id.toString()).then((value) => {Get.offNamed(AppRoutes.mainPage)}),
                      );
                  clearTextField();
                } else {
                  //belum verifikasi
                  SharedMethod.customDialog(
                      title: 'verificationAccount'.tr,
                      description: 'verificationAccountDesc'.tr,
                      function: () {
                        Get.back();
                        //
                        Patient patient = Patient(
                          email: emailTextEditingController.text,
                          password: passwordTextEditingController.text,
                          fullname: fullnameTextEditingController.text,
                        );

                        StorageServices().setIsLogged(true).then(
                              (_) => StorageServices().saveUserData(patient: patient).then(
                                    (value) => Get.toNamed(
                                      AppRoutes.userVerificationPage,
                                      arguments: emailTextEditingController.text,
                                      // email: user.email.toString(),
                                    ),
                                  ),
                            );
                      },
                      buttonText: 'continueVerification'.tr,
                      imagePath: AssetsPath.lotties.settings,
                      colorStatusBar: AppStyles.colors.transparent,
                      colorNavigationBar: AppStyles.colors.bgDark);
                }
              } else {
                SharedMethod.showSnackBar(title: "roleInvalid".tr, description: "roleInvalidDesc".tr);
              }
            } else {
              SharedMethod.showSnackBar(title: result.message, description: "Informasi dari server");
            }
          } catch (error) {
            debugPrint(error.toString());
          } finally {
            Future.delayed(750.milliseconds, () {
              isLoading(false);
            });
          }
        });
      }
    }
  }

  Future<void> registrationC() async {
    if (fullnameTextEditingController.text.isEmpty) {
      SharedMethod.showSnackBar(title: "fullnameNull".tr, description: "fieldNull".tr);
    } else if (emailTextEditingController.text.isEmpty) {
      SharedMethod.showSnackBar(title: "emailNull".tr, description: "fieldNull".tr);
    } else if (passwordTextEditingController.text.isEmpty) {
      SharedMethod.showSnackBar(title: "passwordNull".tr, description: "fieldNull".tr);
    } else if (passwordTextEditingController.text.length < 8) {
      SharedMethod.showSnackBar(title: "Password minimal 8 karakter", description: "Silahkan perbaiki password Anda");
    } else {
      if (!GetUtils.isEmail(emailTextEditingController.text)) {
        SharedMethod.showSnackBar(title: "emailInvalid".tr, description: "emailInvalidDesc".tr);
      } else {
        isLoading(true);

        Patient patient = Patient(
            id: "P-${DateTime.now().millisecondsSinceEpoch}",
            email: emailTextEditingController.text.toLowerCase(),
            password: passwordTextEditingController.text,
            role: "patient",
            isActive: 0,
            //
            fullname: fullnameTextEditingController.text,
            photoUrl: "",
            address: "");

        Future.delayed(const Duration(milliseconds: 1500), () async {
          try {
            UserServices().registrationS(patient: patient).then((BaseObjectResponse response) async {
              //
              if (response.isSuccess == true) {
                clearTextField();
                StorageServices().saveUserData(patient: patient).then(
                      (value) => Get.toNamed(
                        AppRoutes.userVerificationPage,
                        arguments: patient.email.toString(),
                      ),
                    );
              } else {
                SharedMethod.showSnackBar(
                  title: response.message,
                  description: "Informasi dari server",
                );
              }
            });
          } catch (error) {
            if (kDebugMode) {
              print(error);
            }
            SharedMethod.showSnackBar(
              title: error.toString(),
              description: "",
            );
          } finally {
            Future.delayed(750.milliseconds, () {
              isLoading(false);
            });
          }
        });
      }
    }
    update();
  }

  void switchScreen() {
    isLoginScreen.value = !isLoginScreen.value;
    unFocusTextField(); //memperbaiki auto focus pas di klik back
  }

  void unFocusTextField() {
    emailFocus.unfocus();
    fullnameFocus.unfocus();
    passwordFocus.unfocus();
  }

  void clearTextField() {
    emailTextEditingController.clear();
    fullnameTextEditingController.clear();
    passwordTextEditingController.clear();
  }

  void checkPasswordVisibility() => passwordVisibility.value = !passwordVisibility.value;

  Future<void> setUserInformation({required String id}) async {
    try {
      var checkId = StorageServices().getId();

      if (checkId.isEmpty || checkId == "") {
        UserServices userService = UserServices();
        var result = await userService.readUserData(idUser: id);
        StorageServices().saveUserData(patient: result.data!);
        update();
      }
    } catch (error) {
      if (kDebugMode) {
        print(error);
      }
    } finally {
      isLoading(false);
    }
  }
}
