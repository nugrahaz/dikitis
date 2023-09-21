import 'package:dikitis/app/constants/constants.dart';
import 'package:dikitis/app/models/base_list_response.dart';
import 'package:dikitis/app/models/disease_model.dart';
import 'package:dikitis/app/services/remote/api_base_helper.dart';

class DiseaseService {
  final ApiBaseHelper _helper = ApiBaseHelper();

  Future<BaseListResponse<Disease>> readS() async {
    final resp = await _helper.get(
      url: ApiPath.readTypeDisease,
    );

    var responseData = BaseListResponse<Disease>.fromJson(resp, (data) {
      List<Disease> list = data.map((e) => Disease.fromJson(e)).toList();
      return list;
    });

    return BaseListResponse(
        data: responseData.data,
        message: responseData.message,
        isSuccess: responseData.isSuccess);
  }
}
