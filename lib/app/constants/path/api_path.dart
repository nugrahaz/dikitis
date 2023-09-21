part of '../constants.dart';

class ApiPath {
  //catch me if you can XP
  static const baseUrl = "";

  //User
  static var login = "$baseUrl/user/login.php";
  static var registration = "$baseUrl/user/registration.php";
  static var readUserDoctor = "$baseUrl/user/read_user_doctor.php";
  static var readUserPatient = "$baseUrl/user/read_user_patient.php";
  static var uploadImageUser = "$baseUrl/user/upload_image_user.php";
  static var updatePasswordAccount = "$baseUrl/user/update_password_user.php";
  static var updateAccount = "$baseUrl/user/update_data_user.php";

  //Symtom
  static var readSymptom = "$baseUrl/symptom/read_symptom.php";

  //Information
  static var readInformation = "$baseUrl/information/read_information.php";

  //Storage
  static var imageStorage = "$baseUrl/images_storage/";

  //Verification
  static var createVerification = "$baseUrl/verification_user/create_verification.php";

  static var verificationAccount = "$baseUrl/verification_user/update_verification.php";

  //Rule
  static var readDataRule = "$baseUrl/rule/read_rule.php";

  //Disease
  static var readTypeDisease = "$baseUrl/disease/read_type_disease.php";

  //
  static var createDiagnosticReport = "$baseUrl/diagnostic_reports/create_diagnostic_report.php";
  static var readDiagnosticReport = "$baseUrl/diagnostic_reports/read_diagnostic_report.php";
  static var deleteDiagnosticReport = "$baseUrl/diagnostic_reports/delete_diagnostic_report.php";

  //
  static var createDataMessage = "$baseUrl/message/create_message.php";
  static var readDataMessage = "$baseUrl/message/read_message.php";
}

