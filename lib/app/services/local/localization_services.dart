import 'package:dikitis/app/constants/constants.dart';
import 'package:dikitis/app/constants/translation/en_translation.dart';
import 'package:dikitis/app/constants/translation/id_translation.dart';
import 'package:dikitis/app/services/local/storage_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LocalizationServices extends Translations {
  // static const locale = Locale('en', 'US');
  static const engLocale = Locale('en', 'US');
  static const idLocale = Locale('id', 'ID');

  //fallbacksLocale saves the day when the locale gets in trouble
  // static const fallbackLocale = Locale('id', 'ID');
  //
  static final langs = ["English", "Indonesian"];
  static final iconLangs = [
    AssetsPath.icons.englishFlag,
    AssetsPath.icons.indonesianFlag,
  ];

  //supported locale
  static const locales = [engLocale, idLocale];

  void changeLocale(String lang) {
    final locale = _getLocaleFromLanguage(lang);
    Get.updateLocale(locale!);
    StorageServices().setLanguage(lang);
  }

  Locale? _getLocaleFromLanguage(String lang) {
    for (int i = 0; i < langs.length; i++) {
      if (lang == langs[i]) {
        return locales[i];
      }
    }
    return Get.locale;
  }

  @override
  Map<String, Map<String, String>> get keys => {'id_ID': id, 'en_US': en};
}
