import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class NotificationUtil {
  static final _localNotification = FlutterLocalNotificationsPlugin();

  static void init() {
    tz.initializeTimeZones();

    var initializationSettingAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');
    var initializationSettingiOS = IOSInitializationSettings();
    var initializationSetting = InitializationSettings(
        android: initializationSettingAndroid, iOS: initializationSettingiOS);
    _localNotification.initialize(
      initializationSetting,
      onSelectNotification: (payload) async {
        print('NotificationClicked');
      },
    );
  }

  static NotificationDetails _notificationDetails() {
    return NotificationDetails(
      android: AndroidNotificationDetails(
        'channel_id',
        'channel_name',
        channelDescription: 'channel_description',
        importance: Importance.high,
        color: Colors.red,
        enableLights: true,
        progress: 52,
        maxProgress: 100,
        usesChronometer: true,
        enableVibration: true,
        showProgress: true,
        fullScreenIntent: true,
      ),
      iOS: IOSNotificationDetails(),
    );
  }

  static Future<void> showDelayedNotification(
      {int id = 0,
      required DateTime scheduleDate,
      required String title,
      required String body}) {
    print('inside__showDelayedNotification');
    return _localNotification.zonedSchedule(
      id,
      title,
      body,
      tz.TZDateTime.from(scheduleDate, tz.local),
      _notificationDetails(),
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
      androidAllowWhileIdle: true,
    );
  }

  static Future<void> showNotification(
      {int id = 0, required String title, required String body}) {
    return _localNotification.show(
      id,
      title,
      body,
      _notificationDetails(),
    );
  }
}
