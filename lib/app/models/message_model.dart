class Message {
  final String messageId;
  final String messageRoom;
  final String messageSender;
  final String messageReceiver;
  final String messageContent;
  late DateTime? messageTime;

  Message({
    this.messageId = "",
    this.messageRoom = "",
    this.messageSender = "",
    this.messageReceiver = "",
    this.messageContent = "",
    this.messageTime,
  });

  factory Message.fromJson(Map<String, dynamic> json) => Message(
        messageId: json["message_id"],
        messageRoom: json["message_room"] ?? "",
        messageSender: json["message_sender"] ?? "",
        messageReceiver: json["message_receiver"] ?? "",
        messageContent: json["message_content"] ?? "",
        messageTime: DateTime.tryParse(json["message_time"].toString()),
      );
}
