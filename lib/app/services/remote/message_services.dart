import 'package:dikitis/app/constants/constants.dart';
import 'package:dikitis/app/models/base_list_response.dart';
import 'package:dikitis/app/models/base_object_response.dart';
import 'package:dikitis/app/models/message_model.dart';
import 'package:dikitis/app/services/remote/api_base_helper.dart';
import 'package:intl/intl.dart';

class MessageServices {
  final ApiBaseHelper _helper = ApiBaseHelper();

  Future<BaseObjectResponse<Message>> createS(Message message) async {
    final request = await _helper.post(
      url: ApiPath.createDataMessage,
      body: {
        'message_room': message.messageRoom,
        'message_sender': message.messageSender,
        'message_receiver': message.messageReceiver,
        'message_content': message.messageContent,
        'message_time':
            DateFormat("yyyy-MM-dd HH:mm:ss").format(message.messageTime!),
      },
    );

    BaseObjectResponse<Message> response = BaseObjectResponse<Message>.fromJson(
      request,
      (data) => Message.fromJson(data),
    );

    return BaseObjectResponse(
        data: response.data,
        message: response.message,
        isSuccess: response.isSuccess);
  }

  Future<BaseListResponse<Message>> readS() async {
    final resp = await _helper.get(
      url: ApiPath.readDataMessage,
    );

    var responseData = BaseListResponse<Message>.fromJson(resp, (data) {
      List<Message> list = data.map((e) => Message.fromJson(e)).toList();
      return list;
    });

    return BaseListResponse(
        data: responseData.data,
        message: responseData.message,
        isSuccess: responseData.isSuccess);
  }
}
