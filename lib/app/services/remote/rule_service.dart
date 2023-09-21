import 'package:dikitis/app/constants/constants.dart';
import 'package:dikitis/app/models/rule_model.dart';

import '../../models/base_list_response.dart';
import 'api_base_helper.dart';

class RuleService {
  final ApiBaseHelper _helper = ApiBaseHelper();

  Future<BaseListResponse<Rule>> readS() async {
    final resp = await _helper.get(
      url: ApiPath.readDataRule,
    );

    var responseData = BaseListResponse<Rule>.fromJson(resp, (data) {
      List<Rule> list = data.map((e) => Rule.fromJson(e)).toList();
      return list;
    });

    return BaseListResponse(
        data: responseData.data,
        message: responseData.message,
        isSuccess: responseData.isSuccess);
  }
}
