import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:febankflutter/utils/responsive/akun_ganti_password/responsive_akun_ganti_password.dart';
import 'package:febankflutter/utils/routes/route_paths.dart';
import 'package:febankflutter/utils/strings/strings.dart';
import 'package:febankflutter/utils/theme/light_and_dark.dart';
import 'package:febankflutter/viewmodels/akun_ganti_password_view_model.dart';
import 'package:febankflutter/viewmodels/login_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:logger/logger.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class GantiKataSandi extends StatefulWidget {
  const GantiKataSandi({super.key});

  @override
  State<GantiKataSandi> createState() => _GantiKataSandiState();
}

class _GantiKataSandiState extends State<GantiKataSandi> {
  late final TextEditingController kataSandiLamaController;
  late final TextEditingController kataSandiBaruController;
  late final TextEditingController konfirmasiKataSandiBaruController;
  final konfirmasiKataSandiBaruFocus = FocusNode();
  final kataSandiBaruFocus = FocusNode();
  final AkunGantiPasswordViewModel akunGantiPasswordViewModel = AkunGantiPasswordViewModel();
  final LoginViewModel loginViewModel = LoginViewModel();
  bool isPasswordValid = false;
  bool isLowerCaseValid = false;
  bool isUpperCaseValid = false;
  bool isNumberValid = false;
  var logger = Logger();
  final String lgnTkn1 = dotenv.get('LOGINTOKENISSUER');
  final String lgnTkn2 = dotenv.get('LOGINTOKENSECRETKEY');
  final String lgnTkn3 = dotenv.get('LOGINTOKENSHAREDPREFERENCES');

  @override
  void initState() {
    super.initState();
    kataSandiLamaController = TextEditingController(text: akunGantiPasswordViewModel.kataSandiLama)
      ..addListener(() {
        setState(() {
          akunGantiPasswordViewModel.updateKataSandiLama(kataSandiLamaController.text);
        });
      });
    kataSandiBaruController = TextEditingController(text: akunGantiPasswordViewModel.kataSandiBaru)
      ..addListener(() {
        setState(() {
          akunGantiPasswordViewModel.updateKataSandiBaru(kataSandiBaruController.text);
        });
      });
    konfirmasiKataSandiBaruController = TextEditingController(text: akunGantiPasswordViewModel.konfirmasiKataSandiBaru)
      ..addListener(() {
        setState(() {
          akunGantiPasswordViewModel.updateKonfirmasiKataSandiBaru(konfirmasiKataSandiBaruController.text);
        });
      });
    akunGantiPasswordViewModel.akunGantiPasswordModel
        .flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
    akunGantiPasswordViewModel.akunGantiPasswordModel
        .flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
        AndroidFlutterLocalNotificationsPlugin>()
        ?.requestNotificationsPermission();
    var initializationSettingsAndroid =
    const AndroidInitializationSettings('@mipmap/launcher_icon');
    var initializationSettingsIOS = const DarwinInitializationSettings();
    var initializationSettings = InitializationSettings(
        android: initializationSettingsAndroid, iOS: initializationSettingsIOS);
    akunGantiPasswordViewModel.akunGantiPasswordModel
        .flutterLocalNotificationsPlugin.initialize(initializationSettings);
    akunGantiPasswordViewModel.akunGantiPasswordModel.connectivitySubscription =
        Connectivity().onConnectivityChanged.listen((List<ConnectivityResult> result) {
          // Got a new connectivity status!
          if (result.contains(ConnectivityResult.mobile) ||
              result.contains(ConnectivityResult.wifi)) {
            setState(() {
              akunGantiPasswordViewModel.akunGantiPasswordModel.isConnected = true;
            });
          } else {
            setState(() {
              akunGantiPasswordViewModel.akunGantiPasswordModel.isConnected = false;
            });
          }
        });
  }

  @override
  void dispose() {
    super.dispose();
    kataSandiLamaController.dispose();
    kataSandiBaruController.dispose();
    konfirmasiKataSandiBaruController.dispose();
    konfirmasiKataSandiBaruFocus.dispose();
    kataSandiBaruFocus.dispose();
    akunGantiPasswordViewModel.akunGantiPasswordModel.connectivitySubscription?.cancel();
  }

  void validateInput() {
    if (!akunGantiPasswordViewModel.akunGantiPasswordModel.isConnected) {
      Fluttertoast.showToast(
        msg: 'KONEKSI INTERNET TERPUTUS, Untuk menjalankan Aplikasi Cordova Mobile, membutuhkan internet. Silakan periksa koneksi internet Anda!',
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.red,
      );
    } else if (kataSandiBaruController.text != konfirmasiKataSandiBaruController.text) {
      Fluttertoast.showToast(
        msg: 'KATA SANDI BARU TIDAK COCOK, Kata sandi Baru dan Konfirmasi kata sandi Baru tidak sama. Silakan cek kembali!',
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.red,
      );
    } else {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text(
              'Perhatian !',
              textAlign: TextAlign.center,
            ),
            content: const Text(
              'Apakah Anda yakin ingin mengganti password?',
              textAlign: TextAlign.center,
            ),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('Tidak'),
              ),
              TextButton(
                onPressed: () async {
                  akunGantiPasswordViewModel.userGantiPassword().then((result) async {
                    Map<String, dynamic> responseBody = result['responseBody'];
                    int statusCode = result['statusCode'];
                    if(statusCode == 200) {
                      akunGantiPasswordViewModel.akunGantiPasswordModel.timeStamp = responseBody['timestamp'];
                      akunGantiPasswordViewModel.akunGantiPasswordModel.status = responseBody['status'];
                      akunGantiPasswordViewModel.akunGantiPasswordModel.message = responseBody['message'];
                      akunGantiPasswordViewModel.akunGantiPasswordModel.token = responseBody['token'];
                      if (context.mounted) {
                        Navigator.of(context).pushNamedAndRemoveUntil(
                          RoutePaths.navigationBarCustome,
                              (Route<dynamic> route) => false,
                        );
                        Future.delayed(const Duration(seconds: 3), () {
                          akunGantiPasswordViewModel.showChangePasswordNotification();
                        });
                      }
                    } else {
                      akunGantiPasswordViewModel.akunGantiPasswordModel.timeStamp = responseBody['timestamp'];
                      akunGantiPasswordViewModel.akunGantiPasswordModel.status = responseBody['status'];
                      akunGantiPasswordViewModel.akunGantiPasswordModel.message = responseBody['message'];

                      if(
                        akunGantiPasswordViewModel.akunGantiPasswordModel.message == "Password anda salah, silahkan ketikan ulang kembali !!!" ||
                            akunGantiPasswordViewModel.akunGantiPasswordModel.message == "SERVER MENGALAMI GANGGUAN, SILAHKAN COBA LAGI NANTI !!!"
                      ) {
                        if (context.mounted) {
                          Navigator.of(context).pop();
                          showDialog(
                            context: context,
                            barrierDismissible: false,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text(
                                  Strings.loginInformasiString,
                                  style: GoogleFonts.poppins(
                                      textStyle: const TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold)),
                                  textAlign: TextAlign.center,
                                ),
                                content: Text(
                                  akunGantiPasswordViewModel.akunGantiPasswordModel.message,
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
                        throw Exception('Error selain 403 dengan message Password lama tidak di temukan !!!');
                      }
                    }
                  }).catchError((error) {
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
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold)),
                              textAlign: TextAlign.center,
                            ),
                            content: Text(
                              Strings.loginPerhatianBodyAlertGetApiKeyString,
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
                  });
                },
                child: const Text('Ya'),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    ResponsiveAkunGantiPassword.init(context);
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
                'Ganti Kata sandi',
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                    fontSize: ResponsiveAkunGantiPassword.akunGantiPasswordStringTitleFontSize,
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
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height - kToolbarHeight - MediaQuery.of(context).padding.top,
                  child: Center(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 30, bottom: 50),
                          child: Icon(
                            Icons.lock_person,
                            color: LightAndDarkMode.teksRead2(context),
                            size: ResponsiveAkunGantiPassword.akunGantiPasswordIconsSize,
                          ),
                        ),
                        Container(
                          width: ResponsiveAkunGantiPassword.akunGantiPasswordContainerTextFieldWidth,
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: LightAndDarkMode.cardColor1(context),
                                width: 3
                            ),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: TextField(
                            key: const Key('Kata sandi lama'),
                            style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                    fontSize: ResponsiveAkunGantiPassword.akunGantiPasswordTextFieldInputFontSize,
                                    fontWeight: FontWeight.normal,
                                    color: Colors.black
                                )
                            ),
                            inputFormatters: [FilteringTextInputFormatter.deny(RegExp(r'[$`]'))],
                            controller: kataSandiLamaController,
                            keyboardType: TextInputType.text,
                            textInputAction: TextInputAction.done,
                            onEditingComplete: () => FocusScope.of(context).requestFocus(kataSandiBaruFocus),
                            obscureText: !akunGantiPasswordViewModel.toggleButtonKataSandiLamaVisibility,
                            onChanged: (value) {
                              setState(() {
                                if (value.length > 16) {
                                  value = value.substring(0, 16);
                                  kataSandiLamaController.text = value;
                                  kataSandiLamaController.selection =
                                      TextSelection.fromPosition(
                                          TextPosition(offset: value.length)
                                      );
                                }
                                akunGantiPasswordViewModel.updateKataSandiLama(value);
                              });
                            },
                            decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                labelText: 'Kata sandi lama',
                                labelStyle: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                        fontSize: ResponsiveAkunGantiPassword.akunGantiPasswordTextFieldLabelFontSize,
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
                                    akunGantiPasswordViewModel.toggleButtonKataSandiLamaVisibility
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                    color: LightAndDarkMode.cardColor1(context),
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      akunGantiPasswordViewModel.updateToggleButtonKataSandiLamaVisibility();
                                    });
                                  },
                                )),
                            cursorColor: Colors.black,
                          ),
                        ),
                        const SizedBox(height: 20),

                        Container(
                          width: ResponsiveAkunGantiPassword.akunGantiPasswordContainerTextFieldWidth,
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: LightAndDarkMode.cardColor1(context),
                                width: 3
                            ),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: TextField(
                            key: const Key('Kata sandi baru'),
                            style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                    fontSize: ResponsiveAkunGantiPassword.akunGantiPasswordTextFieldInputFontSize,
                                    fontWeight: FontWeight.normal,
                                    color: Colors.black
                                )
                            ),
                            inputFormatters: [FilteringTextInputFormatter.deny(RegExp(r'[$`]'))],
                            controller: kataSandiBaruController,
                            keyboardType: TextInputType.text,
                            textInputAction: TextInputAction.done,
                            focusNode: kataSandiBaruFocus,
                            onEditingComplete: () => FocusScope.of(context).requestFocus(konfirmasiKataSandiBaruFocus),
                            obscureText: !akunGantiPasswordViewModel.toggleButtonKataSandiBaruVisibility,
                            onChanged: (value) {
                              setState(() {
                                if (value.length > 16) {
                                  value = value.substring(0, 16);
                                  kataSandiBaruController.text = value;
                                  kataSandiBaruController.selection =
                                      TextSelection.fromPosition(
                                          TextPosition(offset: value.length)
                                      );
                                }
                                akunGantiPasswordViewModel.updateKataSandiBaru(value);
                              });
                            },
                            decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                labelText: 'Kata sandi baru',
                                labelStyle: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                        fontSize: ResponsiveAkunGantiPassword.akunGantiPasswordTextFieldLabelFontSize,
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
                                    akunGantiPasswordViewModel.toggleButtonKataSandiBaruVisibility
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                    color: LightAndDarkMode.cardColor1(context),
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      akunGantiPasswordViewModel.updateToggleButtonKataSandiBaruVisibility();
                                    });
                                  },
                                )),
                            cursorColor: Colors.black,
                          ),
                        ),
                        const SizedBox(height: 20),

                        Container(
                          width: ResponsiveAkunGantiPassword.akunGantiPasswordContainerTextFieldWidth,
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: LightAndDarkMode.cardColor1(context),
                                width: 3
                            ),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: TextField(
                            key: const Key('konfirmasi kata sandi baru'),
                            style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                    fontSize: ResponsiveAkunGantiPassword.akunGantiPasswordTextFieldInputFontSize,
                                    fontWeight: FontWeight.normal,
                                    color: Colors.black
                                )
                            ),
                            inputFormatters: [FilteringTextInputFormatter.deny(RegExp(r'[$`]'))],
                            controller: konfirmasiKataSandiBaruController,
                            keyboardType: TextInputType.text,
                            focusNode: konfirmasiKataSandiBaruFocus,
                            obscureText: !akunGantiPasswordViewModel.toggleButtonKonfirmasiKataSandiBaruVisibility,
                            onChanged: (value) {
                              setState(() {
                                if (value.length > 16) {
                                  value = value.substring(0, 16);
                                  konfirmasiKataSandiBaruController.text = value;
                                  konfirmasiKataSandiBaruController.selection =
                                      TextSelection.fromPosition(
                                          TextPosition(offset: value.length)
                                      );
                                }
                                akunGantiPasswordViewModel.updateKonfirmasiKataSandiBaru(value);
                              });
                            },
                            decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                labelText: 'Konfirmasi kata sandi baru',
                                labelStyle: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                        fontSize: ResponsiveAkunGantiPassword.akunGantiPasswordTextFieldLabelFontSize,
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
                                    akunGantiPasswordViewModel.toggleButtonKonfirmasiKataSandiBaruVisibility
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                    color: LightAndDarkMode.cardColor1(context),
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      akunGantiPasswordViewModel.updateToggleButtonKonfirmasiKataSandiBaruVisibility();
                                    });
                                  },
                                )),
                            cursorColor: Colors.black,
                          ),
                        ),
                        const SizedBox(height: 20),

                        Container(
                          width: ResponsiveAkunGantiPassword.akunGantiPasswordContainerTextButtonWidth,
                          decoration: BoxDecoration(
                            color: akunGantiPasswordViewModel.akunGantiPasswordModel.isButtonEnabled
                                ? LightAndDarkMode.primaryColor(context)
                                : Colors.grey,
                          ),
                          child: TextButton(
                            style: TextButton.styleFrom(
                              shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.zero
                              ),
                            ),
                            onPressed: akunGantiPasswordViewModel
                                .akunGantiPasswordModel.isButtonEnabled
                                ? validateInput
                                : null,
                            child: Text(
                              'Ganti kata sandi',
                              style: TextStyle(
                                fontSize: ResponsiveAkunGantiPassword.akunGantiPasswordTextButtonFontSize,
                                fontWeight: FontWeight.w600,
                                color: akunGantiPasswordViewModel
                                    .akunGantiPasswordModel.isButtonEnabled
                                    ? Colors.white
                                    : Colors.blueGrey,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )
        ),
      ),
    );
  }
}
