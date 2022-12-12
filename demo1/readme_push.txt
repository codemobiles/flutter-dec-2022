- https://console.firebase.google.com/
- new project


# /android/app/build.gradle
implementation platform('com.google.firebase:firebase-bom:31.0.1')
implementation 'com.google.firebase:firebase-analytics-ktx'

# /android/app/build.gradle
apply plugin: 'com.android.application'
apply plugin: 'com.google.gms.google-services'

# /android/build.gradle
classpath 'com.google.gms:google-services:4.3.13'

# main.dart
-------------------
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter1/src/app.dart';

Future<void> _messageHandler(RemoteMessage message) async {
  print('background message ${message.notification!.body}');
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(_messageHandler);

  runApp(const CMApp());
}


# add lib
-------------------
flutter pub add firebase_messaging


# home widget

@override
  void initState() {
    setupNotification();
    super.initState();
  }

  void setupNotification(){
    messaging = FirebaseMessaging.instance;
    messaging.getToken().then((value){
      // print("Push Token: " + value.toString());
      loggerNoStack.i("Push Token: " + value.toString());
    });

    FirebaseMessaging.onMessage.listen((RemoteMessage event) {
      print("message recieved");
      print(event.notification!.body);
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text("Notification"),
              content: Text(event.notification!.body!),
              actions: [
                TextButton(
                  child: Text("Ok"),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                )
              ],
            );
          });
    });
  }
