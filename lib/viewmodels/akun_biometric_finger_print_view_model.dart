import 'dart:convert';

import 'package:febankflutter/api/api_main.dart';
import 'package:febankflutter/api/api_services.dart';
import 'package:febankflutter/models/akun_biometric_finger_print_model.dart';
import 'package:febankflutter/ui/akun/ganti/fingerprint/finger_print_logout.dart';
import 'package:febankflutter/ui/akun/ganti/fingerprint/finger_print_login.dart';
import 'package:febankflutter/utils/routes/route_paths.dart';
import 'package:febankflutter/utils/strings/strings.dart';
import 'package:febankflutter/utils/theme/light_and_dark.dart';
import 'package:febankflutter/viewmodels/login_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:local_auth/local_auth.dart';
import 'package:local_auth_android/local_auth_android.dart';
import 'package:local_auth_darwin/local_auth_darwin.dart';
import 'package:logger/logger.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class AkunBiometricFingerPrintViewModel extends ChangeNotifier{
  final AkunBiometricFingerPrintModel akunBiometricFingerPrintModel = AkunBiometricFingerPrintModel();
  final LocalAuthentication localAuthentication = LocalAuthentication();
  final LoginViewModel loginViewModel = LoginViewModel();
  final logger = Logger();
  ApiServices apiServices = ApiMain();
  final String lgnATkn1 = dotenv.get('APITOKENSECRETKEY');
  final String lgnAtkn2 = dotenv.get('APITOKENSHAREDPREFERENCES');
  final String lgnKts1 = dotenv.get('LOGINKATASANDISECRETKEY');
  final String lgnKts2 = dotenv.get('LOGINKATASANDISHAREDPREFERENCES');
  final String lgnNmp1 = dotenv.get('LOGINNAMAPENGGUNAISSUER');
  final String lgnNmp2 = dotenv.get('LOGINNAMAPENGGUNASECRETKEY');
  final String lgnNmp3 = dotenv.get('LOGINNAMAPENGGUNASHAREDPREFERENCES');
  final String lgnTkn1 = dotenv.get('LOGINTOKENISSUER');
  final String lgnTkn2 = dotenv.get('LOGINTOKENSECRETKEY');
  final String lgnTkn3 = dotenv.get('LOGINTOKENSHAREDPREFERENCES');

  bool get kataSandiVisible => akunBiometricFingerPrintModel.kataSandiVisible;
  String get kataSandi => akunBiometricFingerPrintModel.kataSandi;

  void kataSandiVisibility() {
    akunBiometricFingerPrintModel.kataSandiVisible = !akunBiometricFingerPrintModel.kataSandiVisible;
    notifyListeners();
  }

  void updateKataSandi(String newPassword) {
    akunBiometricFingerPrintModel.kataSandi = newPassword;
    notifyListeners();
  }

  Future<Map<String, dynamic>> validateBiometricFingerPrint() async {
    try {
      String token = await loginViewModel.getValue(lgnATkn1, lgnAtkn2);
      String namaPengguna = await loginViewModel.getValue(lgnNmp2, lgnNmp3);
      final response = await apiServices.userLogin(
          token,
          namaPengguna,
          akunBiometricFingerPrintModel.kataSandi
      );
      Map<String, dynamic> responseBody = jsonDecode(response.body);

      return {
        'statusCode': response.statusCode,
        'responseBody': responseBody,
      };
    } catch (e) {
      logger.e(e);
      throw Exception(e);
    }
  }

  Future<void> checkForFingerprintSensor(BuildContext context) async {
    late bool canCheckBiometrics;
    try {
      canCheckBiometrics = await localAuthentication.canCheckBiometrics;
    } on PlatformException catch (e) {
      canCheckBiometrics = false;
      logger.i(canCheckBiometrics);
      logger.i(e);
    }
    if (!context.mounted) {
      return;
    }

    akunBiometricFingerPrintModel.hasFingerprintSensor = canCheckBiometrics;
    notifyListeners();
  }

  Future<void> authenticateWithBiometrics(BuildContext context) async {
    bool authenticated = false;
    try {
      akunBiometricFingerPrintModel.isAuthenticating = true;
      notifyListeners();
      authenticated = await localAuthentication.authenticate(
        localizedReason: 'Tap jari anda ke sensor fingerprint',
        authMessages: const <AuthMessages>[
          AndroidAuthMessages(
              signInTitle: 'Membutuhkan otentikasi',
              cancelButton: 'Tutup',
              biometricHint: 'verifikasi identitas'
          )
        ],
        options: const AuthenticationOptions(
          stickyAuth: true,
          biometricOnly: true,
        ),
      );
      // logger.i('Authentication result: $authenticated');

      if (authenticated) {
        akunBiometricFingerPrintModel.fingerprintEnabled = false;
        notifyListeners();
        if (context.mounted) {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (BuildContext context) => const FingerPrintLogout()),
          );
        }
      }
    } on PlatformException catch (e) {
      logger.w(e);
      akunBiometricFingerPrintModel.isAuthenticating = false;
      notifyListeners();
      logger.e('Error - ${e.message}');

      Fluttertoast.showToast(
        msg: "Maaf, silahkan coba lagi nanti. Anda sudah melewati batas percobaan fingerprint!",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0,
      );
      return;
    }
    if (!context.mounted) {
      return;
    }
  }

  Future<void> authenticateWithBiometricsForLogin(BuildContext context) async {
    bool authenticated = false;
    try {
      akunBiometricFingerPrintModel.isAuthenticating = true;
      notifyListeners();
      authenticated = await localAuthentication.authenticate(
        localizedReason: 'Tap jari anda ke sensor fingerprint',
        authMessages: const <AuthMessages>[
        AndroidAuthMessages(
          signInTitle: 'Membutuhkan otentikasi',
          cancelButton: 'Tutup',
          biometricHint: 'verifikasi identitas'
          )
        ],
        options: const AuthenticationOptions(
          stickyAuth: true,
          biometricOnly: true,
        ),
      );
      akunBiometricFingerPrintModel.isAuthenticating = false;
      notifyListeners();
      logger.i('Authentication result: $authenticated');

      if (authenticated) {
        akunBiometricFingerPrintModel.fingerprintEnabled = true;
        notifyListeners();
        String token = await loginViewModel.getValue(lgnATkn1, lgnAtkn2);
        String namaPengguna = await loginViewModel.getValue(lgnNmp2, lgnNmp3);
        logger.i(namaPengguna);
        String kataSandi = await loginViewModel.getValue(lgnKts1, lgnKts2);
        final response = await apiServices.userLogin(
            token,
            namaPengguna,
            kataSandi
        );
        Map<String, dynamic> responseBody = jsonDecode(response.body);
        if(response.statusCode == 200) {
          loginViewModel.loginModel.timeStamp = responseBody['timestamp'];
          loginViewModel.loginModel.status = responseBody['status'];
          loginViewModel.loginModel.message = responseBody['message'];
          loginViewModel.loginModel.token = responseBody['token'];
          await loginViewModel.saveValue(loginViewModel.loginModel.token, lgnTkn1, lgnTkn2, lgnTkn3);
          if (context.mounted) {
            Future.delayed(const Duration(seconds: 3), () {
              loginViewModel.showLoginNotification();
            });
            Navigator.pushReplacementNamed(context, RoutePaths.navigationBarCustome);
          } else {
            loginViewModel.loginModel.timeStamp = responseBody['timestamp'];
            loginViewModel.loginModel.status = responseBody['status'];
            loginViewModel.loginModel.message = responseBody['message'];
            if(
            loginViewModel.loginModel.message == "Username dan Password salah !!!" ||
                loginViewModel.loginModel.message == "Akun dinonaktifkan, Hubungi Operator kami untuk tindak selanjutnya !!!"
            ) {
              if (context.mounted) {
                showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text(
                        Strings.loginInformasiString,
                        style: GoogleFonts.poppins(
                            textStyle: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold)),
                        textAlign: TextAlign.center,
                      ),
                      content: Text(
                        loginViewModel.loginModel.message,
                        style: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.normal),
                        ),
                        textAlign: TextAlign.center,
                      ),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text(
                            'OK',
                            style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                    color: LightAndDarkMode.teksRead2(context))),
                          ),
                        ),
                      ],
                    );
                  },
                );
              }
            } else {
              throw Exception('Error selain 403 dengan message Username Atau Password salah silahkan coba lagi !!!');
            }
          }
        }
      }
    } on PlatformException catch (e) {
      logger.w(e);
      akunBiometricFingerPrintModel.isAuthenticating = false;
      notifyListeners();
      logger.e('Error - ${e.message}');

      Fluttertoast.showToast(
        msg: "Maaf, silahkan coba lagi nanti. Anda sudah melewati batas percobaan fingerprint!",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0,
      );
      return;
    }
    if (!context.mounted) {
      return;
    }
  }

  Future<void> cancelAuthentication() async {
    await localAuthentication.stopAuthentication();
    akunBiometricFingerPrintModel.isAuthenticating = false;
    notifyListeners();
  }

  void toggleFingerprintAuthentication(BuildContext context) async {
    if (akunBiometricFingerPrintModel.fingerprintEnabled == false) {
      bool authenticated = false;
      try {
        akunBiometricFingerPrintModel.isAuthenticating = true;
        notifyListeners();
        authenticated = await localAuthentication.authenticate(
          localizedReason: 'Tap jari anda ke sensor fingerprint',
          authMessages: const <AuthMessages>[
            AndroidAuthMessages(
                signInTitle: 'Membutuhkan otentikasi',
                cancelButton: 'Tutup',
                biometricHint: 'verifikasi identitas'
            )
          ],
          options: const AuthenticationOptions(
            stickyAuth: true,
            biometricOnly: true,
          ),
        );
        // logger.i('Authentication result: $authenticated');

        if (authenticated) {
          akunBiometricFingerPrintModel.fingerprintEnabled = false;
          notifyListeners();
          if (context.mounted) {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (BuildContext context) => const FingerPrintLogin()),
            );
          }
        }
      } on PlatformException catch (e) {
        logger.w(e);
        akunBiometricFingerPrintModel.isAuthenticating = false;
        notifyListeners();
        logger.e('Error - ${e.message}');

        Fluttertoast.showToast(
          msg: "Maaf, silahkan coba lagi nanti. Anda sudah melewati batas percobaan fingerprint!",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0,
        );
        return;
      }
      if (!context.mounted) {
        return;
      }
    } else {
      authenticateWithBiometrics(context);
    }
  }

  Future<void> showLoginFingerPrintNotification() async {
    var androidPlatformChannelSpecifics = const AndroidNotificationDetails(
      'Cordova Notifikasi Finger Print',
      'Cordova Mobile Finger Print',
      importance: Importance.high,
      priority: Priority.high,
    );
    var iOSPlatformChannelSpecifics = const DarwinNotificationDetails();
    var platformChannelSpecifics = NotificationDetails(
        android: androidPlatformChannelSpecifics,
        iOS: iOSPlatformChannelSpecifics);
    await akunBiometricFingerPrintModel.flutterLocalNotificationsPlugin.show(
        0,
        'SELAMAT !!!',
        'Selamat Biometric Finger Print berhasil di Aktifkan !!!',
        platformChannelSpecifics);
  }

  Future<void> showLogoutFingerPrintNotification() async {
    var androidPlatformChannelSpecifics = const AndroidNotificationDetails(
      'Cordova Notifikasi Finger Print',
      'Cordova Mobile Finger Print',
      importance: Importance.high,
      priority: Priority.high,
    );
    var iOSPlatformChannelSpecifics = const DarwinNotificationDetails();
    var platformChannelSpecifics = NotificationDetails(
        android: androidPlatformChannelSpecifics,
        iOS: iOSPlatformChannelSpecifics);
    await akunBiometricFingerPrintModel.flutterLocalNotificationsPlugin.show(
        0,
        'NON AKTIV !!!',
        'Selamat Biometric Finger Print berhasil di Non Aktifkan !!!',
        platformChannelSpecifics);
  }
}