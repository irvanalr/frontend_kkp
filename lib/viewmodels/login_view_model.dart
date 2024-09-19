import 'dart:convert';

import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';
import 'package:febankflutter/api/api_main.dart';
import 'package:febankflutter/api/api_services.dart';
import 'package:febankflutter/models/api_key_model.dart';
import 'package:febankflutter/models/logout_model.dart';
import 'package:flutter/material.dart';
import 'package:febankflutter/models/login_model.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:intl/intl.dart';
import 'package:local_auth/local_auth.dart';
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class LoginViewModel extends ChangeNotifier {
  final LoginModel loginModel = LoginModel();
  final ApiKeyModel apiKeyModel = ApiKeyModel();
  final LogoutModel logoutModel = LogoutModel();
  ApiServices apiServices = ApiMain();
  final LocalAuthentication localAuthentication = LocalAuthentication();
  var logger = Logger();
  final String lgnNmp1 = dotenv.get('LOGINNAMAPENGGUNASECRETKEY');
  final String lgnNmp2 = dotenv.get('LOGINNAMAPENGGUNASHAREDPREFERENCES');

  bool get kataSandiVisible => loginModel.kataSandiVisible;
  String get namaPengguna => loginModel.namaPengguna;
  String get kataSandi => loginModel.kataSandi;

  void kataSandiVisibility() {
    loginModel.kataSandiVisible = !loginModel.kataSandiVisible;
    notifyListeners();
  }

  void updateNamaPengguna(String newUsername) {
    loginModel.namaPengguna = newUsername;
    updateButtonStatus();
    notifyListeners();
  }

  void updateKataSandi(String newPassword) {
    loginModel.kataSandi = newPassword;
    updateButtonStatus();
    notifyListeners();
  }

  void updateButtonStatus() {
    if (namaPengguna.isNotEmpty && kataSandi.isNotEmpty) {
      loginModel.isButtonEnabled = true;
    } else {
      loginModel.isButtonEnabled = false;
    }
  }

  void changeOverlayRegistrasi() {
    loginModel.informationMessageOverlayRegistrasi = !loginModel.informationMessageOverlayRegistrasi;
    notifyListeners();
  }

  String getShortNamaPengguna() {
    if (loginModel.namaPengguna.length >= 2) {
      return '${loginModel.namaPengguna.substring(0, 2)}...';
    } else {
      return loginModel.namaPengguna;
    }
  }

  Future<bool> saveValue(String value, String issuer, String secretKey, String prefKey) async {
    try {
      final jwt = JWT(
        {
          'value': value,
        },
        issuer: issuer,
      );

      final encryptedValue = jwt.sign(SecretKey(secretKey));

      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString(prefKey, encryptedValue);
      await prefs.remove('namaPengguna');
      await prefs.remove('token');
      await prefs.remove('name');
      await prefs.remove('apiKeyToken');
      return true;
    } catch (e) {
      // handle the exception
      return false;
    }
  }

  Future<String> getValue(String secretKey, String prefKey) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String encryptedValue = prefs.getString(prefKey) ?? '';

    try {
      final jwt = JWT.verify(encryptedValue, SecretKey(secretKey));
      return jwt.payload['value'] as String;
    } on JWTExpiredException {
      //logger.e('jwt expired');
      return '';
    } on JWTException catch (_) {
      //logger.e('getValue = ${ex.message}');
      return '';
    }
  }

  Future<void> clearValue(String prefKey) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove(prefKey);
    await prefs.remove('namaPengguna');
    await prefs.remove('token');
    await prefs.remove('name');
    await prefs.remove('apiKeyToken');
    // await prefs.setString(prefKey, '');
  }

  Future<Map<String, dynamic>> getTokenApiKey() async {
    try {
      final response = await apiServices.getTokenApiKey();
      Map<String, dynamic> responseBody = jsonDecode(response.body);
      // logger.i(responseBody);

      return {
        'statusCode': response.statusCode,
        'responseBody': responseBody,
      };
    } catch (e) {
      throw Exception('Gagal mendapatkan token api, Silahkan coba lagi nanti !!!');
    }
  }

  Future<Map<String, dynamic>> userLogin() async {
    try {
      final response = await apiServices.userLogin(
          apiKeyModel.token,
          loginModel.namaPengguna,
          loginModel.kataSandi
      );
      Map<String, dynamic> responseBody = jsonDecode(response.body);
      // logger.i(responseBody);

      return {
        'statusCode': response.statusCode,
        'responseBody': responseBody,
      };
    } catch (e) {
      throw Exception('Gagal Login, Silahkan coba lagi nanti !!!');
    }
  }

  Future<Map<String, dynamic>> userLogout() async {
    try {
      String namaPengguna = await getValue(lgnNmp1, lgnNmp2);

      final response = await apiServices.userLogout(
        apiKeyModel.token,
        loginModel.token,
        namaPengguna
      );
      Map<String, dynamic> responseBody = jsonDecode(response.body);
      // logger.i(responseBody);

      return {
        'statusCode': response.statusCode,
        'responseBody': responseBody,
      };
    } catch (e) {
      throw Exception('Gagal Login, Silahkan coba lagi nanti !!!');
    }
  }

  Future<void> showLoginNotification() async {
    var androidPlatformChannelSpecifics = const AndroidNotificationDetails(
        'Cordova Notifikasi Login',
        'Cordova Mobile Login',
        importance: Importance.high,
        priority: Priority.high,
    );
    var iOSPlatformChannelSpecifics = const DarwinNotificationDetails();
    var platformChannelSpecifics = NotificationDetails(
        android: androidPlatformChannelSpecifics,
        iOS: iOSPlatformChannelSpecifics);
    String jam = DateFormat('HH:mm').format(DateTime.now());
    String tanggal = DateFormat('dd-MM-yyyy').format(DateTime.now());
    await loginModel.flutterLocalNotificationsPlugin.show(
        0,
        'PERHATIAN !!!',
        'ANDA TELAH LOGIN DI JAM $jam, TANGGAL $tanggal. ABAIKAN NOTIFIKASI INI JIKA INI ANDA !',
        platformChannelSpecifics);
  }

  Future<void> showLogoutNotification() async {
    var androidPlatformChannelSpecifics = const AndroidNotificationDetails(
        'Cordova Notifikasi Logout',
        'Cordova Mobile Logout',
        importance: Importance.high,
        priority: Priority.high,
    );
    var iOSPlatformChannelSpecifics = const DarwinNotificationDetails();
    var platformChannelSpecifics = NotificationDetails(
        android: androidPlatformChannelSpecifics,
        iOS: iOSPlatformChannelSpecifics);
    String jam = DateFormat('HH:mm').format(DateTime.now());
    String tanggal = DateFormat('dd-MM-yyyy').format(DateTime.now());
    await loginModel.flutterLocalNotificationsPlugin.show(
        0,
        'Informasi',
        'Anda telah Logout di jam $jam, Tanggal $tanggal',
        platformChannelSpecifics);
  }

  /// Function to clear/reset the model data
  void clearData() {
    loginModel.kataSandiVisible = false;
    loginModel.isButtonEnabled = false;
    loginModel.isButtonGantiAkunEnabled = true;
    loginModel.isConnected = false;
    loginModel.informationMessageOverlayRegistrasi = false;
    loginModel.namaPengguna = '';
    loginModel.kataSandi = '';

    // Cancel and clear any active connectivity subscriptions
    loginModel.connectivitySubscription?.cancel();
    loginModel.connectivitySubscription = null;

    // Optionally, you may want to reset or reinitialize notifications
    loginModel.flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

    // Reset lists to their initial values
    loginModel.loginPngAsset = [
      'assets/png/registration.png',
      'assets/png/transfer/antar-koperasi.png',
      'assets/png/bayar/paket-data.png',
      'assets/png/bayar/tagihan-pln.png',
    ];

    loginModel.loginTextList = [
      'Registrasi',
      'Antar\nKoperasi',
      'Paket\ndata',
      'Tagihan\nPLN',
    ];

    loginModel.bannerLogin = [
      'assets/png/haji1.png',
      'assets/png/haji1.png',
      'assets/png/haji1.png',
    ];

    loginModel.isAuthenticating = false;
    loginModel.fingerprintEnabled = false;

    // Reset API-related data
    loginModel.timeStamp = '';
    loginModel.status = 404;
    loginModel.message = 'Maaf server sedang dalam kendala, silahkan tutup applikasi dan coba lagi nanti!!';
    loginModel.token = '';
  }
}