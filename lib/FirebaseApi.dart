import 'dart:convert';
import 'dart:developer';

import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:googleapis_auth/auth_io.dart';

class FirebaseApi {
  final _firebaseMessage = FirebaseMessaging.instance;
  final _messageStream = FirebaseMessaging.onMessage;
  static String? userToken;
  static String? adminToken;

  Stream<RemoteMessage> get messageStream => _messageStream;

  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  Future<void> initNotification() async {
    await _firebaseMessage.requestPermission();
    await _initLocalNotification();

    userToken = await _firebaseMessage.getToken();
    log('FCM Token: $userToken');

    iniPushNotification();

    // Subscribe to the "allusers" topic
    await _firebaseMessage.subscribeToTopic('allusers');
    log('Subscribed to topic: allusers');

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      log('Foreground message received: ${message.data}');
      showNotification(message);
    });
  }

  void handleNotification(RemoteMessage? message) {
    if (message == null) return;

    log('Notification received: ${message.data}');
    showNotification(message);
  }

  Future iniPushNotification() async {
    FirebaseMessaging.instance.getInitialMessage().then(handleNotification);
    FirebaseMessaging.onMessageOpenedApp.listen(handleNotification);
  }

  Future<void> _initLocalNotification() async {
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');

    const InitializationSettings initializationSettings =
        InitializationSettings(android: initializationSettingsAndroid);

    await flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: (NotificationResponse response) async {
        final payload = response.payload;
        log('Notification clicked with payload: $payload');
      },
    );
  }

  Future<void> showNotification(RemoteMessage message) async {
    const AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails(
          'your_channel_id', //
          'your_channel_name', //
          channelDescription: 'your_channel_description',
          importance: Importance.max,
          priority: Priority.high,
          ticker: 'ticker',
        );

    const NotificationDetails platformChannelSpecifics = NotificationDetails(
      android: androidPlatformChannelSpecifics,
    );

    await flutterLocalNotificationsPlugin.show(
      0,
      message.notification?.title ?? 'New Notification',
      message.notification?.body ?? '',
      platformChannelSpecifics,
      payload: message.data.toString(),
    );
  }

  Future<Map<String, dynamic>> readServiceAccountFromAssets() async {
    final ByteData byteData = await rootBundle.load(
      'assets/service_account.json',
    );
    final String jsonStr = utf8.decode(byteData.buffer.asUint8List());
    return jsonDecode(jsonStr);
  }
}

class FcmSender {
  final String _serviceAccountJsonPath;
  final String _projectId;
  late AutoRefreshingAuthClient _client;

  FcmSender(this._serviceAccountJsonPath, this._projectId);

  Future<void> init() async {
    final accountCredentials = ServiceAccountCredentials.fromJson(
      await readServiceAccountFromAssets(),
    );

    final scopes = ['https://www.googleapis.com/auth/firebase.messaging'];

    _client = await clientViaServiceAccount(accountCredentials, scopes);
  }

  Future<bool> sendNotification({
    required String deviceToken,
    required String title,
    required String body,
    Map<String, String>? data,
  }) async {
    final url =
        'https://fcm.googleapis.com/v1/projects/$_projectId/messages:send';

    final message = {
      "message": {
        "token": deviceToken,
        "notification": {"title": title, "body": body},
        if (data != null) "data": data,
      },
    };

    final response = await _client.post(
      Uri.parse(url),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(message),
    );

    if (response.statusCode == 200) {
      print('Notification sent successfully!');
      return true;
    } else {
      print(
        'Failed to send notification: ${response.statusCode} - ${response.body}',
      );
      return false;
    }
  }

  Future<bool> sendNotificationToTopic({
    required String topic,
    required String title,
    required String body,
    Map<String, String>? data,
  }) async {
    final url =
        'https://fcm.googleapis.com/v1/projects/$_projectId/messages:send';

    final message = {
      "message": {
        "topic": topic,
        "notification": {"title": title, "body": body},
        if (data != null) "data": data,
      },
    };

    final response = await _client.post(
      Uri.parse(url),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(message),
    );

    if (response.statusCode == 200) {
      print('Notification sent successfully to topic $topic!');
      return true;
    } else {
      print(
        'Failed to send notification to topic $topic: ${response.statusCode} - ${response.body}',
      );
      return false;
    }
  }

  void close() {
    _client.close();
  }

  Future<Map<String, dynamic>> readServiceAccountFromAssets() async {
    final jsonStr = await rootBundle.loadString(
      'assets/service_account.json',
    ); // Corrected filename
    return jsonDecode(jsonStr);
  }
}
