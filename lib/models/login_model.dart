import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class LoginModel {
  /// view data
  bool kataSandiVisible = false;
  bool isButtonEnabled = false;
  bool isButtonGantiAkunEnabled = true;
  bool isConnected = false;
  bool informationMessageOverlayRegistrasi = false;
  String namaPengguna = '';
  String kataSandi = '';
  StreamSubscription<List<ConnectivityResult>>? connectivitySubscription;
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
  List<String> loginPngAsset = [
    'assets/png/registration.png',
    'assets/png/transfer/antar-koperasi.png',
    'assets/png/bayar/paket-data.png',
    'assets/png/bayar/tagihan-pln.png',
  ];
  // text icon
  List<String> loginTextList = [
    'Registrasi',
    'Antar\nKoperasi',
    'Paket\ndata',
    'Tagihan\nPLN',
  ];
  List<String> bannerLogin = [
    'assets/png/haji1.png',
    'assets/png/haji1.png',
    'assets/png/haji1.png',
  ];
  bool isAuthenticating = false;
  bool fingerprintEnabled = false;

  /// data api login
  String timeStamp = '';
  int status = 404;
  String message = 'Maaf server sedang dalam kendala, silahkan tutup applikasi dan coba lagi nanti!!';
  String token = '';
}