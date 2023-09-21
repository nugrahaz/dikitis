import 'package:awesome_notifications/awesome_notifications.dart';

class NotificationService {
  void sendNotification({required String title, required String description}) {
    AwesomeNotifications().isNotificationAllowed().then((isAllowed) {
      if (!isAllowed) {
        AwesomeNotifications().requestPermissionToSendNotifications();
      } else {
        AwesomeNotifications().createNotification(
          content:
          NotificationContent(id: 1,
              channelKey: 'dikitis_channel',
              autoDismissible: true,
              title: title.toString(),
              body: description.toString()),
        );
      }
    });
  }
}
