import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:dikitis/app/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_storage/get_storage.dart';

import 'app.dart';

void main() async {
  await init();
  runApp(const App());
}

Future<void> init() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  //
  AwesomeNotifications().initialize(
    null,
    [
      NotificationChannel(
          channelGroupKey: 'dikitis_channel_group',
          channelKey: 'dikitis_channel',
          channelName: 'Dikitis Notification',
          channelDescription: 'Notifications for basic testing',
          defaultColor: AppStyles.colors.cyan,
          ledColor: AppStyles.colors.white)
    ],
    channelGroups: [
      NotificationChannelGroup(
        channelGroupKey: 'dikitis_channel_group',
        channelGroupName: 'Dikitis Group Notification',
      ),
    ],
    debug: true,
  );
}
