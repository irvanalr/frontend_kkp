import 'dart:convert';

import 'package:febankflutter/api/api_main.dart';
import 'package:febankflutter/api/api_services.dart';
import 'package:febankflutter/models/akun_ganti_password_model.dart';
import 'package:febankflutter/viewmodels/login_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:intl/intl.dart';
import 'package:logger/logger.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class AkunGantiPasswordViewModel extends ChangeNotifier {
  final AkunGantiPasswordModel akunGantiPasswordModel =
      AkunGantiPasswordModel();
  final LoginViewModel loginViewModel = LoginViewModel();
  ApiServices apiServices = ApiMain();
  final logger = Logger();

  String get kataSandiLama => akunGantiPasswordModel.kataSandiLama;
  String get kataSandiBaru => akunGantiPasswordModel.kataSandiBaru;
  String get konfirmasiKataSandiBaru =>
      akunGantiPasswordModel.konfirmasiKataSandiBaru;
  bool get toggleButtonKataSandiLamaVisibility =>
      akunGantiPasswordModel.toggleButtonKataSandiLamaVisibility;
  bool get toggleButtonKataSandiBaruVisibility =>
      akunGantiPasswordModel.toggleButtonKataSandiBaruVisibility;
  bool get toggleButtonKonfirmasiKataSandiBaruVisibility =>
      akunGantiPasswordModel.toggleButtonKonfirmasiKataSandiBaruVisibility;
  final String api1 = dotenv.get('APITOKENSECRETKEY');
  final String api2 = dotenv.get('APITOKENSHAREDPREFERENCES');
  final String lgnTkn1 = dotenv.get('LOGINTOKENSECRETKEY');
  final String lgnTkn2 = dotenv.get('LOGINTOKENSHAREDPREFERENCES');
  final String lgnNmp1 = dotenv.get('LOGINNAMAPENGGUNASECRETKEY');
  final String lgnNmp2 = dotenv.get('LOGINNAMAPENGGUNASHAREDPREFERENCES');

  void updateKataSandiLama(newKataSandiLama) {
    akunGantiPasswordModel.kataSandiLama = newKataSandiLama;
    updateButtonStatus();
    notifyListeners();
  }

  void updateKataSandiBaru(newKataSandiBaru) {
    akunGantiPasswordModel.kataSandiBaru = newKataSandiBaru;
    updateButtonStatus();
    notifyListeners();
  }

  void updateKonfirmasiKataSandiBaru(newKonfirmasiKataSandiBaru) {
    akunGantiPasswordModel.konfirmasiKataSandiBaru = newKonfirmasiKataSandiBaru;
    updateButtonStatus();
    notifyListeners();
  }

  void updateToggleButtonKataSandiLamaVisibility() {
    akunGantiPasswordModel.toggleButtonKataSandiLamaVisibility =
        !akunGantiPasswordModel.toggleButtonKataSandiLamaVisibility;
    notifyListeners();
  }

  void updateToggleButtonKataSandiBaruVisibility() {
    akunGantiPasswordModel.toggleButtonKataSandiBaruVisibility =
        !akunGantiPasswordModel.toggleButtonKataSandiBaruVisibility;
  }

  void updateToggleButtonKonfirmasiKataSandiBaruVisibility() {
    akunGantiPasswordModel.toggleButtonKonfirmasiKataSandiBaruVisibility =
        !akunGantiPasswordModel.toggleButtonKonfirmasiKataSandiBaruVisibility;
    notifyListeners();
  }

  void updateButtonStatus() {
    if ((kataSandiLama.isNotEmpty && kataSandiBaru.isNotEmpty) &&
        konfirmasiKataSandiBaru.isNotEmpty) {
      akunGantiPasswordModel.isButtonEnabled = true;
    } else {
      akunGantiPasswordModel.isButtonEnabled = false;
    }
  }

  Future<Map<String, dynamic>> userGantiPassword() async {
    try {
      String apiKeyToken = await loginViewModel.getValue(api1, api2);
      String token = await loginViewModel.getValue(lgnTkn1, lgnTkn2);
      String namaPengguna = await loginViewModel.getValue(lgnNmp1, lgnNmp2);

      final response = await apiServices.userGantiPassword(
          apiKeyToken,
          token,
          akunGantiPasswordModel.kataSandiLama,
          akunGantiPasswordModel.konfirmasiKataSandiBaru,
          namaPengguna);
      Map<String, dynamic> responseBody = jsonDecode(response.body);
      // logger.i(responseBody);
      return {
        'statusCode': response.statusCode,
        'responseBody': responseBody,
      };
    } catch (e) {
      logger.i(e);
      throw Exception('Gagal Mengganti password, Silahkan coba lagi nanti !!!');
    }
  }

  Future<void> showChangePasswordNotification() async {
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
    await akunGantiPasswordModel.flutterLocalNotificationsPlugin.show(
        0,
        'PERHATIAN !!!',
        'PASSWORD ANDA DI GANTI !!, PADA JAM $jam DAN TANGGAL $tanggal',
        platformChannelSpecifics);
  }
}
