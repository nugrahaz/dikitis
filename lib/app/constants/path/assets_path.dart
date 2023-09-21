part of '../constants.dart';

class AssetsPath {
  static final fontFamily = _FontFamily();
  static final html = _Htmls();
  static final lotties = _Lotties();
  static final icons = _Icons();
  static final images = _Images();
  static final document = _Document();
}

//Font Familly
class _FontFamily {
  final poppinsBold = 'poppins_bold';
  final poppinsMedium = 'poppins_medium';
  final poppinsSemiBold = 'poppins_semi_bold';
}

class _Htmls {
  static const path = 'assets/html';

  //
  final changelogs = '$path/changelogs.html';
  final disclaimer = '$path/disclaimer.html';
  final privacyPolicy = '$path/privacy_policy.html';
  final requiredPermission = '$path/required_permission.html';
  final termOfUser = '$path/term_of_use.html';
}

class _Icons {
  static const path = 'assets/icons';

  //
  final translate = '$path/translate.png';
  final indonesianFlag = '$path/indonesian.png';
  final englishFlag = '$path/english.png';
}

class _Lotties {
  static const path = 'assets/lotties';

  //
  final chat = "$path/chat.json";
  final noConnection = "$path/no_connection.json";
  final exit = "$path/exit.json";
  final medicalBag = "$path/medical_bag.json";
  final feedback = "$path/feedback.json";
  final messages = "$path/messages.json";
  final mail = "$path/mail.json";
  final checklist = "$path/checklist.json";
  final notFound = "$path/not_found.json";
  final info = "$path/info.json";
  final settings = "$path/settings.json";
  final doctor = "$path/doctor.json";
  final permission = "$path/permission.json";
  final lock = "$path/lock.json";
  final search = "$path/search.json";
  final searching = "$path/searching.json";
}

class _Images {
  static const path = 'assets/images';
  final appLogo = '$path/app_logo.png';
  final chat = '$path/onboarding_chat.png';
  final observation = '$path/onboarding_observation.png';
  final selfDiagnosis = '$path/onboarding_self_diagnosis.png';
  final campusLogo = '$path/campus_logo.png';

  //
  final information = '$path/menu_information.png';
  final diagnosis = '$path/menu_diagnosis.png';
  final messaging = '$path/menu_messaging.png';

  //
  final medicalDoctor = '$path/medical_doctor.png';
  final history = '$path/history.png';

  //
  final flowBottom = '$path/flow_bottom.png';
  final flowTop = '$path/flow_top.png';

  //
  final activityHistory = '$path/activity_history.png';
  final healthCheckup = '$path/health_checkup.png';
}

class _Document {
  static const path = 'assets/documents';
  final consultation = '$path/consultation.pdf';
  final diagnosis = '$path/diagnosis.pdf';
  final history = '$path/history.pdf';
  final information = '$path/information.pdf';
}
