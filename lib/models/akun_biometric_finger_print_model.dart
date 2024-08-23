import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class AkunBiometricFingerPrintModel {
  /// view
  bool hasFingerprintSensor = false;
  bool isAuthenticating = false;
  bool fingerprintEnabled = false;
  /// api
  String timeStamp = '';
  int status = 404;
  String message = '';
  String token = '';
  bool kataSandiVisible = false;
  String kataSandi = '';
  bool isConnected = false;
  StreamSubscription<List<ConnectivityResult>>? connectivitySubscription;
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
}