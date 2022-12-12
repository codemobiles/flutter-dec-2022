# warning in GradleException not found in android/app/build.gradle
  Change to :  FileNotFoundException

# multidex
- android/app/build.gradle
  defaultConfig {
          //....
          multiDexEnabled true
   }

# minSDK error in android/app/build.gradle
   - add in android/local.properties
   - minSdkVersion localProperties.getProperty('flutter.minSdkVersion')


# fix certification error
https://stackoverflow.com/questions/70536488/flutter-dio-https-certificate-validation-ignoring-onbadcertificate-ca-cert-pro

# 1
//check bad certificate
    (_dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate = (HttpClient client) {
    client.badCertificateCallback = (X509Certificate cert, String host, int port) => true;
    return client;
    };


# 2 main.dart
https://stackoverflow.com/questions/49638183/flutter-image-network-throws-handshakeexception
mport 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter1/src/app.dart';

class MyHttpOverrides extends HttpOverrides{

@override
  HttpClient createHttpClient(SecurityContext? context) {
    // TODO: implement createHttpClient
  return super.createHttpClient(context)
    ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  }
}

void main(){
  HttpOverrides.global = new MyHttpOverrides();
  runApp(new CMApp());
}