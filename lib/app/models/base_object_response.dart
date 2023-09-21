import 'package:dikitis/app/utils/utils.dart';

class BaseObjectResponse<T> {
  final bool isSuccess;
  final String message;
  final T? data;

  BaseObjectResponse({
    this.isSuccess = false,
    this.message = "",
    this.data,
  });

  factory BaseObjectResponse.fromJson(Map<String, dynamic> json, Function(Map<String, dynamic>) build) => BaseObjectResponse<T>(
        isSuccess: json["is_success"].toString().parseBool(),
        message: json["message"],
        data: json["data"] != [] ? build(json["data"]) : T,
      );
}
