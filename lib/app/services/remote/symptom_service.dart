import 'package:dikitis/app/constants/constants.dart';
import 'package:dikitis/app/models/base_list_response.dart';
import 'package:dikitis/app/models/symptom_model.dart';
import 'package:dikitis/app/services/remote/api_base_helper.dart';

class SymptomServices {
  final ApiBaseHelper _helper = ApiBaseHelper();

  Future<BaseListResponse<Symptom>> readS() async {
    final resp = await _helper.get(
      url: ApiPath.readSymptom,
    );

    var responseData = BaseListResponse<Symptom>.fromJson(resp, (data) {
      List<Symptom> list = data.map((e) => Symptom.fromJson(e)).toList();
      return list;
    });

    return BaseListResponse(
        data: responseData.data,
        message: responseData.message,
        isSuccess: responseData.isSuccess);
  }
}
