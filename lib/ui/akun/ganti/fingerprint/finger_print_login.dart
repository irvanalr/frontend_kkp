import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:febankflutter/utils/responsive/alert/responsive_alert.dart';
import 'package:febankflutter/utils/routes/route_paths.dart';
import 'package:febankflutter/utils/strings/strings.dart';
import 'package:febankflutter/utils/theme/light_and_dark.dart';
import 'package:febankflutter/viewmodels/akun_biometric_finger_print_view_model.dart';
import 'package:febankflutter/viewmodels/login_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:logger/logger.dart';

class FingerPrintLogin extends StatefulWidget {
  const FingerPrintLogin({super.key});

  @override
  State<FingerPrintLogin> createState() => _FingerPrintLoginState();
}

class _FingerPrintLoginState extends State<FingerPrintLogin> {
  bool _isPasswordVisible = false;
  TextEditingController kataSandiController = TextEditingController();
  final AkunBiometricFingerPrintViewModel akunBiometricFingerPrintViewModel = AkunBiometricFingerPrintViewModel();
  final LoginViewModel loginViewModel = LoginViewModel();
  final logger = Logger();
  final String lgnKts1 = dotenv.get('LOGINKATASANDIISSUER');
  final String lgnKts2 = dotenv.get('LOGINKATASANDISECRETKEY');
  final String lgnKts3 = dotenv.get('LOGINKATASANDISHAREDPREFERENCES');

  @override
  void initState() {
    super.initState();
    kataSandiController =
    TextEditingController(text: akunBiometricFingerPrintViewModel.kataSandi)
      ..addListener(() {
        akunBiometricFingerPrintViewModel.updateKataSandi(kataSandiController.text);
      });

    akunBiometricFingerPrintViewModel.akunBiometricFingerPrintModel.flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
    akunBiometricFingerPrintViewModel.akunBiometricFingerPrintModel.flutterLocalNotificationsPlugin.resolvePlatformSpecificImplementation<
        AndroidFlutterLocalNotificationsPlugin>()?.requestNotificationsPermission();
    var initializationSettingsAndroid = const AndroidInitializationSettings('@mipmap/launcher_icon');
    var initializationSettingsIOS = const DarwinInitializationSettings();
    var initializationSettings = InitializationSettings(
        android: initializationSettingsAndroid,
        iOS: initializationSettingsIOS);
    akunBiometricFingerPrintViewModel.akunBiometricFingerPrintModel.flutterLocalNotificationsPlugin.initialize(initializationSettings);

    akunBiometricFingerPrintViewModel.akunBiometricFingerPrintModel.connectivitySubscription = Connectivity()
        .onConnectivityChanged
        .listen((List<ConnectivityResult> result) {
      // Got a new connectivity status!
      if (result.contains(ConnectivityResult.mobile) ||
          result.contains(ConnectivityResult.wifi)) {
        setState(() {
          akunBiometricFingerPrintViewModel.akunBiometricFingerPrintModel.isConnected = true;
        });
      } else {
        setState(() {
          akunBiometricFingerPrintViewModel.akunBiometricFingerPrintModel.isConnected = false;
        });
      }
    });
  }

  void validateInput() {
    // Cek terlebih dahulu apakah perangkat memiliki internet atau tidak
    if (!akunBiometricFingerPrintViewModel.akunBiometricFingerPrintModel.isConnected) {
      // Jika tidak ada internet, tampilkan dialog
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(
              'KONEKSI INTERNET TERPUTUS',
              style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                      fontSize: ResponsiveAlert.alertTitleInformasiFontSize,
                      fontWeight: FontWeight.bold)),
              textAlign: TextAlign.center,
            ),
            content: Text(
              'Untuk menjalankan Applikasi Cordova Mobile, membutuhkan internet Silahkan periksa internet anda!',
              style: GoogleFonts.poppins(
                textStyle: TextStyle(
                    fontSize: ResponsiveAlert.alertContentFontSize,
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
                  'Ok',
                  style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                          fontSize: ResponsiveAlert.alertActionOkFontSize,
                          fontWeight: FontWeight.w600,
                          color: LightAndDarkMode.teksRead2(context))),
                ),
              ),
            ],
          );
        },
      );
    } else {
      akunBiometricFingerPrintViewModel.validateBiometricFingerPrint().then((result) async {
        Map<String, dynamic> responseBody = result['responseBody'];
        int statusCode = result['statusCode'];
        if(statusCode == 200) {
          akunBiometricFingerPrintViewModel.akunBiometricFingerPrintModel.timeStamp = responseBody['timestamp'];
          akunBiometricFingerPrintViewModel.akunBiometricFingerPrintModel.status = responseBody['status'];
          akunBiometricFingerPrintViewModel.akunBiometricFingerPrintModel.message = responseBody['message'];
          akunBiometricFingerPrintViewModel.akunBiometricFingerPrintModel.token = responseBody['token'];
          await loginViewModel.saveValue(akunBiometricFingerPrintViewModel.akunBiometricFingerPrintModel.kataSandi, lgnKts1, lgnKts2, lgnKts3);
          if(mounted) {
            Navigator.of(context).pushNamedAndRemoveUntil(
              RoutePaths.navigationBarCustome,
                  (Route<dynamic> route) => false,
            );
            Future.delayed(const Duration(seconds: 3), () {
              akunBiometricFingerPrintViewModel.showLoginFingerPrintNotification();
            });
          }
        }else{
          akunBiometricFingerPrintViewModel.akunBiometricFingerPrintModel.timeStamp = responseBody['timestamp'];
          akunBiometricFingerPrintViewModel.akunBiometricFingerPrintModel.status = responseBody['status'];
          akunBiometricFingerPrintViewModel.akunBiometricFingerPrintModel.message = responseBody['message'];
          if( akunBiometricFingerPrintViewModel.akunBiometricFingerPrintModel.message == "Username dan Password salah !!!") {
            if (mounted) {
              showDialog(
                context: context,
                barrierDismissible: false,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text(
                      Strings.loginInformasiString,
                      style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              fontSize: ResponsiveAlert.alertTitleInformasiFontSize,
                              fontWeight: FontWeight.bold)),
                      textAlign: TextAlign.center,
                    ),
                    content: Text(
                      "Password anda salah, Silahkan ketikan ulang !!!",
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                            fontSize: ResponsiveAlert.alertContentFontSize,
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
                                  fontSize: ResponsiveAlert.alertActionOkFontSize,
                                  fontWeight: FontWeight.w600,
                                  color: LightAndDarkMode.teksRead2(context))),
                        ),
                      ),
                    ],
                  );
                },
              );
            }
          } else if(akunBiometricFingerPrintViewModel.akunBiometricFingerPrintModel.message == "Akun dinonaktifkan, Hubungi Operator kami untuk tindak selanjutnya !!!") {
            if (mounted) {
              showDialog(
                context: context,
                barrierDismissible: false,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text(
                      Strings.loginInformasiString,
                      style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              fontSize: ResponsiveAlert.alertTitleInformasiFontSize,
                              fontWeight: FontWeight.bold)),
                      textAlign: TextAlign.center,
                    ),
                    content: Text(
                      akunBiometricFingerPrintViewModel.akunBiometricFingerPrintModel.message,
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                            fontSize: ResponsiveAlert.alertContentFontSize,
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
                                  fontSize: ResponsiveAlert.alertActionOkFontSize,
                                  fontWeight: FontWeight.w600,
                                  color: LightAndDarkMode.teksRead2(context))),
                        ),
                      ),
                    ],
                  );
                },
              );
            }
          }
        }
      }).catchError((error) {
        logger.i(error);
        if(mounted){
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text(
                  Strings.loginInformasiString,
                  style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                          fontSize: ResponsiveAlert.alertTitleInformasiFontSize,
                          fontWeight: FontWeight.bold)),
                  textAlign: TextAlign.center,
                ),
                content: Text(
                  'Terlalu banyak percobaan, silahkan coba lagi beberapa saat kemudian !!!',
                  style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                        fontSize: ResponsiveAlert.alertContentFontSize,
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
                              fontSize: ResponsiveAlert.alertActionOkFontSize,
                              fontWeight: FontWeight.w600,
                              color: LightAndDarkMode.teksRead2(context))),
                    ),
                  ),
                ],
              );
            },
          );
        }
      });
    }
  }

  @override
  void dispose() {
    super.dispose();
    kataSandiController.dispose();
    akunBiometricFingerPrintViewModel.akunBiometricFingerPrintModel.connectivitySubscription?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    ResponsiveAlert.init(context);
    return PopScope<Object?>(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) async {
        if (!didPop) {
          Navigator.of(context).pushNamedAndRemoveUntil(
            RoutePaths.navigationBarCustome,
                (Route<dynamic> route) => false,
          );
        }
      },
      child: GestureDetector(
        onTap: () {
          FocusScopeNode currentFocus = FocusScope.of(context);
          if (!currentFocus.hasPrimaryFocus) {
            currentFocus.unfocus();
          }
        },
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: LightAndDarkMode.primaryColor(context),
            leading: IconButton(
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.white,
                size: 21,
              ),
              onPressed: () {
                Navigator.of(context).pushNamedAndRemoveUntil(
                  RoutePaths.navigationBarCustome,
                      (Route<dynamic> route) => false,
                );
              },
            ),
            title: Text(
              'Biometric finger print',
              style: GoogleFonts.poppins(
                textStyle: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),
            centerTitle: true,
          ),
          body: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: Center(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width * 0.95,
                      child: Text(
                        'Biometric Finger Print',
                        style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: LightAndDarkMode.teksRead2(context),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width * 0.95,
                      child: Text(
                        'Biometric Finger Print adalah fiture dimana ketika anda membutuhkan login yang cepat cukup hanya lakukan dengan sidik jari tidak perlu memasukan password anda lagi !!!',
                        style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w300,
                            color: LightAndDarkMode.teksRead(context),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 50),
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.95,
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: LightAndDarkMode.cardColor1(context),
                            width: 3
                        ),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: TextField(
                        style: GoogleFonts.poppins(
                            textStyle: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.normal,
                                color: Colors.black
                            )
                        ),
                        inputFormatters: [FilteringTextInputFormatter.deny(RegExp(r'[$`]'))],
                        controller: kataSandiController,
                        keyboardType: TextInputType.text,
                        obscureText: !_isPasswordVisible,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          labelText: 'Masukan password Akun',
                          labelStyle: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal,
                                  color: LightAndDarkMode.cardColor1(context)
                              )
                          ),
                          prefixIcon: Icon(
                              Icons.lock,
                              color: LightAndDarkMode.cardColor1(context)
                          ),
                          suffixIcon: IconButton(
                            icon: Icon(
                              _isPasswordVisible
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: LightAndDarkMode.cardColor1(context),
                            ),
                            onPressed: () {
                              setState(() {
                                _isPasswordVisible = !_isPasswordVisible;
                              });
                            },
                          ),
                        ),
                        cursorColor: Colors.black,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),

                  Container(
                    width: MediaQuery.of(context).size.width * 0.95,
                    decoration: BoxDecoration(
                      color: LightAndDarkMode.primaryColor(context),
                    ),
                    child: TextButton(
                      style: TextButton.styleFrom(
                        shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.zero
                        ),
                      ),
                      onPressed: () {
                        validateInput();
                      },
                      child: const Text(
                        'Terapkan Biometric Finger Print',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ),
        ),
      ),
    );
  }
}
