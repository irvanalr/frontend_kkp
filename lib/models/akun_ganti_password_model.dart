import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class AkunGantiPasswordModel {
  // Ui
  String kataSandiLama = '';
  String kataSandiBaru = '';
  String konfirmasiKataSandiBaru = '';
  bool toggleButtonKataSandiLamaVisibility = false;
  bool toggleButtonKataSandiBaruVisibility = false;
  bool toggleButtonKonfirmasiKataSandiBaruVisibility = false;
  bool isButtonEnabled = false;
  bool isConnected = false;
  StreamSubscription<List<ConnectivityResult>>? connectivitySubscription;
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  // Ganti password
  String timeStamp = '';
  int status = 404;
  String message = 'Maaf server sedang dalam kendala, silahkan tutup applikasi dan coba lagi nanti!!';
  String token = '';
}