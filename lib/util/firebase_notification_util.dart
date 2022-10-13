import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class FirebaseNotificationUtil {
  static Future<void> notificationBackgroundHandler(
      RemoteMessage remoteMessage) async {
    print('Title::: ${remoteMessage.notification!.title}');
  }

  static Future init() async {
    await Firebase.initializeApp();

    FirebaseMessaging.onBackgroundMessage(
        (message) => notificationBackgroundHandler(message));
  }

  static void getInitialMessage() {
    FirebaseMessaging.instance.getInitialMessage().then((message) {
      print('getInitialMessage::: ${message!.notification!.title}');
    });
  }

  static void getOnMessage() {
    FirebaseMessaging.onMessage.listen((message) {});
  }

  static void getOnMessageOpenedApp() {
    FirebaseMessaging.onMessageOpenedApp.listen((message) {
      print('onMessageOpenedApp_TITLE::: ${message.notification!.title}');
      print('onMessageOpenedApp_BODY::: ${message.notification!.body}');
    });
  }
}
