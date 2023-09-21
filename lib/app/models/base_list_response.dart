import 'package:dikitis/app/utils/utils.dart';

class BaseListResponse<T> {
  final bool isSuccess;
  final String message;
  final List<T>? data;

  BaseListResponse({
    required this.isSuccess,
    required this.message,
    required this.data,
  });

  factory BaseListResponse.fromJson(
          Map<String, dynamic> json, Function(List<dynamic>) build) =>
      BaseListResponse<T>(
        isSuccess: (json["is_success"]).toString().parseBool(),
        message: json["message"],
        data: build(json["data"]),
      );
}
