import 'package:dikitis/app/models/user_model.dart';
import 'package:flutter/foundation.dart';
import 'package:get_storage/get_storage.dart';

class StorageServices {
  var box = GetStorage();

  final String _idKey = "id";
  final String _emailKey = "email";
  final String _roleKey = "role";

  //
  final String _fullnameKey = "fullname";
  final String _photoUrlKey = "photoUrl";
  final String _addressKey = "address";

  //
  final String _isLoggedKey = "isLogged";
  final String _languageKey = "languageKey";
  final String _themeKey = "themeKey";

  //Tema (save hex saja)
  void setTheme(String hex) async {
    box.write(_themeKey, hex);
  }

  String getTheme() {
    return box.read(_themeKey) ?? "#00b9bc";
  }

  //Bahasa
  void setLanguage(String lang) async {
    box.write(_languageKey, lang);
  }

  String getLanguage() {
    //bahasa inisialiasi English
    return box.read(_languageKey) ?? "English";
  }

  //Sudah login?
  Future<void> setIsLogged(bool status) async {
    box.write(_isLoggedKey, status);
  }

  Future<bool> getIsLogged() async {
    bool status = box.read(_isLoggedKey) ?? false;
    return status;
  }

  //menandai page telah dilihat
  Future<void> pageHasSeen(String page) async {
    box.writeIfNull(page, true);
  }

  //check jika sudah dilihat
  bool checkPageSeen(String page) {
    var status = box.read(page) ?? false;
    return status;
  }

  Future<void> setID(String id) async {
    box.write(_idKey, id);
  }

  String getId() {
    return box.read(_idKey) ?? "";
  }

  Future<void> setFullname(String fullname) async {
    box.write(_fullnameKey, fullname);
  }

  String getFullname() {
    return box.read(_fullnameKey) ?? "";
  }

  Future<void> setEmail(String email) async {
    box.write(_emailKey, email);
  }

  String getEmail() {
    return box.read(_emailKey);
  }

  Future<void> setPhotoUrl(String url) async {
    box.write(_photoUrlKey, url);
  }

  String getPhotoUrl() {
    return box.read(_photoUrlKey) ?? "";
  }

  Future<void> saveUserData({required Patient patient}) async {
    box.write(_idKey, patient.id);
    box.write(_emailKey, patient.email);
    box.write(_roleKey, patient.role ?? "patient");
    //
    box.write(_fullnameKey, patient.fullname ?? "");
    box.write(_photoUrlKey, patient.photoUrl ?? "");
    box.write(_addressKey, patient.address ?? "");
  }

  Patient getUserData() {
    Patient userData = Patient(
        id: box.read(_idKey),
        email: box.read(_emailKey),
        role: box.read(_roleKey),
        fullname: box.read(_fullnameKey),
        photoUrl: box.read(_photoUrlKey),
        address: box.read(
          _addressKey,
        ));

    //

    if (kDebugMode) {
      print(userData.id);
      print(userData.email);
      print(userData.role);
      print(userData.fullname);
      print(userData.photoUrl);
      print(userData.address);
    }

    return userData;
  }

  Future<void> clearUserData() async {
    box.remove(_idKey);
    box.remove(_emailKey);
    box.remove(_roleKey);

    box.remove(_fullnameKey);
    box.remove(_photoUrlKey);
    box.remove(_addressKey);

    box.write(_isLoggedKey, false);
  }
}

// Future<void> setDataUser({required User user}) async {
//   box.write(_languageKey, "Indonesian");
//   //
//   box.write(_idKey, user.id);
//   box.write(_emailKey, user.email);
//   box.write(_roleKey, user.role ?? "patient");
//
//   print(user.id);
//   print(user.email);
//   print(user.role);
// }
