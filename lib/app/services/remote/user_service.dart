import 'dart:convert';
import 'dart:io';

import 'package:dikitis/app/constants/constants.dart';
import 'package:dikitis/app/models/base_list_response.dart';
import 'package:dikitis/app/models/base_object_response.dart';
import 'package:dikitis/app/models/user_model.dart';
import 'package:http/http.dart' as http;

import 'api_base_helper.dart';

class UserServices {
  final ApiBaseHelper _helper = ApiBaseHelper();

  Future<BaseObjectResponse<User>> loginS({required User user}) async {
    //
    final response = await _helper.post(
      url: ApiPath.login,
      body: {
        'user_email': user.email,
        'user_password': user.password,
      },
    );

    BaseObjectResponse<User> basicResponse = BaseObjectResponse<User>.fromJson(
      response,
      (data) => User.fromJson(data),
    );

    return BaseObjectResponse(
      data: basicResponse.data,
      message: basicResponse.message,
      isSuccess: basicResponse.isSuccess,
    );
  }

  Future<BaseObjectResponse> registrationS({required Patient patient}) async {
    final response = await _helper.post(
      url: ApiPath.registration,
      body: {
        'user_id': patient.id,
        'user_email': patient.email,
        'user_password': patient.password,
        'user_role': patient.role,
        'user_is_active': patient.isActive.toString(), //diubah ke string
        //
        'patient_fullname': patient.fullname,
        'patient_photo_url': patient.photoUrl,
        'patient_address': patient.address,
      },
    );

    BaseObjectResponse basicResponse = BaseObjectResponse<Patient>.fromJson(
      response,
      (data) => Patient.fromJson(data),
    );

    return BaseObjectResponse(data: basicResponse.data, message: basicResponse.message, isSuccess: basicResponse.isSuccess);
  }

  Future<BaseObjectResponse<Patient>> userUpdateS({required Patient user, required File file}) async {
    var request = http.MultipartRequest(
        'POST',
        Uri.parse(
          ApiPath.updateAccount.toString(),
        ));
    request.fields['user_id'] = user.id.toString();
    request.fields['patient_fullname'] = user.fullname.toString();
    request.fields['patient_photo_url'] = user.photoUrl.toString();

    var pic = await http.MultipartFile.fromPath("image", file.path);
    request.files.add(pic);
    var streamedResponse = await request.send();

    var response = await http.Response.fromStream(streamedResponse);
    var result = jsonDecode(response.body);

    BaseObjectResponse<Patient> basicResponse = BaseObjectResponse<Patient>.fromJson(result, (data) => Patient.fromJson(data));

    return BaseObjectResponse(data: basicResponse.data, message: basicResponse.message, isSuccess: basicResponse.isSuccess);
  }

  Future<BaseObjectResponse> changePasswordS({required String id, required String oldPassword, required String newPassword}) async {
    final response = await _helper.post(
        url: ApiPath.updatePasswordAccount.toString(), body: {'user_id': id, 'user_old_password': oldPassword, 'user_new_password': newPassword});

    var basicResponse = BaseObjectResponse<Patient>.fromJson(response, (data) => Patient.fromJson(data));

    return BaseObjectResponse(data: basicResponse.data, message: basicResponse.message, isSuccess: basicResponse.isSuccess);
  }

  Future<BaseListResponse<Doctor>> readUserDoctorS() async {
    final resp = await _helper.get(
      url: ApiPath.readUserDoctor.toString(),
    );

    var responseData = BaseListResponse<Doctor>.fromJson(resp, (data) {
      List<Doctor> list = data.map((e) => Doctor.fromJson(e)).toList();
      return list;
    });

    return BaseListResponse(data: responseData.data, message: responseData.message, isSuccess: responseData.isSuccess);
  }

  Future<BaseObjectResponse<Patient>> readUserData({required String idUser}) async {
    final resp = await _helper.get(
      url: ApiPath.readUserPatient.toString(),
    );

    BaseListResponse<Patient> responseData = BaseListResponse<Patient>.fromJson(resp, (data) {
      List<Patient> list = data.map((e) => Patient.fromJson(e)).toList();
      return list;
    });
    Patient dataPatient = Patient();

    responseData.data?.forEach((Patient patient) {
      if (patient.id!.toLowerCase() == idUser.toLowerCase()) {
        dataPatient = Patient(
            id: patient.id.toString(),
            email: patient.email.toString(),
            fullname: patient.fullname.toString(),
            photoUrl: patient.photoUrl.toString(),
            address: patient.address);
      }
    });

    // print("2 : " + dataPatient.fullname.toString());
    // print("2 : " + dataPatient.photoUrl.toString());
    // print("2 : " + dataPatient.address.toString());

    return BaseObjectResponse(
      data: dataPatient,
      message: responseData.message,
      isSuccess: responseData.isSuccess,
    );
  }
}
