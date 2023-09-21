import 'package:dikitis/app/constants/constants.dart';
import 'package:dikitis/app/models/base_list_response.dart';
import 'package:dikitis/app/models/information_model.dart';
import 'package:dikitis/app/services/remote/api_base_helper.dart';

class InformationServices {
  final ApiBaseHelper _helper = ApiBaseHelper();

  Future<BaseListResponse<Information>> readS() async {
    final resp = await _helper.get(
      url: ApiPath.readInformation,
    );

    var responseData = BaseListResponse<Information>.fromJson(resp, (data) {
      List<Information> list = data.map((e) => Information.fromJson(e)).toList();
      return list;
    });

    return BaseListResponse(
      data: responseData.data,
      message: responseData.message,
      isSuccess: responseData.isSuccess,
    );
  }
}
