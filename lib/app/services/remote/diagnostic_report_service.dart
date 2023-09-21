import 'package:dikitis/app/constants/constants.dart';
import 'package:dikitis/app/models/base_list_response.dart';
import 'package:dikitis/app/models/base_object_response.dart';
import 'package:dikitis/app/models/diagnostic_report_model.dart';
import 'package:dikitis/app/services/remote/api_base_helper.dart';

class DiagnosticReportService {
  final ApiBaseHelper _helper = ApiBaseHelper();

  Future<BaseObjectResponse<DiagnosticReport>> createDiagnosticReport({required DiagnosticReport data}) async {
    final request = await _helper.post(
      url: ApiPath.createDiagnosticReport,
      body: {
        'user_id': data.userId,
        'diagnostic_datetime': data.diagnosticDatetime,
        'diagnostic_information': data.diagnosticInformation,
      },
    );

    BaseObjectResponse<DiagnosticReport> response = BaseObjectResponse<DiagnosticReport>.fromJson(
      request,
      (data) => DiagnosticReport.fromJson(data),
    );

    return BaseObjectResponse(data: response.data, message: response.message, isSuccess: response.isSuccess);
  }

  Future<BaseListResponse<DiagnosticReport>> readDiagnosticReport() async {
    final resp = await _helper.get(
      url: ApiPath.readDiagnosticReport,
    );

    var responseData = BaseListResponse<DiagnosticReport>.fromJson(resp, (data) {
      List<DiagnosticReport> list = data.map((e) => DiagnosticReport.fromJson(e)).toList();
      return list;
    });

    return BaseListResponse(data: responseData.data, message: responseData.message, isSuccess: responseData.isSuccess);
  }

  Future<BaseObjectResponse<DiagnosticReport>> deleteDiagnosticReport(String id) async {
    final request = await _helper.post(
      url: ApiPath.deleteDiagnosticReport,
      body: {
        'diagnostic_id': id,
      },
    );

    BaseObjectResponse response = BaseObjectResponse<DiagnosticReport>.fromJson(
      request,
      (data) => DiagnosticReport.fromJson(data),
    );

    return BaseObjectResponse(data: response.data, message: response.message, isSuccess: response.isSuccess);
  }
}
