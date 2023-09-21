// ignore_for_file: unused_import

import 'package:dikitis/app/constants/constants.dart';
import 'package:dikitis/app/services/local/localization_services.dart';
import 'package:dikitis/app/services/local/storage_service.dart';
import 'package:dikitis/app/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      enableLog: false,
      //
      color: AppStyles.colors.bgDark,
      theme: AppStyles.theme.defaultTheme,
      defaultTransition: Transition.fadeIn,
      //
      locale: StorageServices().getLanguage() == LocalizationServices.langs.first ? LocalizationServices.engLocale : LocalizationServices.idLocale,
      fallbackLocale: LocalizationServices.idLocale,
      translations: LocalizationServices(),
      //
      getPages: AppRoutes.getPages,
      initialRoute: AppRoutes.splashPage,
      // initialBinding: SplashBinding(),
      //
    );
  }
}
