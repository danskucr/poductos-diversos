import 'package:firebase_messaging/firebase_messaging.dart';

Future<void> handleBackgroundMessage(RemoteMessage remoteMessage) async {
  print('Title ${remoteMessage.notification?.title}');
  print('Body ${remoteMessage.notification?.body}');
  print('Payload ${remoteMessage.data}');

}
class FirebaseApi {
  final _firebaseMessaging = FirebaseMessaging.instance;

  Future<void> initNotification() async {
    await _firebaseMessaging.requestPermission();
    final fCMToken = await _firebaseMessaging.getToken();
    print('Token = $fCMToken');
    FirebaseMessaging.onBackgroundMessage(handleBackgroundMessage);
  }
  
}