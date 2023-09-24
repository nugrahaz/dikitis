import 'package:dikitis/app/constants/constants.dart';
import 'package:dikitis/app/modules/authentication/controllers/authentication_controller.dart';
import 'package:dikitis/app/modules/theme/controllers/theme_controller.dart';
import 'package:dikitis/app/utils/utils.dart';
import 'package:dikitis/app/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class AuthenticationPage extends StatefulWidget {
  const AuthenticationPage({Key? key}) : super(key: key);

  @override
  State<AuthenticationPage> createState() => _AuthenticationScreen();
}

class _AuthenticationScreen extends State<AuthenticationPage> {
  final AuthenticationController _authController = AuthenticationController.to;
  final ThemeController themeController = ThemeController.to;

  @override
  void initState() {
    SharedMethod.systemBarColor(AppStyles.colors.transparent, AppStyles.colors.bgDark);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    bool isKeyboardShowing = MediaQuery.of(context).viewInsets.vertical > 0;

    return WillPopScope(
      onWillPop: () {
        _authController.unFocusTextField();
        SharedMethod.customDialog(
          colorStatusBar: AppStyles.colors.transparent,
          colorNavigationBar: AppStyles.colors.bgDark,
        );
        return Future<bool>.value(true);
      },
      child: Scaffold(
        backgroundColor: AppStyles.colors.bgDark,
        drawerScrimColor: AppStyles.colors.bgDark,
        body: Stack(
          children: [
            //gambar pojok kiri atas
            Positioned(
              top: -2.5.hp,
              left: -7.0.wp,
              child: Image.asset(
                AssetsPath.images.flowTop,
                color: themeController.getMainColor.withOpacity(0.2),
                width: 35.0.wp,
              ),
            ),
            //gambar pojok kanan bawah
            Positioned(
              bottom: -2.0.hp,
              right: -7.0.wp,
              child: Image.asset(
                AssetsPath.images.flowBottom,
                width: 40.0.wp,
                color: themeController.getMainColor.withOpacity(0.2),
              ),
            ),

            Obx(() => Container(
                  padding: EdgeInsets.symmetric(horizontal: 6.0.wp),
                  child: Center(
                    child: SingleChildScrollView(
                      physics: const NeverScrollableScrollPhysics(),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          SizedBox(height: 3.0.hp),
                          AnimatedContainer(
                            duration: 200.milliseconds,
                            height: (_authController.isLoginScreen.value)
                                ? 65.0.wp
                                : !isKeyboardShowing
                                    ? 55.0.wp
                                    : 45.0.wp,
                            child: Lottie.asset(
                              AssetsPath.lotties.doctor,
                              reverse: false,
                              fit: BoxFit.cover,
                            ),
                          ),
                          AnimatedContainer(duration: 400.milliseconds, height: isKeyboardShowing ? 1.0.hp : 2.5.hp),
                          AnimatedContainer(
                            duration: 200.milliseconds,
                            height: (_authController.isLoginScreen.value == false) ? 20.0.wp : 0,
                            child: (_authController.isLoginScreen.value == false)
                                ? CustomTextField(
                                    controller: _authController.fullnameTextEditingController,
                                    hintText: "fullname".tr,
                                    colorIcon: themeController.getMainColor,
                                    currentNode: _authController.fullnameFocus,
                                    nextNode: _authController.emailFocus,
                                    useSuffixIcon: false,
                                    textCapitalization: TextCapitalization.words,
                                    filteringTextInputFormatter: [
                                      FilteringTextInputFormatter.allow(RegExp('[a-z A-Z (space)]')),
                                    ],
                                  )
                                : Container(),
                          ),
                          CustomTextField(
                            controller: _authController.emailTextEditingController,
                            icon: Icons.email_outlined,
                            hintText: "email".tr,
                            colorIcon: themeController.getMainColor,
                            currentNode: _authController.emailFocus,
                            nextNode: _authController.passwordFocus,
                            useSuffixIcon: false,
                            filteringTextInputFormatter: [FilteringTextInputFormatter.deny(RegExp(r"\s\b|\b\s"))],
                          ),
                          CustomTextField(
                            controller: _authController.passwordTextEditingController,
                            hintText: "password".tr,
                            visibility: _authController.passwordVisibility.value,
                            currentNode: _authController.passwordFocus,
                            icon: Icons.lock_rounded,
                            colorIcon: themeController.getMainColor,
                            useSuffixIcon: true,
                            iconSuffix: _authController.passwordVisibility.value == false ? Icons.remove_red_eye_outlined : Icons.remove_red_eye,
                            function: () {
                              _authController.checkPasswordVisibility();
                            },
                            filteringTextInputFormatter: [FilteringTextInputFormatter.deny(RegExp(r"\s\b|\b\s"))],
                            nextNode: null,
                          ),
                          SizedBox(
                            height: 1.5.hp,
                          ),
                          //awalnya pake widget visibility
                          //cuman berhubung A13 menyisipkan
                          //soft animation di keyboard jadi janky
                          AnimatedContainer(
                            duration: 200.milliseconds,
                            height: isKeyboardShowing ? 0 : 27.0.wp,
                            child: Container(
                              color: AppStyles.colors.transparent,
                              child: SingleChildScrollView(
                                physics: const NeverScrollableScrollPhysics(), // fix scroll
                                child: Column(
                                  children: [
                                    (_authController.isLoading.value)
                                        ? SizedBox(
                                            height: 14.0.wp,
                                            child: Center(
                                              child: SpinKitWave(
                                                color: AppStyles.colors.white,
                                                size: 6.0.wp,
                                              ),
                                            ),
                                          )
                                        : CustomButton(
                                            onlyIcon: false,
                                            borderRadius: 12,
                                            height: 14.0.wp,
                                            color: themeController.getMainColor,
                                            borderColor: themeController.getMainColor,
                                            titleColor: AppStyles.colors.bgDark,
                                            title: (_authController.isLoginScreen.value) ? "login".tr : "registration".tr,
                                            function: () async {
                                              if (!Get.isSnackbarOpen) {
                                                _authController.unFocusTextField();

                                                if (_authController.isLoginScreen.value) {
                                                  SharedMethod.checkConnectionBeforeExecute(_authController.loginC);
                                                } else {
                                                  SharedMethod.checkConnectionBeforeExecute(_authController.registrationC);
                                                }
                                              }
                                            }),
                                    SizedBox(height: 4.0.wp),
                                    GestureDetector(
                                      onTap: () {
                                        _authController.switchScreen();
                                      },
                                      child: Container(
                                        padding: EdgeInsets.all(3.0.wp),
                                        color: AppStyles.colors.transparent,
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Text((_authController.isLoginScreen.value) ? "dontHaveAnAccount".tr : "alreadyHaveAnAccount".tr,
                                                style: AppStyles.textStyles.poppinsMedium.copyWith(
                                                    color: AppStyles.colors.white,
                                                    fontWeight: FontWeight.w600,
                                                    letterSpacing: 0.3,
                                                    wordSpacing: 0.3,
                                                    fontSize: 3.4.wp)),
                                            Text(
                                              (_authController.isLoginScreen.value) ? "registration".tr : "login".tr,
                                              style: AppStyles.textStyles.poppinsSemiBold.copyWith(
                                                  color: themeController.getMainColor,
                                                  fontWeight: FontWeight.bold,
                                                  letterSpacing: 0.2,
                                                  wordSpacing: 0.2,
                                                  fontSize: 3.4.wp),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
