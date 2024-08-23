import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:febankflutter/models/beranda_model.dart';
import 'package:febankflutter/utils/routes/route_paths.dart';
import 'package:febankflutter/utils/theme/light_and_dark.dart';
import 'package:febankflutter/utils/strings/strings.dart';
import 'package:febankflutter/utils/responsive/alert/responsive_alert.dart';
import 'package:febankflutter/utils/responsive/login/responsive_login.dart';
import 'package:febankflutter/viewmodels/akun_biometric_finger_print_view_model.dart';
import 'package:febankflutter/viewmodels/login_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:logger/logger.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class CostumeTextFieldLogin extends StatefulWidget {
  final LoginViewModel loginViewModel;
  final BerandaModel berandaModel;
  final TextEditingController namaPenggunaController;
  final TextEditingController kataSandiController;
  final Key keyLoginButton;
  final Key keyUsernameField;
  final Key keyPasswordField;
  final Key keyIconEye;
  final Key keyGantiAkunButton;
  final Key keyAlertOkKoneksiTerputus;
  final Key keyAlertOkNamaPenggunaDanKataSandiSalah;
  final Key keyAlertOkGagalLogout;
  final Key keyCostumeTextFieldLogin;
  final AkunBiometricFingerPrintViewModel akunBiometricFingerPrintViewModel;

  const CostumeTextFieldLogin({
    super.key,
    required this.loginViewModel,
    required this.berandaModel,
    required this.namaPenggunaController,
    required this.kataSandiController,
    required this.keyLoginButton,
    required this.keyUsernameField,
    required this.keyPasswordField,
    required this.keyIconEye,
    required this.keyGantiAkunButton,
    required this.keyAlertOkKoneksiTerputus,
    required this.keyAlertOkNamaPenggunaDanKataSandiSalah,
    required this.keyAlertOkGagalLogout,
    required this.keyCostumeTextFieldLogin,
    required this.akunBiometricFingerPrintViewModel
  });

  @override
  State<CostumeTextFieldLogin> createState() => _CostumeTextFieldLoginState();
}

class _CostumeTextFieldLoginState extends State<CostumeTextFieldLogin> {
  final logger = Logger();
  final passwordFocusNode = FocusNode();
  late Future checkFingerPrintSensor;
  final String lgnTkn1 = dotenv.get('LOGINTOKENISSUER');
  final String lgnTkn2 = dotenv.get('LOGINTOKENSECRETKEY');
  final String lgnTkn3 = dotenv.get('LOGINTOKENSHAREDPREFERENCES');
  final String lgnNmp1 = dotenv.get('LOGINNAMAPENGGUNAISSUER');
  final String lgnNmp2 = dotenv.get('LOGINNAMAPENGGUNASECRETKEY');
  final String lgnNmp3 = dotenv.get('LOGINNAMAPENGGUNASHAREDPREFERENCES');
  final String lgnKts1 = dotenv.get('LOGINKATASANDIISSUER');
  final String lgnKts2 = dotenv.get('LOGINKATASANDISECRETKEY');
  final String lgnKts3 = dotenv.get('LOGINKATASANDISHAREDPREFERENCES');

  @override
  void initState() {
    super.initState();
    widget.akunBiometricFingerPrintViewModel.checkForFingerprintSensor(context);
    widget.loginViewModel.loginModel.flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
    widget.loginViewModel.loginModel.flutterLocalNotificationsPlugin.resolvePlatformSpecificImplementation<
        AndroidFlutterLocalNotificationsPlugin>()?.requestNotificationsPermission();
    var initializationSettingsAndroid = const AndroidInitializationSettings('@mipmap/launcher_icon');
    var initializationSettingsIOS = const DarwinInitializationSettings();
    var initializationSettings = InitializationSettings(
        android: initializationSettingsAndroid,
        iOS: initializationSettingsIOS);
    widget.loginViewModel.loginModel.flutterLocalNotificationsPlugin.initialize(initializationSettings);
    widget.loginViewModel.loginModel.connectivitySubscription = Connectivity()
        .onConnectivityChanged
        .listen((List<ConnectivityResult> result) {
      // Got a new connectivity status!
      if (result.contains(ConnectivityResult.mobile) ||
          result.contains(ConnectivityResult.wifi)) {
        setState(() {
          widget.loginViewModel.loginModel.isConnected = true;
        });
      } else {
        setState(() {
          widget.loginViewModel.loginModel.isConnected = false;
        });
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    widget.loginViewModel.loginModel.connectivitySubscription?.cancel();
  }

  // Future<void> fakeApi() async {
  //   await Future.delayed(const Duration(milliseconds: 1500));
  //   logger.i('Data sudah di-load');
  // }

  void validateInput() {
    // Cek terlebih dahulu apakah perangkat memiliki internet atau tidak
    if (!widget.loginViewModel.loginModel.isConnected) {
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
                key: widget.keyAlertOkKoneksiTerputus,
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
      widget.loginViewModel.userLogin().then((result) async {
        Map<String, dynamic> responseBody = result['responseBody'];
        int statusCode = result['statusCode'];

        if (statusCode == 200) {
          widget.loginViewModel.loginModel.timeStamp = responseBody['timestamp'];
          widget.loginViewModel.loginModel.status = responseBody['status'];
          widget.loginViewModel.loginModel.message = responseBody['message'];
          widget.loginViewModel.loginModel.token = responseBody['token'];
          await widget.loginViewModel.saveValue(widget.loginViewModel.loginModel.token, lgnTkn1, lgnTkn2, lgnTkn3);
          await widget.loginViewModel.saveValue(widget.loginViewModel.loginModel.namaPengguna, lgnNmp1, lgnNmp2, lgnNmp3);
          if (mounted) {
            Future.delayed(const Duration(seconds: 3), () {
              widget.loginViewModel.showLoginNotification();
            });
            Navigator.pushReplacementNamed(context, RoutePaths.navigationBarCustome);
          }
        } else {
          widget.loginViewModel.loginModel.timeStamp = responseBody['timestamp'];
          widget.loginViewModel.loginModel.status = responseBody['status'];
          widget.loginViewModel.loginModel.message = responseBody['message'];
          if(
           widget.loginViewModel.loginModel.message == "Username dan Password salah !!!" ||
           widget.loginViewModel.loginModel.message == "Akun dinonaktifkan, Hubungi Operator kami untuk tindak selanjutnya !!!"
          ) {
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
                      widget.loginViewModel.loginModel.message,
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                            fontSize: ResponsiveAlert.alertContentFontSize,
                            fontWeight: FontWeight.normal),
                      ),
                      textAlign: TextAlign.center,
                    ),
                    actions: <Widget>[
                      TextButton(
                        key: widget.keyAlertOkNamaPenggunaDanKataSandiSalah,
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
          } else {
            throw Exception('Error selain 403 dengan message Username Atau Password salah silahkan coba lagi !!!');
          }
        }
      }).catchError((error) {
        logger.e(error);
        if(mounted) {
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (BuildContext context) {
              return AlertDialog(
                key: const Key('AlertGetApiKey'),
                title: const Center(
                  child:Text(
                    Strings.loginPerhatianAlertGetApiKeyString,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                content: const Text(
                  'SERVER MENGALAMI GANGGUAN, SILAHKAN COBA LAGI NANTI !!!',
                ),
                actions: <Widget>[
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text(
                      Strings.loginPerhatianButtonOkString,
                      style: TextStyle(color: Colors.blue),
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

  Future<void> getAndroidVersion() async {
    if (Platform.isAndroid) {
      var androidInfo = await DeviceInfoPlugin().androidInfo;
      var release = androidInfo.version.release;
      var sdkInt = androidInfo.version.sdkInt;
      var manufacturer = androidInfo.manufacturer;
      var model = androidInfo.model;
      logger.i('Android $release (SDK $sdkInt), $manufacturer $model');
      // Android 9 (SDK 28), Xiaomi Redmi Note 7
      if (sdkInt < 23) {
        // Versi Android kurang dari 23, tampilkan dialog bahwa perangkat tidak mendukung fingerprint sensor
        if(mounted) {
          logger.i('Kurang versinya');
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text(
                  'Perangkat Tidak Mendukung',
                  style: GoogleFonts.poppins(
                    textStyle: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  textAlign: TextAlign.center,
                ),
                content: Text(
                  'Maaf, versi perangkat anda tidak mendukung fitur finger print kami. Silahkan ugrade perangkat anda ke versi terbaru !',
                  style: GoogleFonts.poppins(
                    textStyle: const TextStyle(
                      fontSize: 14,
                    ),
                  ),
                  textAlign: TextAlign.center,
                ),
                actions: <Widget>[
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text(
                      'OK',
                      style: TextStyle(
                        color: Colors.blue,
                      ),
                    ),
                  ),
                ],
              );
            },
          );
        }
      } else {
        // Versi Android 23 atau lebih tinggi
        if (!widget.akunBiometricFingerPrintViewModel.akunBiometricFingerPrintModel.hasFingerprintSensor) {
          // Perangkat tidak mendukung biometrik, tampilkan dialog bahwa perangkat tidak mendukung fingerprint sensor
          if(mounted) {
            logger.i('Tidak ada biometric');
            showDialog(
              context: context,
              barrierDismissible: false,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text(
                    'Perangkat Tidak Mendukung',
                    style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    textAlign: TextAlign.center,
                  ),
                  content: Text(
                    'Maaf, sepertinya perangkat Anda tidak memiliki Finger Print Sensor. Silahkan cek di pengaturan atau cari informasi terkait perangkat anda !',
                    style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                        fontSize: 14,
                      ),
                    ),
                    textAlign: TextAlign.center,
                  ),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text(
                        'OK',
                        style: TextStyle(
                          color: Colors.blue,
                        ),
                      ),
                    ),
                  ],
                );
              },
            );
          }
        } else if (widget.akunBiometricFingerPrintViewModel.akunBiometricFingerPrintModel.kataSandi.isEmpty) {
          // Kata sandi kosong, tampilkan dialog untuk mengaktifkan fingerprint di pengaturan
          if(mounted) {
            showDialog(
              context: context,
              barrierDismissible: false,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text(
                    'Aktivkan Finger Print di pengaturan',
                    style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    textAlign: TextAlign.center,
                  ),
                  content: Text(
                    'Yuk, aktivkan Finger Print di Pengaturan Akun Anda!',
                    style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                        fontSize: 14,
                      ),
                    ),
                    textAlign: TextAlign.center,
                  ),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text(
                        'OK',
                        style: TextStyle(
                          color: Colors.blue,
                        ),
                      ),
                    ),
                  ],
                );
              },
            );
          }
        } else {
          if(mounted) {
            await widget.akunBiometricFingerPrintViewModel.authenticateWithBiometricsForLogin(context);
          }
        }

      }
    } // tutup
  }

  @override
  Widget build(BuildContext context) {
    ResponsiveLogin.init(context);
    ResponsiveAlert.init(context);
    return SingleChildScrollView(
      key: widget.keyCostumeTextFieldLogin,
      child: Column(
        key: const Key('columnCostumeTextField'),
        children: [
          Container(
            key: const Key('containerCostumeTextField'),
            width: ResponsiveLogin.costumeTextFieldInputAndButtonWidth,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black, width: 1),
              borderRadius: BorderRadius.circular(5),
            ),
            child: TextField(
              key: widget.keyUsernameField,
              style: GoogleFonts.poppins(
                textStyle: TextStyle(
                    fontSize: ResponsiveLogin.costumeTextFieldLoginInputDanInputLabelTextFieldFontSize,
                    fontWeight: FontWeight.normal,
                    color: Colors.black
                ),
              ),
              inputFormatters: [FilteringTextInputFormatter.deny(RegExp(r'[$`]'))],
              readOnly: widget.loginViewModel.loginModel.isButtonGantiAkunEnabled,
              enableInteractiveSelection: false,
              controller: widget.loginViewModel.loginModel.isButtonGantiAkunEnabled ?
              TextEditingController(text: widget.loginViewModel.getShortNamaPengguna()) :
              widget.namaPenggunaController,
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.done,
              onEditingComplete: () => FocusScope.of(context)
                  .requestFocus(passwordFocusNode),
              onChanged: (value) {
                setState(() {
                  if (value.length > 16) {
                    value = value.substring(0, 16);
                    widget.namaPenggunaController.text = value;
                    widget.namaPenggunaController.selection =
                        TextSelection.fromPosition(
                            TextPosition(offset: value.length)
                        );
                  }
                  widget.loginViewModel.loginModel.namaPengguna = value;
                });
              },
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                labelText: Strings.loginNamaPenggunaString,
                labelStyle: GoogleFonts.poppins(
                    textStyle: TextStyle(
                        fontSize: ResponsiveLogin.costumeTextFieldLoginInputDanInputLabelTextFieldFontSize,
                        fontWeight: FontWeight.normal,
                        color: Colors.black)),
                prefixIcon: const Icon(
                  Icons.person,
                  color: Color.fromARGB(255, 72, 72, 72),
                ),
                suffixIcon: widget.loginViewModel.loginModel.isButtonGantiAkunEnabled
                    ? GestureDetector(
                  key: widget.keyGantiAkunButton,
                  onTap: () async {
                    // Logika untuk mengganti akun
                    if (widget.loginViewModel.loginModel.isButtonGantiAkunEnabled) {
                      try {
                        await widget.loginViewModel.userLogout().then((result) async {
                          Map<String, dynamic> responseBody = result['responseBody'];
                          int statusCode = result['statusCode'];

                          if(statusCode == 200) {
                            widget.loginViewModel.logoutModel.timeStamp = responseBody['timestamp'];
                            widget.loginViewModel.logoutModel.status = responseBody['status'];
                            widget.loginViewModel.logoutModel.message = responseBody['message'];
                            setState(() {});
                            Future.delayed(const Duration(seconds: 3), () {
                              widget.loginViewModel.showLogoutNotification();
                            });
                            await widget.loginViewModel.clearValue(lgnNmp3);
                            await widget.loginViewModel.clearValue(lgnKts3);
                            await widget.loginViewModel.clearValue(lgnTkn3);
                            widget.loginViewModel.loginModel.isButtonGantiAkunEnabled = false;
                            widget.loginViewModel.loginModel.namaPengguna = '';
                            widget.loginViewModel.loginModel.kataSandi = '';
                          } else {
                            widget.loginViewModel.logoutModel.timeStamp = responseBody['timestamp'];
                            widget.loginViewModel.logoutModel.status = responseBody['status'];
                            widget.loginViewModel.logoutModel.message = responseBody['message'];
                            if(widget.loginViewModel.logoutModel.message == 'SERVER MENGALAMI GANGGUAN, SILAHKAN COBA LAGI NANTI !!!') {
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
                                        widget.loginViewModel.logoutModel.message,
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
                            }else {
                              throw Exception('Error selain SERVER MENGALAMI GANGGUAN, SILAHKAN COBA LAGI NANTI !!!');
                            }
                          }
                        }).catchError((error) {
                          logger.i('Error during authentication: $error');
                          if(context.mounted) {
                            showDialog(
                              context: context,
                              barrierDismissible: false,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  key: const Key('AlertGetApiKey'),
                                  title: const Center(
                                    child:Text(
                                      Strings.loginPerhatianAlertGetApiKeyString,
                                      style: TextStyle(fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  content: const Text(
                                    Strings.loginPerhatianBodyAlertGetApiKeyString,
                                  ),
                                  actions: <Widget>[
                                    TextButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: const Text(
                                        Strings.loginPerhatianButtonOkString,
                                        style: TextStyle(color: Colors.blue),
                                      ),
                                    ),
                                  ],
                                );
                              },
                            );
                          }
                        });
                      } catch (e) {
                        // Menampilkan pesan alert jika terjadi kesalahan pada logout
                        if(context.mounted) {
                          showDialog(
                            context: context,
                            barrierDismissible: false,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: const Text(
                                  'Kesalahan Logout',
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                content: const Text(
                                  'Maaf server kami sedang ada kendala, silahkan tutup aplikasi dan coba lagi nanti.',
                                  style: TextStyle(
                                    fontSize: 14.0,
                                  ),
                                ),
                                actions: <Widget>[
                                  TextButton(
                                    key: widget.keyAlertOkGagalLogout,
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: const Text(
                                      'Tutup',
                                      style: TextStyle(
                                        color: Colors.blue,
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            },
                          );
                        }
                      }
                    }
                    widget.kataSandiController.text = '';
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.3,
                    color: LightAndDarkMode.buttonGantiAkun(context),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        child: Text(
                          Strings.loginGantiAkun,
                          style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                              color: Colors.white,
                              fontSize: ResponsiveLogin.costumeTextFieldLoginInputDanInputLabelTextFieldFontSize,
                              fontWeight: FontWeight.w600
                            )
                          ),
                        ),
                      ),
                    ),
                  )
                )
                    : null,
              ),
              cursorColor: Colors.black,
            ),
          ),
          SizedBox(
            height: ResponsiveLogin.costumeTextFieldSizeBoxHeight,
          ),
          Container(
            width: ResponsiveLogin.costumeTextFieldInputAndButtonWidth,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black, width: 1),
              borderRadius: BorderRadius.circular(5),
            ),
            child: TextField(
              key: widget.keyPasswordField,
              style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                      fontSize: ResponsiveLogin.costumeTextFieldLoginInputDanInputLabelTextFieldFontSize,
                      fontWeight: FontWeight.normal,
                      color: Colors.black)
              ),
              inputFormatters: [FilteringTextInputFormatter.deny(RegExp(r'[$`]'))],
              controller: widget.kataSandiController,
              keyboardType: TextInputType.text,
              focusNode: passwordFocusNode,
              obscureText: !widget.loginViewModel.kataSandiVisible,
              onChanged: (value) {
                setState(() {
                  if (value.length > 16) {
                    value = value.substring(0, 16);
                    widget.kataSandiController.text = value;
                    widget.kataSandiController.selection = TextSelection.fromPosition(
                        TextPosition(offset: value.length)
                    );
                  }
                  widget.loginViewModel.loginModel.kataSandi = value;
                });
              },
              decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  labelText: Strings.loginKataSandiString,
                  labelStyle: GoogleFonts.poppins(
                      textStyle: TextStyle(
                          fontSize: ResponsiveLogin.costumeTextFieldLoginInputDanInputLabelTextFieldFontSize,
                          fontWeight: FontWeight.normal,
                          color: Colors.black)),
                  prefixIcon: const Icon(
                      Icons.lock,
                      color: Color.fromARGB(255, 72, 72, 72)
                  ),
                  suffixIcon: IconButton(
                    key: widget.keyIconEye,
                    icon: Icon(
                      widget.loginViewModel.kataSandiVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                      color: Colors.black,
                    ),
                    onPressed: () {
                      setState(() {
                        widget.loginViewModel.kataSandiVisibility();
                      });
                    },
                  )),
              cursorColor: Colors.black,
            ),
          ),
          SizedBox(
            height: ResponsiveLogin.costumeTextFieldSizeBoxHeight,
          ),
          Row(
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.62,
                decoration: BoxDecoration(
                  color: widget.loginViewModel.loginModel.isButtonEnabled
                      ? LightAndDarkMode.primaryColor(context)
                      : Colors.grey,
                ),
                child: TextButton(
                  key: widget.keyLoginButton,
                  style: TextButton.styleFrom(
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.zero
                    ),
                  ),
                  onPressed:
                  widget.loginViewModel.loginModel.isButtonEnabled ? validateInput : null,
                  child: Text(
                    Strings.loginString,
                    style: TextStyle(
                      fontSize: ResponsiveLogin.costumeTextFieldTextButtonFontSize,
                      fontWeight: FontWeight.w600,
                      color: widget.loginViewModel.loginModel.isButtonEnabled
                          ? Colors.white
                          : Colors.blueGrey,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.15,
                  decoration: BoxDecoration(
                    color: LightAndDarkMode.primaryColor(context),
                  ),
                  child: TextButton(
                    key: widget.keyLoginButton,
                    style: TextButton.styleFrom(
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.zero
                      ),
                    ),
                    onPressed: () async {
                      await getAndroidVersion();
                    },
                    child: const Icon(
                      Icons.fingerprint_outlined,
                      color: Colors.white,
                    ),
                    ),
                  ),
                ),
            ],
          )
        ],
      ),
    );
  }
}