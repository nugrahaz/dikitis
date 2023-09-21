import 'package:dikitis/app/constants/constants.dart';
import 'package:dikitis/app/models/base_object_response.dart';
import 'package:dikitis/app/models/email_verification_model.dart';
import 'package:dikitis/app/services/remote/api_base_helper.dart';
import 'package:flutter/foundation.dart';

class VerificationServices {
  final ApiBaseHelper _helper = ApiBaseHelper();

  Future<BaseObjectResponse<Verification>> createCodeVerificationS(Verification verification) async {
    try {
      final response = await _helper.post(
        url: ApiPath.createVerification,
        body: {
          'user_email': verification.email,
          'verification_code': verification.codeVerification.toString(),
        },
      );

      BaseObjectResponse basicResponse = BaseObjectResponse<Verification>.fromJson(
        response,
        (data) => Verification.fromJson(data),
      );

      return BaseObjectResponse(
        data: basicResponse.data,
        message: basicResponse.message,
        isSuccess: basicResponse.isSuccess,
      );
    } catch (error) {
      if (kDebugMode) {
        print(error.toString());
      }

      return BaseObjectResponse(message: error.toString());
    }
  }

  Future<BaseObjectResponse> updateVerificationS(String email) async {
    final response = await _helper.post(url: ApiPath.verificationAccount.toString(), body: {
      'user_email': email,
    });

    var basicResponse = BaseObjectResponse<Verification>.fromJson(response, (data) => Verification.fromJson(data));

    return BaseObjectResponse(data: basicResponse.data, message: basicResponse.message, isSuccess: basicResponse.isSuccess);
  }
}
